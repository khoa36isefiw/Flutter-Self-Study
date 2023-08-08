import 'package:flutter/material.dart';
import 'package:lesson57_sample_gui/pages/buttons/sample_circle_button.dart';
import 'package:lesson57_sample_gui/pages/buttons/sample_elevated_button.dart';
import 'package:lesson57_sample_gui/pages/buttons/sample_outlined_button.dart';

class SimpleButtons extends StatelessWidget {
  const SimpleButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Simple with colors properly styled',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SimpleElevatedButton(
                    color: Colors.blue,
                    onPressed: () {},
                    child: const Text('Elevated Button'),
                  ),
                  SimpleOutlinedButton(
                    onPressed: () {},
                    outlineColor: Colors.blue,
                    child: const Text('Outlined Button'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SimpleElevatedButton(
                    color: Colors.green,
                    onPressed: () {},
                    child: const Text('Elevated Button'),
                  ),
                  SimpleOutlinedButton(
                    onPressed: () {},
                    outlineColor: Colors.green,
                    child: const Text('Outlined Button'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SimpleElevatedButton(
                    color: Colors.amber,
                    onPressed: () {},
                    child: const Text('Elevated Button'),
                  ),
                  SimpleOutlinedButton(
                    onPressed: () {},
                    outlineColor: Colors.amber,
                    child: const Text('Outlined Button'),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Simple with icons & colors',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 6),
              Column(
                children: [
                  SimpleElevatedButtonWithIcon(
                    label: const Text('Done'),
                    iconData: Icons.check,
                    color: Colors.green,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 12),
                  SimpleElevatedButtonWithIcon(
                    label: const Text('Warning!'),
                    iconData: Icons.warning_amber_outlined,
                    color: Colors.amber,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 12),
                  SimpleElevatedButtonWithIcon(
                    label: const Text('ERROR'),
                    iconData: Icons.error_outline,
                    color: Colors.red,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Simple circular with icons',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SimpleCircularIconButton(
                    iconData: Icons.remove,
                    // background color contains icon
                    fillColor: Colors.red,
                    // color for icon
                    iconColor: Colors.white,
                    radius: 32,
                    onPressed: () {},
                  ),
                  SimpleCircularIconButton(
                    iconData: Icons.add,
                    fillColor: Colors.green,
                    iconColor: Colors.white,
                    radius: 48,
                    onPressed: () {},
                  ),
                  SimpleCircularIconButton(
                    iconData: Icons.edit,
                    onPressed: () {},
                  ),
                  SimpleCircularIconButton(
                    iconData: Icons.check,
                    iconColor: Colors.green,
                    outlineColor: Colors.green,
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'And with alerts',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SimpleCircularIconButton(
                    iconData: Icons.warning_amber_outlined,
                    fillColor: Colors.amber, // color of container
                    iconColor: Colors.white, // color of icon
                    onPressed: () {},
                    radius: 32, // size for container
                    notificationCount: 2, // number of notifications
                  ),
                  SimpleCircularIconButton(
                    iconData: Icons.new_releases_outlined,
                    fillColor: Colors.blue,
                    iconColor: Colors.white,
                    onPressed: () {},
                    notificationCount: 4,
                  ),
                  SimpleCircularIconButton(
                    iconData: Icons.messenger_outline_sharp,
                    fillColor: Colors.green,
                    iconColor: Colors.white,
                    onPressed: () {},
                    radius: 64,
                    notificationCount: 6,
                  ),
                  SimpleCircularIconButton(
                    iconData: Icons.notifications,
                    fillColor: Colors.amber,
                    iconColor: Colors.white,
                    onPressed: () {},
                    radius: 80,
                    notificationCount: 8,
                  ),
                ],
              ),
              //   'Create an icon with notifications',
              const SizedBox(height: 30),
              const Text(
                'Create an icon with notifications',
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    // color: Colors.blueAccent,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green,
                    ),
                    child: Stack(
                      children: [
                        const Center(
                          child: Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                              child: Text(
                                '1',
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.amberAccent.shade700,
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Icon(
                            Icons.message,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleElevatedButtonWithIcon extends StatelessWidget {
  const SimpleElevatedButtonWithIcon(
      {required this.label,
      this.color,
      this.iconData,
      required this.onPressed,
      this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      Key? key})
      : super(key: key);
  final Widget label;
  final Color? color;
  final IconData? iconData;
  final Function onPressed;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed as void Function()?,
      icon: Icon(iconData),
      label: label,
      style: ElevatedButton.styleFrom(backgroundColor: color, padding: padding),
    );
  }
}
