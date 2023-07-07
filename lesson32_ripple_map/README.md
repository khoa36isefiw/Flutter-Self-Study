# lesson32_ripple_map
Design Ripple Maps of Viet Nam
# Hoang Sa and Truong Sa belong to Viet Nam
## Design Maps Viet Nam
[<img src="assets/screenshot/img_HS.jpg" width="250">](assets/screenshot/img_HS.jpg)
[<img src="assets/screenshot/img_TS.jpg" width="250">](assets/screenshot/img_TS.jpg)
[<img src="assets/screenshot/img_VN.jpg" width="250">](assets/screenshot/img_VN.jpg)

### Note Source Code
- Add this line to dependencies:
  ```
   avatar_glow: ^2.0.2
  ```
- import to dart file
  ```
  import 'package:avatar_glow/avatar_glow.dart';
  ```
- Avatar Glow Widget with cool background glowing animation.
```
    //creates a sparkle effect around its child widget.
    child: AvatarGlow(
        //bán kính của hiệu ứng sáng lấp lánh.
        //radius of glitter effect.
        endRadius: 40,
        curve: Curves.bounceInOut,
        animate: true,
        //This is the pause between iterations of the glitter effect.
        repeatPauseDuration: const Duration(milliseconds: 500),
        //This is the color of the glitter effect.
        glowColor: Colors.deepOrange.shade700,
        child: Container(
          width: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green.shade700,
          ),
        ),
      ),
```
### Link to Avatar Glow
- https://pub.dev/packages/avatar_glow
- https://www.geeksforgeeks.org/flutter-using-the-avatar-glow/

