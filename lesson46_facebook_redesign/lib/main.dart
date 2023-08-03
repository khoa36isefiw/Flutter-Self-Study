import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RedesignFacebook(),
    ),
  );
}

class RedesignFacebook extends StatefulWidget {
  const RedesignFacebook({super.key});
  @override
  State<RedesignFacebook> createState() => _RedesignFacebookState();
}

class _RedesignFacebookState extends State<RedesignFacebook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.menu,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'facebook',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.blue.shade600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _makeHeaderIcon(icon: Icons.add),
                    _makeHeaderIcon(icon: Icons.search_rounded),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 120,
            padding: const EdgeInsets.only(
              // top: 50,
              right: 20,
              left: 20,
              // bottom: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade200,
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search_outlined,
                        ),
                        border: InputBorder.none,
                        hintText: 'Search',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.camera_alt,
                  size: 30,
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                // padding: const EdgeInsets.all(20),
                padding: const EdgeInsets.only(
                  // bottom: 20,
                  right: 20,
                  left: 20,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Stories',
                          style: TextStyle(
                            color: Colors.grey.shade900,
                            fontSize: 22,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text('See Archive'),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // make region for user Post
                    // include: userImage, inputTextFied and icon Button Image
                    SizedBox(
                      height: 65,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blueAccent,
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/img_rengoku_back.jpeg',
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: 50,
                            width: MediaQuery.of(context).size.width - 160,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'What\'s on your mind?',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          // add Icon Button Add Image
                          const SizedBox(width: 20),
                          Center(
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                // color: Colors.amber,
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/ic_add_image.png',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _makeDivingLine(context),
                    const SizedBox(height: 30),
                    Container(
                      height: 180,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          // need to make user post includes: userImage, textField to write content and image
                          _createStory(
                            userImage: 'img_canada.jpg',
                          ),
                          _makeStory(
                            userImage: 'img_rengoku_ruc_chay.jpeg',
                            storyImage: 'img_rengoku.gif',
                            userName: 'Rengoku',
                          ),
                          _makeStory(
                            userImage: 'img_inosuke.jpeg',
                            storyImage: 'img_inosuke.gif',
                            userName: 'Inosuke',
                          ),
                          _makeStory(
                            userImage: 'img_giyuu.png',
                            storyImage: 'img_giyuu.gif',
                            userName: 'Giyuu',
                          ),
                          _makeStory(
                            userImage: 'img_shinobu.png',
                            storyImage: 'img_giyuu_talk.webp',
                            userName: 'Shinobu',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _makeDivingLine(context),
                    const SizedBox(
                      height: 40,
                    ),

                    _makeStatusInformation(
                      userName: 'Akaza',
                      userImage: 'img_bong_rox.jpeg',
                      feedTime: '1 hr',
                      feedText: 'You must become the demon Kyoujurou',
                      feedImage: 'img_bong_ro.jpeg',
                      feedNumberOfLike: '10',
                      feedNumberOfComment: '2',
                      isChoose: false,
                      isLaugh: false,
                    ),
                    _makeStatusInformation(
                      userName: 'Rengoku Kyoujurou',
                      userImage: 'img_rengoku_ruc_chay.jpeg',
                      feedTime: '30 mins',
                      feedText: 'Yeahhhh, The answer belows the Picture :)',
                      feedImage: 'img_rengouku_refuse.jpg',
                      feedNumberOfLike: '10K',
                      feedNumberOfComment: '8K',
                      isChoose: true,
                      isLaugh: true,
                    ),
                    _makeStatusInformation(
                      userName: 'Tanjiro Kamado',
                      userImage: 'img_tanjiro_chay_ha_ku.png',
                      feedTime: '35 mins',
                      feedText: 'Don\'t run away, Akaza coward!!!!',
                      feedImage: 'img_tanjiro_gift_akaza.gif',
                      feedNumberOfLike: '8k',
                      feedNumberOfComment: '5K',
                      isChoose: true,
                      isLaugh: false,
                    ),
                    _makeStatusInformation(
                      userName: 'Shinobu Kocho',
                      userImage: 'img_shinobu.png',
                      feedTime: '6 hr',
                      feedText:
                          'Ara Ara Tomioko-san.\n Hey Tomioka-san, Are you listening?',
                      feedImage: '',
                      feedNumberOfLike: '5k',
                      feedNumberOfComment: '2K',
                      isChoose: true,
                      isLaugh: true,
                    ),
                    _makeStatusInformation(
                      userName: 'Giyuu Tomioka',
                      userImage: 'img_giyuu.png',
                      feedTime: '5 hr',
                      feedText: 'Kocho ...',
                      feedImage: '',
                      feedNumberOfLike: '4k',
                      feedNumberOfComment: '1,9K',
                      isChoose: true,
                      isLaugh: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _makeDivingLine(BuildContext context) {
    return Container(
      height: 6,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
    );
  }

  Container _makeHeaderIcon({icon}) {
    return Container(
      margin: const EdgeInsets.only(
        right: 10,
      ),
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade300,
      ),
      child: Icon(
        icon,
        weight: 2,
        size: 30,
      ),
    );
  }

  Container _makeStatusInformation({
    userName,
    userImage,
    feedTime,
    feedText,
    feedImage,
    feedNumberOfLike,
    feedNumberOfComment,
    isChoose,
    isLaugh,
  }) {
    // feed image is optional
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // this container uses for userImage
                  Container(
                    width: 50,
                    height: 50,
                    // user Image
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/$userImage',
                          // 'assets/images/img_bong_rox.jpeg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // include: userName and post update time
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //userName
                      Text(
                        userName,
                        // 'Akaza',
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),

                      //feedTime
                      Text(
                        feedTime + ' ago',
                        // '1 hr ago',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // make icon to display more information
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              ),
            ],
          ),
          // feedText
          const SizedBox(
            height: 20,
          ),
          // content of the post
          Text(
            feedText,
            // 'You must become the demon Kyoujurou',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade800,
              height: 1.5,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //feed Image - maybe post or not
          // edit it later
          feedImage != '' // check if feedImage is not Null/ String
              // --> display image and open the image when user click on this image
              // ? Container(
              //     height: 300,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       image: DecorationImage(
              //         image: AssetImage('assets/images/$feedImage'),
              //         // image: AssetImage('assets/images/img_bong_ro.jpeg'),
              //         fit: BoxFit.fill,
              //       ),
              //     ),
              //   )
              // : Container(),
              ? GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(),
                          body: Center(
                            child: Image.asset(
                              'assets/images/$feedImage',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  // container for image
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/$feedImage'),
                        // image: AssetImage('assets/images/img_bong_ro.jpeg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )
              : Container(),
          // make like/love button and number of comment
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // for like and love button, laugh
              Row(
                children: [
                  // make like
                  _makeLikeNumber(),

                  // make love
                  Transform.translate(
                    //displacement in the direction x: -5 - move to the right side
                    offset: const Offset(-5, 0),
                    child: _makeLoveNumber(),
                  ),
                  Transform.translate(
                    //move to the right side: 10
                    offset: const Offset(-10, 0),
                    // check is isLaugh == true --> display icon Laugh button
                    // else nothing
                    child: isLaugh ? _makeLaughNumber() : Container(),
                  ),

                  const SizedBox(
                    width: 5,
                  ),
                  // number of like
                  Text(
                    feedNumberOfLike,
                    // '10',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              // make number of comments
              Text(
                feedNumberOfComment + ' Comments',
                // '2 Comments',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 13,
                ),
              ),
            ],
          ),
          // Button Like, Comment and share
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // make button like
              isChoose // set if isChoose ==true --> button like will active
                  ? _makeButtonLike(
                      isActive: true,
                    )
                  : _makeButtonLike(
                      isActive: false,
                    ),
              _makeButtonComment(),
              _makeButtonShare(),
            ],
          ),
        ],
      ),
    );
  }

  Container _makeLoveNumber() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: const Icon(
        Icons.favorite,
        size: 14,
        color: Colors.white,
      ),
    );
  }

  Container _makeLaughNumber() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        // color: Colors.red,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
        ),
        image: const DecorationImage(
          image: AssetImage('assets/images/ic_laughing.png'),
        ),
      ),
    );
  }

// button like
  Container _makeLikeNumber() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: const Icon(
        Icons.thumb_up,
        size: 14,
        color: Colors.white,
      ),
    );
  }

  Container _makeButtonLike({isActive}) {
    // isActive stand for like/love this post
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // check if isActive --> change color for this button
          Icon(
            Icons.thumb_up,
            size: 18,
            // if isActive will have color Blue esle default color is grey
            color: isActive ? Colors.blue : Colors.grey,
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            'Like',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Container _makeButtonComment() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.message,
            size: 18,
            color: Colors.grey,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Comment',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Container _makeButtonShare() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.share,
            color: Colors.grey,
            size: 18,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Share',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  AspectRatio _makeStory({userImage, storyImage, userName}) {
    return AspectRatio(
      aspectRatio: 1.6 / 2,
      child: Container(
        // this container contains the large image outside - stories are updated
        margin: const EdgeInsets.only(
          right: 10,
        ),
        decoration: BoxDecoration(
          // Story Image
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(
              // 'assets/images/img_rengoku_with_bong_ro.jpeg',
              'assets/images/$storyImage',
            ),
            fit: BoxFit.cover,
          ),
        ),
        // linear color
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.1),
              ],
              begin: Alignment.bottomRight,
            ),
          ),
          // this column contains: userImage and userName
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // make container has shape circle for userImage
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // make Container like circle
                  // make border for this container if user is active
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                  // Add User Image into Container
                  image: DecorationImage(
                    image: AssetImage(
                      // 'assets/images/img_rengoku_ruc_chay.jpegimg_rengoku_ruc_chay.jpeg',
                      'assets/images/$userImage',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                // status online or offline
                // make a dot to represent user is active
                child: Stack(
                  children: [
                    Positioned(
                      // these values are at bottomRight
                      bottom: 0,
                      right: 0,
                      // top: 0,
                      // left: 0, // will fill full Container

                      // make a circle
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // user Name
              Text(
                userName,
                // 'Rengoku',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              // region for make button Like, Comments and Share
            ],
          ),
        ),
      ),
    );
  }
}

// create user require add their story
AspectRatio _createStory({userImage}) {
  return AspectRatio(
    aspectRatio: 1.6 / 2,
    child: Container(
      margin: const EdgeInsets.only(
        right: 10,
      ),
      decoration: BoxDecoration(
        // Story Image
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(
            // 'assets/images/img_rengoku_with_bong_ro.jpeg',
            'assets/images/$userImage',
          ),
          fit: BoxFit.cover,
        ),
      ),
      // linear color
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.1),
            ],
            begin: Alignment.bottomRight,
          ),
        ),
        // create button add story for user
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // adjust center
            Center(
              // make container to contains icon "Add New Story"
              child: Container(
                margin: const EdgeInsets.only(top: 50),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade200,
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  size: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Create\nStory',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center, // adjust text in center
            ),
          ],
        ),
      ),
    ),
  );
}

// chưa xử lý button like
