#include "main.hpp"

class client_test
{
private:
    /* data */
public:
    client_test(/* args */);
    ~client_test();
inline    static void init(void);
};

client_test::client_test(/* args */)
{
    //LOG_S(INFO) << "client_test";
}
void client_test::init(void)
{

    //LOG_S(INFO) << "client_test init.";
}

client_test::~client_test()
{
}
