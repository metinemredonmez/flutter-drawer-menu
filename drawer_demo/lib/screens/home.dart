import 'package:drawer_demo/screens/customer_screen.dart';
import 'package:drawer_demo/screens/product_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State {
// drawer

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer Demo"),
      ),
      body: Container(
        child: Center(
          child: Text("Home Page"),
        ),
      ),
      drawer: buildDrawer(context),
    );
  }

Drawer createMenuItems(BuildContext context) {

    createNavigationItem(
    IconData icon, 
    String page, 
    String routeName) {

      return ListTile(
        leading: Icon(icon),
        title: Text(page),
        onTap: () {
          setState(() {
            Navigator.of(context).pop(); //  bu menuyu kapatır.
            Navigator.of(context).pushNamed(routeName); //  tekrar route ıle ılgılı yere gider.
          });
        },
      );
    }



  var navigationList = [
    createNavigationItem(Icons.account_box,"Customers", CustomerScreen.routeName),
    createNavigationItem(Icons.production_quantity_limits,"Products", ProductScreen.routeName),
    createNavigationItem(Icons.home,"Home", "/"),
    
  ];

  ListView menuItems =  new ListView(
    children: navigationList,
    
    );
    return Drawer(child: menuItems,);

}

  buildDrawer(BuildContext context) {
    return new Drawer(
      child: createMenuItems(context),
    );
  }
  
 
}