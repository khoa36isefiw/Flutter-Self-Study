import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lesson54_searchable/data/user_list.dart';

import 'model/user.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Searchable(),
    ),
  );
}

class Searchable extends StatefulWidget {
  const Searchable({super.key});

  @override
  State<Searchable> createState() => _SearchableState();
}

class _SearchableState extends State<Searchable> {
  UsersList _usersList = UsersList();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _usersList.foundUsers = _usersList.userList;
    });
  }

  // function search  user by their name
  onSearch(String searchValue) {
    // // put user is search into foundUsers List
    // _usersList.foundUsers = _usersList.userList
    //     .where((user) => user.name.toLowerCase().contains(searchValue))
    //     .toList();
    if (searchValue.isEmpty) {
      // if the search value is Empty -> reset the foundUsers List to the
      // original User List
      setState(() {
        _usersList.foundUsers = _usersList.userList;
      });
    }
    // Not Empty -> Filter the userList to find out matching users
    else {
      setState(() {
        _usersList.foundUsers = _usersList.userList
            .where((userIsFound) =>
                userIsFound.name.toLowerCase().contains(searchValue))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // search input
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        title: Container(
          height: 50,
          child: TextField(
            onChanged: (value) => onSearch(value),

            // change color when we input value
            style: TextStyle(
              color: Colors.blue, // Change this to the desired color
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[850],
              contentPadding: const EdgeInsets.all(5),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: Colors.grey.shade500,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                // borderSide: BorderSide.none,
              ),
              hintText: 'Search Users...',
              hintStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              focusColor: Colors.white,
            ),
          ),
        ),
      ),
      // display list users
      // include: image, their name, userName - button follow if you like
      body: Container(
        color: Colors.grey.shade900,
        child: _usersList.foundUsers.length > 0 // check if it exists
            //return list user found
            ? ListView.builder(
                // display number of user is searched
                itemCount: _usersList.foundUsers.length,
                itemBuilder: (context, index) {
                  // scroll Widget follows the horizontal axis
                  // and can do actions on its
                  return Slidable(
                    // set how it big
                    actionExtentRatio: 0.25,
                    // use slidable to display user
                    child: userComponent(
                      user: _usersList.foundUsers[index],
                    ),
                    // set the action Pane
                    actionPane: const SlidableDrawerActionPane(),
                    // display action when user slides from left to right
                    actions: <Widget>[
                      // a list of Actions
                      IconSlideAction(
                        caption: 'Archive',
                        color: Colors.transparent,
                        icon: Icons.archive,
                        onTap: () {
                          print('Archive');
                        },
                      ),
                      IconSlideAction(
                        caption: 'Share',
                        color: Colors.transparent,
                        icon: Icons.share,
                        onTap: () {
                          print('Share');
                        },
                      ),
                    ],
                    // display action when user slide from right to left
                    secondaryActions: [
                      IconSlideAction(
                        caption: 'More',
                        color: Colors.transparent,
                        icon: Icons.more_horiz,
                        onTap: () {
                          print('More');
                        },
                      ),
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.transparent,
                        icon: Icons.delete,
                        onTap: () {
                          print('Delete');
                        },
                      ),
                    ],
                  );
                },
              )
            // doesn't exist --> through message
            : const Center(
                child: Text(
                  'No users found',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
      ),
    );
  }

  Container userComponent({required User user}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: AssetImage(
                      // 'assets/images/img_rengoku_back.jpeg',
                      user.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 'Rengoku',
                    user.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    // '@rengoku',
                    user.userName,
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ],
          ),
          // make button follow
          GestureDetector(
            onTap: () {
              // update new state when user clicks on "Follow" button
              setState(() {
                user.isFollowByMe = !user.isFollowByMe;
              });
            },
            child: AnimatedContainer(
              height: 35,
              width: 110,
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: user.isFollowByMe
                      ? Colors.transparent
                      : Colors.grey.shade700,
                ),
                color: user.isFollowByMe
                    ? Colors.blue[700]
                    : const Color(0xffffff),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  user.isFollowByMe ? 'Following' : 'Follow',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
