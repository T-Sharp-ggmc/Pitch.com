import 'package:my_camping/provider/favoriteCampingProvider.dart';
import 'package:my_camping/screens/homepage/widget/FilterPremium.dart';
import 'package:my_camping/screens/homepage/widget/campingList.dart';
import 'package:my_camping/utilities/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../utilities/appTheme.dart';
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
  int _currentIndex = 0;
  final List<Widget> _children = [
    Center(child: Text('Home in lavorazione')), //home body
    FavoritesScreen(),
    // nuova funzionalità
    AccountScreen(),
  ];

  void initState() {
    super.initState();
  }

  /// Dispose
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: _currentIndex == 0 ? getHomePage() : _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'account'),
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
          _children[_currentIndex] = FavoritesScreen();
          Provider.of<FavoriteCampingProvider>(context, listen: false)
              .loadfavoriteCamping();
          break;
        default:
      }
    });
  }

  Widget getHomePage() {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.height,
                child: ClipRRect(
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
