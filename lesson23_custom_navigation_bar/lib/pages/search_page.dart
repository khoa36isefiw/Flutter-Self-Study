import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your search term',
                // suffix here means the icon will be behind the hintText
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search_rounded),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 20, // 20 element, each Element is built by ListTile
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Search Result ${index + 1}'),
                    subtitle: const Text('Lorem ipsum dolor sit amet'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
