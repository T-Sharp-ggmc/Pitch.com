import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_camping/provider/campingProvider.dart';
import 'package:my_camping/utilities/enum.dart';
import 'package:my_camping/widgets/customAppBar.dart';
import 'package:my_camping/widgets/loading.dart';
import 'package:provider/provider.dart';

import 'widgets/campingMapCard.dart';
//import 'package:googlemapscroll/coffee_model.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController _controller;

  List<Marker> allMarkers = [];

  PageController _pageController;

  int prevPage;

  @override
  void initState() {
    super.initState();
    // coffeeShops.forEach((element) {
    //   allMarkers.add(Marker(
    //       markerId: MarkerId(element.shopName),
    //       draggable: false,
    //       infoWindow:
    //           InfoWindow(title: element.shopName, snippet: element.address),
    //       position: element.locationCoords));
    // });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      //moveCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<CampingProvider>(context).loadCamping(OrderType.noOrder, null);
    return Scaffold(
        appBar: NewCustomAppBar(nameOfPage: "Mappa"),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(40.7128, -74.0060), zoom: 12.0),
                markers: Set.from(allMarkers),
                onMapCreated: mapCreated,
              ),
            ),
            Positioned(
              bottom: 20.0,
              child: Consumer<CampingProvider>(
                  builder: (context, provider, _) {
                    if (provider.campings != null) {
                      if (provider.keyword == "") {
                        return Container(
                          height: 200.0,
                          width: MediaQuery.of(context).size.width,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: provider.campings.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CampingMapCard();
                            },
                          ),
                        );      
                      }
                      else if(provider.searchedCampings.length !=0){
                        return Container(
                          height: 200.0,
                          width: MediaQuery.of(context).size.width,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: provider.searchedCampings.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CampingMapCard();
                            },
                          ),
                        );
                      }
                      return Loading();
                  }
                  else
                    return Loading();
                }
              ),
            )
          ],
        ));
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  // moveCamera() {
  //   _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
  //       target: coffeeShops[_pageController.page.toInt()].locationCoords,
  //       zoom: 14.0,
  //       bearing: 45.0,
  //       tilt: 45.0)));
  // }
}
