class User {
  final String name;
  final String userName;
  final String image;
  bool _isFollowByMe;
  User(this.name, this.userName, this.image, this._isFollowByMe);

  bool get isFollowByMe {
    return _isFollowByMe;
  }

  set isFollowByMe(bool newValue) {
    _isFollowByMe = newValue;
  }
}
