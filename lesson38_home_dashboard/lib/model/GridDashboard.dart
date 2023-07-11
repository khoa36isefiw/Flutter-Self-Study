import 'package:flutter/material.dart';

import 'Items.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = Items(
    title: 'Calendar',
    subTitle: 'March, Wednesday',
    event: '3 Events',
    image: 'assets/images/img_calendar.png',
  );

  Items item2 = Items(
    title: "Groceries",
    subTitle: "Bocali, Apple",
    event: "4 Items",
    image: "assets/images/img_food.png",
  );
  Items item3 = Items(
    title: "Locations",
    subTitle: "Lucy Mao going to Office",
    event: "",
    image: "assets/images/img_map.png",
  );
  Items item4 = Items(
    title: "Activity",
    subTitle: "Rose favirited your Post",
    event: "",
    image: "assets/images/img_festival.png",
  );
  Items item5 = Items(
    title: "To do",
    subTitle: "Homework, Design",
    event: "4 Items",
    image: "assets/images/img_todo.png",
  );
  Items item6 = Items(
    title: "Settings",
    subTitle: "",
    event: "2 Items",
    image: "assets/images/img_setting.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> itemList = [item1, item2, item3, item4, item5, item6];
    var color = 0xff453658;

    return Flexible(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: itemList
            .map(
              (item) => Container(
                decoration: BoxDecoration(
                  color: Color(color),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // image
                    Image.asset(
                      item.image,
                      width: 40,
                    ),
                    //title
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      item.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // subTitle
                    Text(
                      item.subTitle,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // event
                    Text(
                      item.event,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
