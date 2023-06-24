// user kế thừa lớp person

import 'package:mini_project_flutter_2/people.dart';

import 'address.dart';
import 'city.dart';

class User implements City, Address {
  int id = 0; // public
  String name = '';

  // constructor
  // do lớp cha nó constructor là age
  // super khới tao age là 0 - thay đổi nó thành 18

  User(this.id, this.name);

  //getter and setter
  void logInformation() {
    print('$id- $name');
  }

  @override
  void function1() {
    // TODO: implement function1
    print('Hàm được override lại từ Class City');
  }

  @override
  void showCity() {
    // TODO: implement function2
    // print(
    //     'Khi implement mà override lại chỉ gọi đến nó\n mà không làm gì thì nó cũng không hoạt động!');
  }

  // override function of Class Address
  @override
  void showAddress() {
    print('SOOS 1 VOX VAAN NGAAN');
  }
}
