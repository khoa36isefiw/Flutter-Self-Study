import 'package:flutter/material.dart';

import '../models/user.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({Key? key}) : super(key: key);

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage>
    with TickerProviderStateMixin {
  final List<User> _user = [
    User(
      'Rengoku Kyoujurou',
      '@kyoujuro',
      'assets/images/img_rengoku_back.jpeg',
      false,
    ),
    User(
      'Kocho Shinobu',
      '@shinobu',
      'assets/images/img_shinobu.png',
      false,
    ),
    User(
      'Tomioka Giyuu',
      '@giyuu',
      'assets/images/img_giyuu1.png',
      false,
    ),
    User(
      'Rengoku Kyoujurou',
      '@flameHashira',
      'assets/images/img_rengoku_ruc_chay.jpeg',
      false,
    ),
    User(
      'Kamado Tanjiro',
      '@tanjiro',
      'assets/images/img_tanjiro.png',
      false,
    ),
  ];

  List<User> _selectedUsers = [];
  // save state of an AnimatedListState
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final GlobalKey<AnimatedListState> selectedListKey =
      GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Add Members',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 150,
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text(
                    'Select Members',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    /// Creates a scrolling container that animates items when they are inserted
                    /// or removed.
                    child: AnimatedList(
                      scrollDirection: Axis.horizontal,
                      key: selectedListKey,
                      initialItemCount: _selectedUsers.length,
                      itemBuilder: (context, index, animation) {
                        return _selectedUsersComponent(
                          user: _selectedUsers[index],
                          index: index,
                          animation: animation,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: AnimatedList(
                key: listKey,
                initialItemCount: _user.length,
                itemBuilder: (context, index, animation) {
                  return userComponent(
                    user: _user[index],
                    index: index,
                    animation: animation,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectedUsersComponent({
    required User user,
    required int index,
    required Animation<double> animation,
  }) {
    return FadeTransition(
      opacity: animation,
      child: Container(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.green.shade600,
                image: DecorationImage(
                  image: AssetImage(user.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 15,
              child: GestureDetector(
                onTap: () {
                  listKey.currentState?.insertItem(
                    _user.length,
                    duration: const Duration(milliseconds: 500),
                  );
                  selectedListKey.currentState?.removeItem(
                    index,
                    (context, animation) => _selectedUsersComponent(
                      user: user,
                      index: index,
                      animation: animation,
                    ),
                    duration: const Duration(milliseconds: 300),
                  );

                  setState(() {
                    _selectedUsers.remove(user);
                    _user.add(user);
                  });
                },
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  userComponent({required User user, index, animation}) {
    return GestureDetector(
      onTap: () => {
        setState(
          // update new state
          () {
            // check if the length of array > 3
            if (_selectedUsers.length > 3) return;

            // case: Choose less than 3
            // remove user out of list
            listKey.currentState?.removeItem(
              index, // index of user
              (context, animation) =>
                  userComponent(user: user, index: index, animation: animation),
              duration: Duration(milliseconds: 300),
            );

            // add user is selected into Selects Members
            selectedListKey.currentState?.insertItem(
              _selectedUsers.length,
              duration: Duration(milliseconds: 500),
            );

            // add user is selected to Array _selectedUsers
            _selectedUsers.add(user);

            // remove user from _user Array
            _user.remove(user);
          },
        )
      },
      child: FadeTransition(
        opacity: animation,
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      user.image,
                      fit: BoxFit.cover,
                    ),

                    // child: Image.network(user.image),
                  ),
                ),
                const SizedBox(width: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    user.userName,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ])
              ])
            ],
          ),
        ),
      ),
    );
  }
}
