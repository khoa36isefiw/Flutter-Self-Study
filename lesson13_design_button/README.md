# lesson13_design_button

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# GUI for this Mini Project
![Alt text](image-1.png)

# Hold in Button Buy
- We get two results:
     + onTap
     ![Alt text](image-2.png)
     + onLongTap - Press this button more 2 seconds
     ![Alt text](image-3.png)


# Toast Message 
var snackBar = const SnackBar(
    content: Text('Message In Here ...'));
ScaffoldMessenger.of(context).showSnackBar(snackBar);


