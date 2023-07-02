# lesson23_custom_navigation_bar
Design Bottom Navigation Bar

## GUI Bottom Navigation Bar
### Settings
  - Default Dark Mode <br>
  <img src="https://github.com/khoa36isefiw/Flutter-Self-Study/assets/97817877/95fa5663-7361-4d3c-965f-edce14e7ccac" alt="Alt text" width="400" height="800">
  
  - Choose Dark Mode <br>
  <img src="https://github.com/khoa36isefiw/Flutter-Self-Study/assets/97817877/8972c052-9b92-41d0-9cd8-78eb8329065d" alt="Alt text" width="400" height="800">  <br>
  
### Dashboard
<img src="https://github.com/khoa36isefiw/Flutter-Self-Study/assets/97817877/0f93e54b-5ac0-4d3f-864f-420379bd4704" alt="Alt text" width="400" height="800">  <br>

### Search
<img src="https://github.com/khoa36isefiw/Flutter-Self-Study/assets/97817877/c66a7b4e-9c26-4fde-a870-9cd0ff314f7e" alt="Alt text" width="400" height="800">

## Note Source Code
- ListTile: allow something stay at right side of it

  ```
    ListTile(
      title: const Text('Notifications'), // on left
      // switch button  for user to slide back and forth
      // khi người dùng chọn switch là thay đổi _notificationsEnabled

      trailing: Switch(  // on the right
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
  ```

  ```
    ListTile(
      title: const Text('Privacy policy'), // left side
      trailing: const Icon(Icons.arrow_forward_ios), // right side
      onTap: () {
        // Navigate to the privacy policy page
      },
    ),
  ```

- Suffix and Prefix in TextField
  - suffix: behind
  - prefix: font   
  ```
    TextField(
      decoration: InputDecoration(
        hintText: 'Enter your search term',  
        // suffix here means the icon will be behind the hintText
        suffixIcon: IconButton( // the icon is behind the hintText
          onPressed: () {},
          icon: const Icon(Icons.search_rounded),
        ),
      ),
    ),
  ```


