import '../model/user.dart';

class UsersList {
  final List<User> userList = [
    User(
      'Rengoku Kyoujurou',
      '@kyoujuro',
      'assets/images/img_rengoku_back.jpeg',
      true,
    ),
    User(
      'Tomioka Giyuu',
      '@giyuu',
      'assets/images/img_giyuu1.png',
      false,
    ),
    User(
      'Kochou Shinobu',
      '@shinobu',
      'assets/images/img_shinobu_dance_moon.jpeg',
      false,
    ),
    //mitsuri kanroji
    User(
      'Mitsuri Kanroji',
      '@kanroji',
      'assets/images/img_mitsuri_moon.jpeg',
      false,
    ),
    User(
      'Uzui Tengen',
      '@tengen',
      'assets/images/img_tengen_moon.png',
      false,
    ),
    User(
      'Kamado Tanjiro',
      '@tanjiro',
      'assets/images/img_tanjiro_moon.jpeg',
      false,
    ),
    User(
      'Agatsuma Zenitsu',
      '@zenistu',
      'assets/images/img_zenitsu_moon.jpeg',
      false,
    ),
    User(
      'Hashibira Inosuke',
      '@inosuke',
      'assets/images/img_inosuke_moon.jpeg',
      false,
    ),
  ];

  List<User> foundUsers = [];
}
