import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:lesson57_sample_gui/pages/box/animated_container.dart';

class BouncingWidgetExample extends StatefulWidget {
  const BouncingWidgetExample({super.key});

  @override
  State<BouncingWidgetExample> createState() => _BouncingWidgetExampleState();
}

class _BouncingWidgetExampleState extends State<BouncingWidgetExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bouncing ',
          style: TextStyle(
            color: Colors.grey.shade900,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          /// Scale factor
          ///  < 0 => the bouncing will be reversed and widget will grow
          ///    1 => default value
          ///  > 1 => increase the bouncing effect
          ///
          children: [
            BouncingWidget(
              child: Text(
                'Bouncing Widget',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              onPressed: () {},
              scaleFactor: 1.5,
              duration: Duration(milliseconds: 100),
            ),
            const SizedBox(height: 30),
            BouncingWidget(
              onPressed: () {},
              duration: Duration(milliseconds: 2000),
              scaleFactor: 1,
              child: MaterialButton(
                onPressed: null,
                color: Colors.deepOrange,
                disabledColor: Colors.deepOrange,
                minWidth: 200,
                height: 50,
                child: Text(
                  'Click on Me',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            BouncingWidget(
              scaleFactor: -4,
              duration: const Duration(milliseconds: 10000),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey.shade400,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(0, 3),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
