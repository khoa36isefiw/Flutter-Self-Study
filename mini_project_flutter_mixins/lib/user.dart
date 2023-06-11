// thay vì sử dụng extends hay implements
// thì chúng ta sử dụng with Mixins

import 'package:mini_project_flutter_mixins/readbook.dart';

import 'eat.dart';
import 'person.dart';
import 'football.dart';
import 'musical_instrumental.dart';

// Mixins là đặc trưng đi chung với 'with'

class User extends Person with Football, MusicalIntrumental, Book, Eating {
  late int id;
  late String name;

  // Constructor
  User(this.id, this.name);

  void printFavorite() {
    logFootball();
    readBook();
    eat();
  }

  // tính chất giống như hàm kế thừa. Nếu ta dùng abstract class
  @override
  void soundGuitar() {
    // TODO: implement soundGuitar
    print('I also don`t` know it sounds');
  }

  @override
  void eatWhat() {
    // TODO: implement eatWhat
    print('Ăn gì cũng được');
  }
}
