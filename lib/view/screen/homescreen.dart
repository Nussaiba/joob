import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/drawerOfappp.dart';



class HomeScreen55 extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //final SearchControllerImp searchController = Get.put(SearchControllerImp());
  final TextEditingController searchControllerText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(170.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 90, 19, 104),
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          actions: [
            IconButton(
              color: Colors.yellow,
              icon: Icon(Icons.notifications_none),
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(19),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: searchControllerText,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                  onSubmitted: (value) async {
                    if (value.isNotEmpty) {
                     // await searchController.searchUser(value);
                      // تحديث هذا الجزء ليتناسب مع بياناتك
                     // Get.off(SearchScreen());
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      drawer: DrawerOfApp(), // تأكد من تعريف DrawerOfApp في مكان ما
      body: Column(
        children: [
          // ... الويدجتس الأخرى
        ],
      ),
    );
  }
}
