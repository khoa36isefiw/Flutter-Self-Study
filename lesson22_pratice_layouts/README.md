# lesson22_pratice_layouts

Practice building a basic layout <br>
## Main GUI
<img src="https://github.com/khoa36isefiw/Flutter-Self-Study/assets/97817877/9a7e7560-4e15-4b19-ae5f-d95a1da3d847" alt="Alt text" width="400" height="800">

## Note Source Code
- The main code is used to run:
  
```
  return MaterialApp(
      title: 'Flutter layout demo',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Building Layout'),
          ),
          body: ListView(
            // like column if we don't define direction
// default direction of ListView is - Vertical
            // direction: Axis.horizontal  
            children: [
              Image.asset(
                // add Image
                ('assets/images/img_pi_leng.png'),
                fit: BoxFit.cover,
                width: 600,
                height: 250,
              ),
              titleSection, // define in Widget title
              buttonSection,
              contentSection,
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
```
- Here I divided into 3 parts call in Material App: title Section, button Section, content Section - They are called from some defined Widgets.
  - For example: I defined Widget contentSection
    
    ```
    Widget contentSection = const Padding(
      padding: EdgeInsets.all(25),
      child: Text(
        'Ma Pi Leng Pass is a high mountain pass at an elevation of 1.500m'
        '(4,921ft) above the sea level. It’s a part of the Dong Van Karst'
        ' Plateau, lies on the Happiness Road, which connects Ha Giang City,'
        ' Dong Van and Meo Vac. Happiness Road is about 200km long and was'
        ' built by thousands of youth volunteers from 16 ethnic groups of 8'
        ' Vietnam Northern provinces. It took 6 years (1959-1965) to complete'
        ' the construction and especially, the 20-km pass Ma Pi Leng was built'
        ' by suicide troops volunteers who had to hang themselves on rock'
        ' cliffs and move every centimeter to finish the dangerous 11-month'
        ' building process.',
        softWrap: true,
        textAlign: TextAlign.justify, // căn lề chữ đều 2 bên
      ),
    );

     ```
- At body: I use 'ListView' to call some Widget is define

```
 body: ListView(
  // like column if we don't define direction
  // default direction of ListView is - Vertical
  // direction: Axis.horizontal  
  children: [
    Image.asset(
      // add Image
      ('assets/images/img_pi_leng.png'),
      fit: BoxFit.cover,
      width: 600,
      height: 250,
    ),
    titleSection, // define in Widget title
    buttonSection,
    contentSection,
    ],
  ),
```
### Add Image
- At here, I add an Image and define width and height for it
```
  Image.asset(
    // add Image
    ('assets/images/img_pi_leng.png'),
    fit: BoxFit.cover,
    width: 600,
    height: 250,
  ),
```




    
    
