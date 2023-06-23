import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: MyWidget(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Row(
        // căn chỉnh 3 nội dung bên trong nó
        // dùng để gói gọn trong vùng nhỏ nhất của nó
        // width thì nó sẽ nằm theo chiều dọc của 3 button
        // mainAxisSize: MainAxisSize.min,

        // ngược lại max thì nó gói gọn width - tương tự với wrap_content
        mainAxisSize: MainAxisSize.max,

        // căn chỉnh các child nằm trong children nằm theo chiều định nghĩa
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        // căn chinh theo chiều dọc
        crossAxisAlignment: CrossAxisAlignment.center,

        // children la mot array
        children: [
          // is a Array

          // child 1
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
            child: const Text(
              'Button1',
              style: TextStyle(fontSize: 20),
            ),
          ),

          // child 2
          Container(
            height: 100,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Button2',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
          ),

          // child 3
          ElevatedButton.icon(
            onPressed: () {
              var snackBar = const SnackBar(
                content: Text('Downloading...'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
              foregroundColor: Colors.yellow,
            ),
            label: const Text(
              'Download ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            icon: const Icon(
              Icons.download,
              size: 12,
            ),
          )
        ],
      ),
    );
  }
}
