import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Sample Song List UI'),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.music_note),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
          ),
          body: const MyWidget(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

// only one song
// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(
//         top: 16,
//       ),
//       color: Colors.lightBlueAccent,
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Row(
//             children: [
//               // original desin
//               // Container(
//               //   width: 60,
//               //   height: 60,
//               //   color: Colors.greenAccent,
//               // ),
//               ClipOval(
//                 child: Image.network(
//                   //https://i.pinimg.com/736x/60/8c/67/608c6715bc958696feaa2a25b89cf754.jpg
//                   'https://i1.sndcdn.com/artworks-p6msG1yPGoow9gVS-y3EQYw-t500x500.jpg',
//                   width: 60,
//                   height: 60,
//                 ),
//               ),
//               // space for width
//               const SizedBox(
//                 width: 16,
//               ),
//               const Expanded(
//                 child: Column(
//                   // wrap content lại đúng như kích thước của nó
//                   mainAxisSize: MainAxisSize.min,
//                   // căn lề bên phải cho text
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Way Back Home',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 16,
//                     ),
//                     Text(
//                       'SHAUN (숀) ',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//               // original design
//               // Container(
//               //   width: 20,
//               //   height: 20,
//               //   color: Colors.deepOrangeAccent,
//               // ),
//               const Icon(
//                 Icons.play_arrow_sharp,
//                 size: 40,
//                 color: Colors.deepOrangeAccent,
//               ),
//               const SizedBox(
//                 width: 16,
//               ),
//               const Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Container(
//                   //   width: 20,
//                   //   height: 20,
//                   //   color: Colors.deepOrange,
//                   // ),
//                   Icon(
//                     Icons.favorite,
//                     size: 32,
//                     color: Colors.deepOrangeAccent,
//                   ),
//                   Text('28'),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   children: [
    // _buildSongWidget(
    //   'https://i1.sndcdn.com/artworks-p6msG1yPGoow9gVS-y3EQYw-t500x500.jpg',
    //   'Way Back Home',
    //   'SHAUN (숀)',
    //   '20',
    // ),
    // _buildSongWidget(
    //   'https://i.pinimg.com/736x/60/8c/67/608c6715bc958696feaa2a25b89cf754.jpg',
    //   'Memory Of The House In Village',
    //   'MoreanP',
    //   '30',
    // ),
    // _buildSongWidget(
    //   // 'https://i.pinimg.com/originals/97/fd/44/97fd440866881b46adb1296eb709e728.jpg',
    //   'https://steamuserimages-a.akamaihd.net/ugc/1755809726196373784/3A4707983E02486A3C92DE45D62E8CCB5FCB86E9/?imw=512&&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false',
    //   'Rengoku Last Smile',
    //   'Piano Song',
    //   '50',
    // ),
    //   ],
    // );
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.lightBlueAccent,
          child: const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://i.pinimg.com/originals/97/fd/44/97fd440866881b46adb1296eb709e728.jpg',
                  ),
                ),
                SizedBox(width: 64),
                Text(
                  'Giyuu\'s Songs',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 64),
                Icon(
                  Icons.add_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.lightBlueAccent,
          child: Card(
            color: Colors.blueGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            child: const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'My Music',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Shared',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Favorite List',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildSongWidget(
                'https://i1.sndcdn.com/artworks-p6msG1yPGoow9gVS-y3EQYw-t500x500.jpg',
                'Way Back Home',
                'SHAUN (숀)',
                '20',
              ),
              _buildSongWidget(
                'https://i.pinimg.com/736x/60/8c/67/608c6715bc958696feaa2a25b89cf754.jpg',
                'Memory Of The House In Village',
                'MoreanP',
                '30',
              ),
              _buildSongWidget(
                // 'https://i.pinimg.com/originals/97/fd/44/97fd440866881b46adb1296eb709e728.jpg',
                'https://steamuserimages-a.akamaihd.net/ugc/1755809726196373784/3A4707983E02486A3C92DE45D62E8CCB5FCB86E9/?imw=512&&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false',
                'Rengoku Last Smile',
                'Piano Song',
                '50',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSongWidget(
      String imageUrl, String title, String artist, String numLove) {
    return Container(
      color: Colors.lightBlueAccent,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          left: 4.0,
          right: 4.0,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    imageUrl, // call from list children
                    width: 60,
                    height: 60,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title, // called from the children list
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        // called from the list Children
                        artist, // definded in listView of MyWidget
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.play_arrow_sharp,
                  size: 40,
                  color: Colors.deepOrangeAccent,
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.favorite,
                      size: 20,
                      color: Colors.deepOrange,
                    ),
                    // Text('99'),
                    Text(numLove) // defined and called from MyWidget
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
