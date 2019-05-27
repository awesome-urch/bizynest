import 'package:bizynest/models/product_model.dart';
import 'package:bizynest/services/rest_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bizynest/widgets/common_widgtes.dart';
import 'package:bizynest/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:bizynest/widgets/list_product.dart';


Future<List<Product>> fetchPosts(http.Client client) async {
  //https://jsonplaceholder.typicode.com/photos
  //https://bizynest.com/api/src/routes/process_one.php?request=categories
  //http://192.168.0.100/pagesn/process_one.php?request=categories2
  final response = await client.get(RestApi.REST_URL_GET + '?request=products');

  //print(response.body);
  final body = json.decode(response.body);
  /*print(body['data']);


  if(body['data']){
    final String data = body['data'];
  }*/


  //print(body['data'].toString());
  //return compute(parsePosts, response.body);
  return compute(parsePosts, jsonEncode(body['data']));
}

List<Product> parsePosts(String responseBody) {

  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}

class HomePage extends StatefulWidget {
  final String title;

  //final Store<int> store;

  HomePage({Key key, this.title,}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{

  static const _navIconSize = 24.0;
  static const EdgeInsets _navEdge = EdgeInsets.all(12.0);
  static const EdgeInsets edgeInsets = EdgeInsets.fromLTRB(28.0, 20.0, 28.0, 20.0);

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Business Lounge',
      style: optionStyle,
    ),
    Text(
      'Display Port',
      style: optionStyle,
    ),
    Text(
      'Chat',
      style: optionStyle,
    ),
    Text(
      'Top Stores',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {

    Widget _navDrawer = Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the Drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              padding: EdgeInsets.fromLTRB(32.0, 48.0, 32.0, 24.0),
              child:Image.asset(
                "assets/logo_extended.png",
                fit: BoxFit.contain,
              ),
            ),
            decoration: BoxDecoration(
              // Box decoration takes a gradient
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // Add one stop for each color. Stops should increase from 0 to 1
                stops: [0.1, 0.7],
                colors: [
                  // Colors are easy thanks to Flutter's Colors class.

                  new Color(0xFF601183),
                  new Color(0x88601183),
                ],
              ),
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.person,
                  size: _navIconSize,
                ),
                Container(
                    padding: _navEdge, child: Text('Profile'))
              ],

            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.sort,
                  size: _navIconSize,
                ),
                Container(
                    padding: _navEdge, child: Text('Recent Posts'))
              ],

            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.bookmark,
                  size: _navIconSize,
                ),
                Container(
                    padding: _navEdge, child: Text('Favourites'))
              ],

            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.shopping_cart,
                  size: _navIconSize,
                ),
                Container(
                    padding: _navEdge, child: Text('Explore Stores'))
              ],

            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.list,
                  size: _navIconSize,
                ),
                Container(
                    padding: _navEdge, child: Text('Categories'))
              ],

            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.local_grocery_store,
                  size: _navIconSize,
                ),
                Container(
                    padding: _navEdge, child: Text('Delivery Orders'))
              ],

            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.sentiment_satisfied,
                  size: _navIconSize,
                ),
                Container(
                    padding: _navEdge, child: Text('Weekend Giveaways'))
              ],

            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.store,
                  size: _navIconSize,
                ),
                Container(
                    padding: _navEdge, child: Text('My Stores'))
              ],

            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.store,
                  size: _navIconSize,
                ),
                Container(
                    padding: _navEdge, child: Text('Own a Store'))
              ],

            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.poll,
                  size: _navIconSize,
                ),
                Container(
                    padding: _navEdge, child: Text('Polls'))
              ],

            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.help,
                  size: _navIconSize,
                ),
                Container(
                    padding: _navEdge, child: Text('Help Desk'))
              ],

            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          Divider(
            color: Colors.grey[700],
          ),
          Container(
            padding: _navEdge,
            child: Text(
              'Settings',
              softWrap: true,
              style: TextStyle(color:Colors.grey[700],fontSize: 14.0,),
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.dashboard,
                  size: _navIconSize,
                ),
                Container(
                    padding: _navEdge, child: Text('Dashboard'))
              ],

            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.build,
                  size: _navIconSize,
                ),
                Container(
                    padding: _navEdge, child: Text('Manage Products'))
              ],

            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.history,
                  size: _navIconSize,
                ),
                Container(
                    padding: _navEdge, child: Text('Subscription History'))
              ],

            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.notifications,
                  size: _navIconSize,
                ),
                Container(
                    padding: _navEdge, child: Text('Turn Off Notifications'))
              ],

            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.location_city,
                  size: _navIconSize,
                ),
                Container(
                    padding: _navEdge, child: Text('About Us'))
              ],

            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.library_books,
                  size: _navIconSize,
                ),
                Container(
                    padding: _navEdge, child: Text('Terms and Policy'))
              ],

            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.warning,
                  size: _navIconSize,
                ),
                Container(
                    padding: _navEdge, child: Text('Disclaimer'))
              ],

            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.power_settings_new,
                  size: _navIconSize,
                ),
                Container(
                    padding: _navEdge, child: Text('Logout'))
              ],

            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );

    ThemeData theme = Theme.of(context).copyWith(
      // sets the background color of the `BottomNavigationBar`
        canvasColor: AppConstants.appPurple,
        // sets the active color of the `BottomNavigationBar` if `Brightness` is light
        primaryColor: Colors.white,
        textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: Colors.white)));

    Widget _bottomNav = BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text('Business Lounge'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle),
          title: Text('Display Port'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.forum),
          title: Text('Chat'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.store),
          title: Text('Top Stores'),
        ),
      ],
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      //selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );

    var _bottomNav2 = new Theme(data:theme,child:_bottomNav);

    Widget _homeColumn = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child:FutureBuilder<List<Product>>(
            future: fetchPosts(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
              //new Map<String, dynamic>.from(snapshot.value)
                  ? ListViewProducts(posts: snapshot.data)
              //? ListViewCategories(posts: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );

    Widget productSection = Container(
      margin: edgeInsets,
      height: 500,
      child: _homeColumn,
    );

    Widget centerFirst = Center(child: _widgetOptions.elementAt(_selectedIndex));

    Widget _homeContainer = Container(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[productSection],
            ),
          ),
        ],
      ),
    );




    return Scaffold(
      appBar: AppBar(
          title: new Image.asset('assets/logo_extended.png', fit: BoxFit.contain,),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.message), onPressed: () {},),
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {},),
          IconButton(icon: const Icon(Icons.search), onPressed: () {},)
        ],
      ),
      body: _selectedIndex>0?centerFirst:_homeContainer,
      drawer: _navDrawer,
      bottomNavigationBar: _bottomNav2,
    );
  }
}