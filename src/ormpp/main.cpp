
#include "main.hpp"

#include "connection_pool.hpp"
#include "dbng.hpp"
#include "sqlite.hpp"

using namespace ormpp;
const std::string password = "";
const std::string ip = "127.0.0.1";
const std::string username = "root";
const std::string db = "test_ormppdb.sqlite";

struct person {
  std::optional<std::string> name;
  std::optional<int> age;
  int id;
};
REGISTER_AUTO_KEY(person, id)
REFLECTION(person, id, name, age)
// REFLECTION_WITH_NAME(person, "t_person", id, name, age)

struct student {
  std::string name;
  int age;
  int id;
};
REGISTER_AUTO_KEY(student, id)
REFLECTION_WITH_NAME(student, "t_student", id, name, age)

// databse
using namespace std;
using std::cout, std::endl;
int main(int argc, char *argv[]) {
  quill_init();
  LOG_INFO(logger, "Starting at {}!\n", mylocal_time());

  dbng<sqlite> sqlite;
  sqlite.connect(db.c_str());
  // sqlite.create_datatable<person>(ormpp_auto_key{"id"});
  // sqlite.create_datatable<student>(ormpp_auto_key{"id"});

  sqlite.create_datatable<person>();
  sqlite.create_datatable<student>();

  {
    sqlite.delete_records_s<person>();
    sqlite.insert<person>({"purecpp"});
    sqlite.insert<person>({"purecpp2", 6});
    sqlite.insert<person>({"purecpp3", 6});
    auto vec = sqlite.query_s<person>();
    //  auto vec = sqlite.query<person>("name='purecpp2'", "order by age desc");
    for (auto &[name, age, id] : vec) {
      std::cout << id << ", " << *name << ", " << *age << "\n";
    }
  }

  {
    // delete
    sqlite.delete_records_s<student>();
    // create  insert
    sqlite.insert<student>({"purecpp1", 11, 1});
    sqlite.insert<student>({"purecpp2", 12, 2});
    sqlite.insert<student>({"purecpp2", 13, 3});
    sqlite.insert<student>({"purecpp3", 14, 4});
    {
      // Read Retrieve query
      auto vec = sqlite.query_s<student>("name='purecpp2'", "order by age desc");
      for (auto &[name, age, id] : vec) {
        std::cout << id << ", " << name << ", " << age << "\n";
      }

      { // update
        student s = {"test1", 21, 1};
        student s1 = {"test2", 32, 2};
        student s2 = {"test3", 33, 3};
        // std::vector<person> v1{s, s1, s2};

        int ret = sqlite.update(s, "name='purecpp2'");
        std::cout << "ret:" << ret << std::endl;
      }
    }

    {
      auto vec = sqlite.query_s<student>("age=13", "order by id desc", "limit 1");
      for (auto &[name, age, id] : vec) {
        std::cout << id << ", " << name << ", " << age << "\n";
      }
    }
  }

  return 0;
}
