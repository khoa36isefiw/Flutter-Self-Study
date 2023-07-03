import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson24_favorite_color/screen/favoritePage.dart';
import 'package:provider/provider.dart';

import '../model/Favorites.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List Colors',
          style: TextStyle(
            fontSize: 26,
            color: Colors.blue.shade300,
            fontWeight: FontWeight.bold,
          ),
        ),
        // action do something on this button
        actions: [
          //định nghĩa các hành động mà người dùng
          //có thể thực hiện trên thanh ứng dụng.
          TextButton.icon(
            onPressed: () {
              // move to Favorite List
              context.go(FavoritePage.fullPath);
            },
            icon: Icon(Icons.favorite, color: Colors.red.shade300),
            label: Text(
              'Favorites',
              style: TextStyle(
                fontSize: 20,
                color: Colors.red.shade300,
              ),
            ),
          ),
          FloatingActionButton(
            // change color to transparent
            backgroundColor: Colors.transparent,
            // user elevation to hide the frame of button
            elevation: 0,
            onPressed: () {
              // function show a dialog center screen
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Chia sẻ'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text('Facebook'),
                          leading: Icon(Icons.facebook),
                          onTap: () {
                            // Xử lý sự kiện khi người dùng chọn chia sẻ trên Facebook
                            Navigator.pop(context, 'Facebook');
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.share),
                          title: Text('Zalo'),
                          onTap: () {
                            // Xử lý sự kiện khi người dùng chọn chia sẻ trên Zalo
                            Navigator.pop(context, 'Zalo');
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: const Icon(
              Icons.share_rounded,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 100, // loop to make 100 elements
        cacheExtent: 20.0,
        controller: ScrollController(),
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemTile(index),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(this.itemNo, {super.key});
  @override
  Widget build(BuildContext context) {
    final favoritesList = context.watch<Favorites>();
    // TODO: implement build
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
      ),
      title: Text(
        // left side
        'Item $itemNo',
        key: Key(
          'text_$itemNo',
        ),
      ),
      // icon stay right side
      trailing: IconButton(
        key: Key('icon_$itemNo'),
        icon: favoritesList.items.contains(itemNo)
            ? const Icon(
                Icons.favorite, // added into list favorites
                color: Colors.red,
              )
            : const Icon(
                Icons.favorite_border, // not add
              ),
        onPressed: () {
          // nếu trong list có item và được click vào thì
          !favoritesList.items.contains(itemNo)
              ? favoritesList.add(itemNo) // thêm nó vào list
              : favoritesList.remove(itemNo); // đã có mà click vào thì remove
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                favoritesList.items.contains(itemNo)
                    ? 'Added to Favorite List'
                    : 'Removed from the Favorite List',
              ),
              duration: const Duration(seconds: 1),
            ),
          );
        },
      ),
    );
  }
}
