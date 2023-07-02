import 'package:flutter/material.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2, //mỗi hàng sẽ có 2 Card.
          padding: const EdgeInsets.all(16.0),
          childAspectRatio: 1.0,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: [
            // List contains 4 children
            _buildCard(context, 'Users', Icons.people, Colors.blue),
            _buildCard(context, 'Orders', Icons.shopping_cart, Colors.green),
            _buildCard(context, 'Products', Icons.category, Colors.orange),
            _buildCard(context, 'Analytics', Icons.bar_chart, Colors.purple),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, String title, IconData icon, Color color) {
    return InkWell(
      onTap: () {
        // Navigate to the corresponding page
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 4.0,
        color: color, // Color for card
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64.0, color: Colors.white),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
