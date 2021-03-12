import 'package:my_camping/provider/favoriteCampingProvider.dart';
import 'package:my_camping/screens/homepage/widget/FilterPremium.dart';
import 'package:my_camping/screens/homepage/widget/campingList.dart';
import 'package:my_camping/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../appTheme.dart';
import '../accountScreens/accountScreen.dart';
import '../favoriteScreens/favoritesScreen.dart';
import '../searchScreens/searchScreen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
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
    Center(child: Text('Home in lavorazione')), //home body
    FavoritesScreen(),
    // nuova funzionalità
    AccountScreen(),
  ];

  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
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
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
              title: Text('favorite')),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.new_releases),
          //     // ignore: deprecated_member_use
          //     title: Text('new feature')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              // ignore: deprecated_member_use
              title: Text('account')),
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
          Provider.of<FavoriteCampingProvider>(context, listen: false).loadfavoriteCamping();
          break;
        // case 3:
        //   _children[_currentIndex] = AccountScreen(
        //     animationController: controller,
        //   );
        //   break;
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
                top: 25,
                left: 35,
                right: 75,
                child: Container(
                  width: 350,
                  height: getProportionateScreenHeight(50),
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
                        left: 20, right: 16, top: 0, bottom: 3),
                    child: TextField(
                      readOnly: true,
                      onTap: () {
                        Navigator.pushNamed(context, SearchScreen.routeName);
                      },
                      style: TextStyle(fontSize: 14),
                      cursorColor: AppTheme.getTheme().primaryColor,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        hintText: "Dove vuoi andare?",
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
