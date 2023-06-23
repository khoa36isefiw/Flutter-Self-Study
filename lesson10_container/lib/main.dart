import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: TransformContainer(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
// container

// Color
// khi co/ khong co child
// size: width and height
//algiment: Aligment, AligmentDirection, FractionalOffset
//padding
// margin
// direction
// transform

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Ngược lại nếu không có child thì container này nó sẽ bao quan toàn bộ  màn hình

      // chỉnh sửa kích thước của container
      width: 200,
      height: 200,
      // color: Colors.green,
      // căn chỉnh vị trí của

//algiment: Aligment, AligmentDirection, FractionalOffset

      //alignment: const FractionalOffset(0.75, 0.25),  // này thì ta chỉnh sửa nó theo trục toạ độ của nó
      alignment: Alignment.bottomCenter,
      child: const Text('Flutter',
          style: TextStyle(fontSize: 18, color: Colors.white)),
      //nó bao quanh child này thôi
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(30.0), // container này sẽ cách 4 phía 30px
      // decaration thường được sử dụng
      decoration: BoxDecoration(
        color: Colors.blue,
        // shape: BoxShape.circle,   // thay đổi container thành hình tròn

        // border radius for this rectangle
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(20)),

        // add border for this rectangle
        border: Border.all(
          width: 5,
          color: Colors.orange,
        ),
      ),
    );
  }
}

// Rotate Container follow Direction: X, Y, Z
class TransformContainer extends StatelessWidget {
  const TransformContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.blue,
      alignment: Alignment.center,
      transform: Matrix4.rotationZ(-0.2),
      child: const Text(
        'Flutter!',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
