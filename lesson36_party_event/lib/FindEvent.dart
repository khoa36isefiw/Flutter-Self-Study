import 'package:flutter/material.dart';

import 'Animations/FadeAnimation.dart';

class FindEvent extends StatelessWidget {
  const FindEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // O here meanas Opacity
      backgroundColor: Color.fromRGBO(246, 248, 251, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          size: 36,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/img_rengoku.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Transform.translate(
                offset: Offset(15, -15),
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.green.shade800,
                    ),
                    shape: BoxShape.circle,
                    color: Colors.yellow[800], // fill color for this decoration
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeAnimation(
                1,
                Container(
                  // vertical include: Top and Bottom
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    // color: Colors.green,
                    color: Colors.white,
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search_outlined),
                      border:
                          InputBorder.none, // remove underline of the TextField
                      hintText: 'Search Event',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              FadeAnimation(
                1.2,
                _makeEvent(
                    day: 10,
                    month: 'NOV',
                    image: 'img_event_fireworks.jpeg',
                    eventName: 'Fireworks 2023',
                    eventTime: '00:00'),
              ),
              const SizedBox(height: 30),
              FadeAnimation(
                1.2,
                _makeEvent(
                    day: 6,
                    month: 'DEC',
                    image: 'img_rengoku_with_bong_ro.jpeg',
                    eventName: 'Trận chiến với Bóng Rổ',
                    eventTime: '05:56 AM'),
              ),
              const SizedBox(height: 30),
              FadeAnimation(
                1.2,
                _makeEvent(
                    day: 8,
                    month: 'SEP',
                    image: 'img_giyuu1.png',
                    eventName: 'Trận chiến với Bóng Rổ',
                    eventTime: '04:40 AM'),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Row _makeEvent({day, month, image, eventName, eventTime}) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 200,
          margin: const EdgeInsets.only(
            right: 20,
          ),
          child: Column(
            children: [
              Text(
                // '10',
                day.toString(),
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                // 'July',
                month.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // color: Colors.blue.shade400,
              image: DecorationImage(
                image: AssetImage('assets/images/$image'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.1),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 'Fireworks 2023',
                    eventName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        // '00:00 PM',
                        eventTime.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
