import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Stack in Flutter'),
          ),
          body: const MyWidget(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

// width and height
// fit
// alignment
// textDirection
// clipBehavior

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      width: 500,
      height: 500,
      //Stack sắp xếp các widget đè chồng lên nhau
      child: Stack(
        // thì container được thêm sau cùng sẽ expand ra full màn hình
        // fit: StackFit.expand,
        fit: StackFit.loose,
        // direction sẽ được ưu tiên hơn khi so với alignment
        alignment: Alignment.center,
        // textDirection: TextDirection.rtl,

        // khi Xài Align, Positioned thì một số thuộc tính của Stack không nhận

        // clipbehavior
        clipBehavior: Clip.none, // không có này thì không thể tràn ra ngoài
        children: [
          Container(
            color: Colors.blue,
            width: 300,
            height: 300,
          ),

          // điều chỉnh một container vào một vị trí cụ thể
          Positioned(
            left: 30,
            top: 70,
            child: Container(
              color: Colors.greenAccent,
              height: 200,
              width: 200,
            ),
          ),

          // căn chỉnh một container trong stacks
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              color: Colors.yellow,
              // không thể tràn ra ngoài container nếu không có clipBehavior
              height: 800,
              width: 100,
            ),
          ),
          Container(
            color: Colors.red,
            width: 70,
            height: 70,
          ),
          Container(
            color: Colors.brown,
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}

class OverFlowContainer extends StatelessWidget {
  const OverFlowContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      width: 500,
      height: 500,
      //Stack sắp xếp các widget đè chồng lên nhau
      child: Stack(
        // thì container được thêm sau cùng sẽ expand ra full màn hình
        // fit: StackFit.expand,
        fit: StackFit.loose,
        // direction sẽ được ưu tiên hơn khi so với alignment
        alignment: Alignment.center,
        // textDirection: TextDirection.rtl,

        // khi Xài Align, Positioned thì một số thuộc tính của Stack không nhận

        // clipbehavior
        clipBehavior: Clip.none,
        children: [
          Container(
            color: Colors.blue,
            width: 300,
            height: 300,
          ),

          // điều chỉnh một container vào một vị trí cụ thể
          Positioned(
            left: 30,
            top: 70,
            child: Container(
              color: Colors.greenAccent,
              height: 200,
              width: 200,
            ),
          ),

          // căn chỉnh một container trong stacks
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              color: Colors.yellow,
              height:
                  800, // không thể tràn ra ngoài container nếu không có clipBehavior
              width: 100,
            ),
          ),
          Container(
            color: Colors.red,
            width: 70,
            height: 70,
          ),
          Container(
            color: Colors.brown,
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}
