import 'package:flutter/material.dart';
import 'package:lesson24_favorite_color/model/Favorites.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  static const routeName = 'favorites_page';
  static const fullPath = '/${routeName}';
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Color'),
      ),

      //cho phép lấy dữ liệu từ đối tượng được cung cấp bởi Provider
      //và tự động cập nhật lại giao diện khi dữ liệu thay đổi.
      body: Consumer<Favorites>(
        builder: (context, value, child) => value.items
                .isNotEmpty // kiểm tra nếu danh sách không rỗng trả về List items
            ? ListView.builder(
                itemCount: value.items.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) =>
                    FavoriteItemTile(value.items[index]),
              )
            : const Center(
                // Nếu Rỗng thì hiển thị đoạn Text này lên screen
                child: Text('No favorites added.'),
              ),
      ),
    );
  }
}

class FavoriteItemTile extends StatelessWidget {
  final int itemNo;

  const FavoriteItemTile(this.itemNo, {super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
      ),
      title: Text(
        'Item ${itemNo}',
        key: Key(
            'favorites_text_$itemNo'), //định danh cho tiêu đề của mục yêu thích
      ),
      trailing: IconButton(
          // hiện thị một icon button ở phía bên phải của ListTile
          // call back function when user clicks into this button
          onPressed: () {
            context
                .read<Favorites>()
                .remove(itemNo); // remove items from the Favorite list
            // display toast message
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Removed from Favorite List'),
                duration: Duration(seconds: 1), // hide SnackBar After 1 second
              ),
            );
          },
          // icon 'Close' lying on the right side of the items
          icon: const Icon(Icons.close),
          // dịnh danh icon remove
          key: Key('remove_icon_$itemNo')),
    );
  }
}
