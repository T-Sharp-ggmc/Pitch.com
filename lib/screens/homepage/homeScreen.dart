import 'package:Pitch/screens/settingsScreens/settingScreen.dart';
import 'package:Pitch/widgets/FilterPremium.dart';
import 'package:Pitch/widgets/campingList.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../appTheme.dart';
import '../accountScreens/accountScreen.dart';
import '../favoritesScreen.dart';
import '../searchScreens/searchScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //Variables
  Animation gap;
  Animation base;
  Animation reverse;
  AnimationController controller;

  int _currentIndex = 0;
  final List<Widget> _children = [
    //HomeScreen(),
    Center(child: Text('Home in lavorazione')), //home body
    FavoritesScreen(), //Center(child: Text('Preferiti in lavorazione')),  //favorite body
    SearchPage(),
    AccountScreen(),
    //Center(child: Text('Profilo in lavorazione')),  //account body
  ];

  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    base = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    reverse = Tween<double>(begin: 0.0, end: -1.0).animate(base);
    gap = Tween<double>(begin: 3.0, end: 0.0).animate(base)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  /// Dispose
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _currentIndex == 0
          ? null
          // ? AppBar(
          //     title: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: <Widget>[
          //         Row(
          //           children: <Widget>[
          //             //logo image
          //             Padding(
          //                 padding: const EdgeInsets.only(left: 8.0, top: 8.0),
          //                 child: Image.asset(
          //                   'assets/Icons/logo.png',
          //                   fit: BoxFit.cover,
          //                   height: 40,
          //                 )),
          //           ],
          //         ),
          //       ],
          //     ),
          //     backgroundColor: Colors.white,
          //     actions: <Widget>[
          //       IconButton(
          //         icon: const Icon(Icons.settings),
          //         tooltip: 'Show Snackbar',
          //         onPressed: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => SettingScreen(),
          //                 fullscreenDialog: true),
          //           );
          //         },
          //         color: Colors.black,
          //       ),
          //     ],
          //   )
          : AppBar(
              toolbarHeight: 0,
            ),
      body: _currentIndex == 0 ? getHomePage() : _children[_currentIndex],
      // ignore: missing_required_param
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // ignore: deprecated_member_use
              title: Text('home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              // ignore: deprecated_member_use
              title: Text('search')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              // ignore: deprecated_member_use
              title: Text('room_preferences')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              // ignore: deprecated_member_use
              title: Text('filter')),
        ],
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black87,
        iconSize: 35.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void onTabTapped(int value) {
    setState(() {
      _currentIndex = value;
      switch (_currentIndex) {
        case 1:
          _children[_currentIndex] = FavoritesScreen(
            animationController: controller,
          );
          break;
        case 3:
          _children[_currentIndex] = AccountScreen(
            animationController: controller,
          );
          break;
        default:
      }
    });
  }

  Widget getHomePage() {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          //padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                //height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.height,
                child: ClipRRect(
                  //borderRadius: BorderRadius.circular(2.0),
                  child: SizedBox(
                    height: 450,
                    child: Image(
                        image: AssetImage("assets/images/filters/welcome.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 35,
                right: 75,
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.grey[100].withOpacity(0.9),
                    borderRadius: BorderRadius.all(Radius.circular((38.0))),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: AppTheme.getTheme().dividerColor,
                          offset: Offset(0, 2),
                          blurRadius: 6.0),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 3, bottom: 3),
                    child: TextField(
                      readOnly: true,
                      // onChanged: (String
                      //     txt) {}, // funzione per aggiornare automaticamente la lista di campeggi che compare sotto
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchPage(),
                              fullscreenDialog: true,
                            ));
                      },
                      style: TextStyle(fontSize: 14),
                      cursorColor: AppTheme.getTheme().primaryColor,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        hintText: "Cerca",
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 20,
                  right: 20,
                  child: Container(
                      width: 50,
                      height: 50,
                      child: IconButton(
                        color: Colors.white,
                        iconSize: 30,
                        onPressed: () {},
                        icon: Icon(FontAwesomeIcons.mapMarkedAlt),
                      ))),
            ]),
            Divider(),
            SizedBox(
              height: 120.0,
              child: FilterPremiumView(),
            ),
            Container(
                height: MediaQuery.of(context).size.height,
                child: CampingList())
          ],
        ),
      ),
    );
  }
}
