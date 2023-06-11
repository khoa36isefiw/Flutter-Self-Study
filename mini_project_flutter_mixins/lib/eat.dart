// ngoài 2 class: abstract, class thì chúng ta có thể dùng minxin

import 'package:mini_project_flutter_mixins/person.dart';

//nhung class nao ke thua person thi moi su dung duoc eating
mixin Eating on Person {
  void eat() {
    print('Có ăn là mừng rồi!');
  }

  void eatWhat();
}
