import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
            backgroundColor: Colors.deepPurpleAccent,
            //add Icon for banner
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              // display information when user hover into icon
              tooltip: 'Return Manage Account',
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
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          // child-1
          const Row(
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  'User Name:',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              Text(
                'Senko-sans',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),

          // child-2
          const Row(
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  'Address:',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              Text(
                'I come from Japan',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          // child-3
          const Row(
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  'Email:',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              Text(
                'senkocompany@gmail.jp',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),

          // child -4
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              // child-4.1
              Expanded(
                flex: 1,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  onPressed: () {},
                  label: const Text(
                    'Cancel',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  icon: const Icon(
                    Icons.cancel_outlined,
                    size: 14,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),

              Expanded(
                flex: 1,
                child: FloatingActionButton.extended(
                  onPressed: () {},
                  label: const Text('Submit'),
                  icon: const Icon(
                    Icons.send_outlined,
                    size: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
