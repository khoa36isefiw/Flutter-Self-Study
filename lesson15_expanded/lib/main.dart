import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Expanded in Flutter'),
            backgroundColor: Colors.blueAccent,
            leading: IconButton(
              icon: const Icon(Icons.menu),
              tooltip: 'Menu',
              onPressed: () {},
            ),
          ),
          body: MyWidget(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // chia bố cục theo chiều ngang
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          // child nằm trong container và nó nằm trong row
          // chiếm toàn bộ màn hình
          Expanded(
            flex: 1, // scale 1

            // chia tỉ lệ 1:1
            child: Container(
              color: Colors.green,
              height: 150,
            ),
          ),
          const SizedBox(
            // height: 10, // chỉ có tác dụng với dạng column
            width: 10, // thì chỉ tác dụng với dạng row
          ),

          // dùng để chia giao diện theo tỷ lệ đã biết trước rồi
          //used to divide the interface by the specified ratio
          Expanded(
            flex: 2, // customize tỷ lệ theo mong muốn
            child: Container(
              color: Colors.yellowAccent,
              height: 150,
            ),
          ),

          Expanded(
            flex: 3, // scale 1 - tỷ lệ 1
            child: Container(
              color: Colors.deepOrangeAccent,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}

// sắp xếp theo chiều dọc
class ExpandedByColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin for all child on this container Top, Left, Right, Bottom: 10px
      margin: const EdgeInsets.all(10),
      // contaier chứa các layout được chia theo chiều dọc
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blueGrey,
              height: 100,
            ),
          ),
          //add space for this
          const SizedBox(
            height: 50,
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.red,
              height: 100,
            ),
          ),
          //add thêm khoảng trắng cho nó
          const SizedBox(
            height: 10, // chỉ có tác dụng với dạng column
            //width: 10, // thì chỉ tác dụng với dạng row
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.yellowAccent,
              height: 100,
            ),
          ),
          const SizedBox(
            height: 10, // chỉ có tác dụng với dạng column
            //width: 10, // thì chỉ tác dụng với dạng row
          ),
          Expanded(
            child: Container(
              height: 100,
              color: Colors.amber,
              child: const Center(
                child: Text(
                  'Fourth Widget',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
