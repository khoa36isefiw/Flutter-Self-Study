import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          // add title -- banner for this app
          appBar: AppBar(
            title: const Text('Button Design'),
          ),
          body: const MyWidget(),
        ),
      ),
      debugShowCheckedModeBanner: false, // hide the debug logo
    ),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),

          // child-1
          // Floating Button
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: FloatingActionButton.extended(
              label: const Text('Download'), // <-- Text
              backgroundColor: Colors.black,
              icon: const Icon(
                // <-- Icon
                Icons.download,
                size: 24.0,
              ),
              onPressed: () {
                // send message to user who clicks into this button
                var snackBar = const SnackBar(
                  content: Text('This button is called Floating Button....'),
                );

                // show message when user clicks into this button
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ),

          // child-2
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton.icon(
              // <-- ElevatedButton
              onPressed: () {
                var snackBar = const SnackBar(
                    content: Text('This button is called Elevated Button...'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: const Icon(
                Icons.download,
                size: 24.0,
              ),
              label: const Text('Download'),
            ),
          ),

          // child-3    --> TextButton
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextButton.icon(
              // <-- TextButton
              onPressed: () {
                var snackBar = const SnackBar(
                    content: Text('This button is called Text Button ...'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: const Icon(
                Icons.download,
                size: 24.0,
              ),
              label: const Text('Download'),
            ),
          ),

          // child-4
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.people_outline_sharp),
              label: const Text('Login'),
            ),
          ),

          // child-5
          ElevatedButton(
            onPressed: () {},
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Favorites'), // đặt text trước
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.favorite_border_outlined,
                  size: 24.0,
                ),
              ],
            ),
          ),

          // child-6  - Circle button
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: SizedBox.fromSize(
              size: const Size(80, 80),
              child: ClipOval(
                child: Material(
                  color: Colors.amberAccent,
                  child: InkWell(
                    splashColor: Colors.green,
                    onTap: () {
                      const snackBar = SnackBar(
                        content: Text(" You just Tapped on the Button"),
                        backgroundColor: Colors.orange,
                      );

                      // ignore: deprecated_member_use
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    onLongPress: () {
                      const snackBar = SnackBar(
                        content: Text("You just long held this button"),
                        backgroundColor: Colors.purple,
                      );

                      // ignore: deprecated_member_use
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.shopping_cart), // <-- Icon
                        Text(
                          "Buy",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ), // <-- Text
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          //child-7
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              width: 100,
              height: 100,
              // we also can use - size: (100, 100),
              child: ClipOval(
                // make circle button
                child: Material(
                  color: Colors.green,
                  child: InkWell(
                    // change another color very fast when user clicks
                    // into this button
                    splashColor: Colors.red,
                    onTap: () {}, // không có onTap
                    //thì không có spashColor được

                    child: const Column(
                      // set for text and icon
                      mainAxisAlignment: MainAxisAlignment.center,
                      // array children
                      // can't use '.icon' at here
                      // ==> use Library <Widget>
                      children: <Widget>[
                        Icon(
                          Icons.coffee_maker,
                          size: 30,
                        ),
                        Text(
                          'Coffee',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple),
                        )
                      ],
                    ),
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
