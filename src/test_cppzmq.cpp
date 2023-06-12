

#include "zmq.hpp"
#include "zmq_addon.hpp"

#include "main.hpp"

using std::string;
using njson = nlohmann::json;
using namespace nlohmann::literals;
struct User
{
    int id;
    string name;
};

int cppzmq_app(void);
void PublisherThread(zmq::context_t *ctx);
void PublisherThread(zmq::context_t *ctx);
void SubscriberThread1(zmq::context_t *ctx);
void SubscriberThread2(zmq::context_t *ctx);

void PublisherThread(zmq::context_t *ctx)
{
    //  Prepare publisher
    LOG_S(INFO) << "pub" << endl;
    zmq::socket_t publisher(*ctx, zmq::socket_type::pub);
    LOG_S(INFO) << "pub" << endl;
    publisher.bind("tcp://127.0.0.1:9872");
    LOG_S(INFO) << "pub" << endl;
    // Give the subscribers a chance to connect, so they don't lose any messages
    std::this_thread::sleep_for(std::chrono::milliseconds(20));

    LOG_S(INFO) << "pub" << endl;
    // Tojson();
    User u;
    string data = R"({\"id\":12345, \"name\":\"test\"})";
    LOG_S(INFO) << "data json:" << data;

    int cnt = 0;
    while (true)
    {
        cnt++;
        if (cnt > 100)
        {
            cnt = 0;
        }
        u.id = 1230 + cnt;
        u.name="testname";

        njson jstr;
        jstr["id"] = u.id;
        jstr["name"] = u.name;
        LOG_S(INFO) << "json:" << jstr.dump() << endl;
        LOG_S(INFO) << "json size:" << jstr.dump().size() << endl;

#define json_max_len 255
        char str_test[json_max_len];
        strncpy(str_test, jstr.dump().c_str(), jstr.dump().size()); // "a lo"
        str_test[jstr.dump().size()] = '\0';                        // putting terminating character at the end

        //  Write three messages, each with an envelope and content
        // publisher.send(zmq::str_buffer("A"), zmq::send_flags::sndmore);
        // publisher.send(zmq::str_buffer("Message in A envelope"));
        // publisher.send(zmq::str_buffer("B"), zmq::send_flags::sndmore);
        // publisher.send(zmq::str_buffer("Message in B envelope"));
        // publisher.send(zmq::str_buffer("C"), zmq::send_flags::sndmore);
        // publisher.send(zmq::str_buffer(str_test));
        // without envlope ,to plotjuggler
        publisher.send(zmq::str_buffer(str_test));

        std::this_thread::sleep_for(std::chrono::milliseconds(1));
    }
}

void SubscriberThread1(zmq::context_t *ctx)
{
    //  Prepare subscriber
    zmq::socket_t subscriber(*ctx, zmq::socket_type::sub);
    subscriber.connect("tcp://127.0.0.1:9872");
    //  Thread2 opens "A" and "B" envelopes
    subscriber.set(zmq::sockopt::subscribe, "A");
    subscriber.set(zmq::sockopt::subscribe, "B");

    while (1)
    {
        // Receive all parts of the message
        LOG_S(INFO) << "sub1" << endl;
        std::vector<zmq::message_t> recv_msgs;
        zmq::recv_result_t result =
            zmq::recv_multipart(subscriber, std::back_inserter(recv_msgs));
        assert(result && "recv failed");
        assert(*result == 1);

        std::cout << "Thread2: [" << recv_msgs[0].to_string() << "] "
                  << std::endl;
    }
}

void SubscriberThread2(zmq::context_t *ctx)
{
    //  Prepare our context and subscriber
    zmq::socket_t subscriber(*ctx, zmq::socket_type::sub);
    subscriber.connect("tcp://127.0.0.1:9872");

    //  Thread3 opens ALL envelopes
    subscriber.set(zmq::sockopt::subscribe, "");

    while (1)
    {
        // Receive all parts of the message
        LOG_S(INFO) << "pub2" << endl;
        std::vector<zmq::message_t> recv_msgs;
        zmq::recv_result_t result =
            zmq::recv_multipart(subscriber, std::back_inserter(recv_msgs));
        assert(result && "recv failed");
        assert(*result == 1);

        LOG_S(INFO) << "Thread3: [" << recv_msgs[0].to_string()
                    << std::endl;
    }
}

int cppzmq_app()
{

    LOG_S(INFO) << "cppzmq_app." << endl;
    /*
     * No I/O threads are involved in passing messages using the inproc transport.
     * Therefore, if you are using a ØMQ context for in-process messaging only you
     * can initialise the context with zero I/O threads.
     *
     * Source: http://api.zeromq.org/4-3:zmq-inproc
     */
    zmq::context_t ctx(1); // ctx(0); 0 for inproc ,1 for tcp

    LOG_S(INFO) << "cppzmq_app." << endl;
    auto thread1 = std::async(std::launch::async, PublisherThread, &ctx);
    LOG_S(INFO) << "pub create." << endl;
    // Give the publisher a chance to bind, since inproc requires it
    std::this_thread::sleep_for(std::chrono::milliseconds(10));

    LOG_S(INFO) << "delay." << endl;
    auto thread2 = std::async(std::launch::async, SubscriberThread1, &ctx);
    LOG_S(INFO) << "sub1 create." << endl;
    auto thread3 = std::async(std::launch::async, SubscriberThread2, &ctx);
    LOG_S(INFO) << "sub2 create." << endl;
    thread1.wait();
    thread2.wait();
    thread3.wait();

    LOG_S(INFO) << "cppzmq_app end ." << endl;
    /*
     * Output:
     *   An infinite loop of a mix of:
     *     Thread2: [A] Message in A envelope
     *     Thread2: [B] Message in B envelope
     *     Thread3: [A] Message in A envelope
     *     Thread3: [B] Message in B envelope
     *     Thread3: [C] Message in C envelope
     */
    return true;
}
