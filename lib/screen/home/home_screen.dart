import 'package:flutter/material.dart';
import 'package:food_app/screen/home/component/body.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerCustom(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Get.toNamed('/cart');
            },
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.shopping_bag, color:Colors.grey),
            ),
          ),
        ],
      ),
      body: Body(),
    );
  }
}

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('text.com'),
            accountEmail: Text('textmail@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade500,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text('Home'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('LOGOUT'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => {Get.offNamed('/login')},
          ),
        ],
      ),
    );
  }
}
