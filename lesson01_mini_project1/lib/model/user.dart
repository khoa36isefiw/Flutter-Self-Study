class User {
  // Khai báo thuộc tính của đối tượng
  // int id; // sẽ bị lỗi nên phải gán giá trị ban đầu hoặc chấp nhận nó null hoặc
  // late int id: tức là ta sẽ gán giá trị cho id sau đó

  // khai báo public
  // late int id; // late ở đây có nghĩa là sẽ sử dụng sau
  // late String name;

  // Khai báo kiểu private có dấu _variableName
  int _id;
  String _name;

  // constructor
  //User(this.id, this.name); // nên dùng hàm này hơn
  // User(int id, String name) {
  //   this.id = id;
  //   this.name = name;
  // }

  // khởi tạo có {}
  //User({this.id = 000, this.name = 'user'});
  //User({required this.id, required this.name});

  // mix cả 2 lại
  //User({required this.id, this.name = 'user name default'});

  // optional []
  //User(this.id, [this.name = 'optional']);
  User(this._id, [this._name = 'optional']);

  //int get id => _id;
  int get id {
    return _id;
  }

  set id(int value) {
    _id = value;
  }

  String get name => _name;
  set name(String value) {
    _name = value;
  }

  @override
  String toString() {
    // TODO: implement toString
    // trả về id và name của User
    return '$_id - $_name';
  }

  void logInfor() {
    print("Khoa COder ");
  }
}
