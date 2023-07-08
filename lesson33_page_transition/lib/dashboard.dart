import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8),
            child: CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/images/img_rengoku_with_bong_ro.jpeg'),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Today',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  _exerciseToday(
                    taskName: 'Vung Kiếm',
                    times: '9 999',
                    color1: Colors.yellow[700],
                    color2: Colors.red.withOpacity(.7),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  _exerciseToday(
                    taskName: 'Chạy Bộ',
                    times: '10km',
                    color1: Colors.blue,
                    color2: Colors.blue.withOpacity(.7),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Sức mạnh cơ bắp',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    _makeActivity(text: 'Thiền định dưới thác nước'),
                    _makeActivity(text: 'Nâng những đóng củi 50kg'),
                    _makeActivity(text: 'Đẩy 1 hòn đá đi qua thị trấn'),
                    _makeActivity(text: 'Luyện tập phản đoàn'),
                    _makeActivity(text: 'Luyện tập sức dẻo dai'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _makeActivity({text}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(20),
        border: Border(
          bottom: BorderSide(
            color: Colors.green.shade500,
          ),
        ),
      ),
      child: Text(
        // 'Activity',
        text,
        style: TextStyle(
          color: Colors.grey[500],
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }

  Stack _exerciseToday({taskName, times, color1, color2}) {
    return Stack(
      children: [
        Container(
          width: 160,
          margin: const EdgeInsets.only(
            right: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                color1,
                color2,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // "Vung Kiếm",
                  taskName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  // "9 999",
                  times,
                  style: TextStyle(
                    color: Colors.grey[100],
                    fontWeight: FontWeight.w100,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
