import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

import '../navigation_bar/bottom_navigation_bar.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({super.key});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Drop Down Menu',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Select a country',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: SearchField(
                hint: 'Search',
                // make border for input TextField
                searchInputDecoration: InputDecoration(
                  // don't touch
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // when click on text field display this case
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.blue.withOpacity(0.8),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                maxSuggestionsInViewPort: 6, // display 6 items are searched
                itemHeight: 50,
                suggestionsDecoration: SuggestionDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                onSuggestionTap: (value) {
                  setState(() {
                    _selectedItem = value as String;
                  });
                  print(value);
                },

                // list of country in the world
                // suggestions: <SearchFieldListItem<String>>[
                //   SearchFieldListItem<String>(value: '1');
                // ],
                // //'List<SearchFieldListItem<_>>'

                // suggestions: dynamicList.cast<SearchFieldListItem<Object?>>(

                // ),
                // create a class Country with value name of a country
                // and get the country name put into a list
                suggestions: [
                  Country('Australia'),
                  Country('Albania'),
                  Country('Algeria'),
                  Country('Andorra'),
                  Country('Angola'),
                  Country('United State'),
                  Country('United Kingdom'),
                  Country('Viet Nam'),
                  Country('Laos'),
                  Country('Philipin'),
                  // Add more countries...
                ]
                    .map((country) => SearchFieldListItem<String>(country.name))
                    .toList(),
              ),
            ),
            Container(
              height: 90,
              padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _selectedItem == null
                      ? Text(
                          'Please select a Country to Continue',
                          style:
                              TextStyle(fontSize: 16, color: Colors.blueGrey),
                        )
                      : Text(_selectedItem!,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w600)),
                  MaterialButton(
                    // move to another page
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const DesignButtonNavigationBar(),
                        ),
                      );
                    },
                    color: Colors.black,
                    minWidth: 50,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blueGrey,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Country {
  final String name;

  Country(this.name);
}
