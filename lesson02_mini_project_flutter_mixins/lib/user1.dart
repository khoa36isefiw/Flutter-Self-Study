//mixin User1 with Eating{}   // sẽ không sử dụng được
import 'package:mini_project_flutter_mixins/user.dart';

class User1 extends User {
  // cause extend from Person
  User1(super.id, super.name);

  void logInformation() {
    logMyExtension();
  }
}
