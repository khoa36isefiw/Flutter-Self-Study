# lesson24_favorite_color
Design the Color Favorites List according to flutter's template

## Favorite GUI
- List Colors Home  <br> 
<img src="https://github.com/khoa36isefiw/Flutter-Self-Study/assets/97817877/0b6ea50a-09ea-49d1-9442-62934b6e8d03" alt="Alt text" width="400" height="800"> <br>

- Favorite List <br>
<img src="https://github.com/khoa36isefiw/Flutter-Self-Study/assets/97817877/45558647-5c16-44c4-866f-90cd14578218" alt="Alt text" width="400" height="800"><br>


- Share GUI <br>
<img src="https://github.com/khoa36isefiw/Flutter-Self-Study/assets/97817877/d8fa579e-36aa-49b8-9084-8722276f2d86" alt="Alt text" width="400" height="800">  <br>
## Note Source Code

- Show Dialog
  - I created a 'Share' button with 2 options: Share to Facebook or Zalo
    
    ```
        FloatingActionButton(
            // change color to transparent
            backgroundColor: Colors.transparent,
            // user elevation to hide the frame of button
            elevation: 0,
            onPressed: () {
              // function show a dialog center screen
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    // ... something is defined at here
                    title: Text('Which Social Media You Want to Share?'),
                    // content: something 
                  );
                },
              );
            },
            child: const Icon(
              Icons.share_rounded,
            ),
          ),
    ```
  - I defined AlertDialog as follows

      ```
          title: Text('Which Social Media You Want to Share?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Facebook'),
                leading: Icon(Icons.facebook),
                onTap: () {
                  // Xử lý sự kiện khi người dùng chọn chia sẻ trên Facebook
                  Navigator.pop(context, 'Facebook');
                },
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Zalo'),
                onTap: () {
                  // Xử lý sự kiện khi người dùng chọn chia sẻ trên Zalo
                  Navigator.pop(context, 'Zalo');
                },
              ),
            ],
          ),
      ```


