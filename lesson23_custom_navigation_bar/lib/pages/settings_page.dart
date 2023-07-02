import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  //kiểm soát trạng thái của tính năng thông báo và chế độ tối.
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  // define something for darkTheme
  // when user clicks into button switch Dark Mode
  final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.limeAccent, // change color for whole screen
    appBarTheme: AppBarTheme(
      color: Colors.yellow.shade900, // color for title
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(color: Colors.white),
    ),

    // Add more properties if needed
  );
  @override
  Widget build(BuildContext context) {
    return Theme(
      // dark Mode is choose --> darTheme
      // else --> default --> theme.Light
      data: _darkModeEnabled ? darkTheme : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(height: 16.0),
            // allow something stay at right side of it
            ListTile(
              title: const Text('Notifications'), // on left
              // switch button  for user to slide back and forth
              // khi người dùng chọn switch là thay đổi _notificationsEnabled

              trailing: Switch(
                value: _notificationsEnabled,
                onChanged: (value) {
                  //cập nhật trạng thái
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
              subtitle: Text('Send Notification'),
            ),
            const Divider(),
            ListTile(
              title: const Text('Dark mode'),
              // khi người dùng chọn switch là thay đổi _darkModeEnabled
              trailing: Switch(
                value: _darkModeEnabled,
                onChanged: (value) {
                  setState(() {
                    _darkModeEnabled = value;
                  });
                },
              ),
            ),
            const Divider(),
            //một tiêu đề và một Icon,
            ListTile(
              title: const Text('Edit profile'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to the edit profile page
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Privacy policy'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to the privacy policy page
              },
            ),
            const Divider(), // separator line
          ],
        ),
      ),
    );
  }
}
