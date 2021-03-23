import 'package:my_camping/models/filtersList.dart';
import 'package:my_camping/models/pitch.dart';
import 'package:my_camping/services/campingPitchService.dart';
import 'package:my_camping/utilities/appTheme.dart';
import 'package:my_camping/utilities/customInputDecorator.dart';
import 'package:my_camping/widgets/starRating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/camping.dart';
import '../../utilities/sizeConfig.dart';
import 'widgets/campingReview.dart';
import 'widgets/customDetailAppBar.dart';
import 'widgets/detailsBottomBar.dart';
import 'widgets/expandableText.dart';
import 'widgets/likelihoodCamping.dart';

class CampingDetailScreen extends StatefulWidget {
  static String routeName = "/campingDetail";

  const CampingDetailScreen({Key key}) : super(key: key);
  @override
  _CampingDetailScreenState createState() => _CampingDetailScreenState();
}

class _CampingDetailScreenState extends State<CampingDetailScreen> {
  List<String> pitchType = [];
  List<String> pitchTypeForLikelihood = [];
  String _currentPitchType;
  int _currentPitchCount = 0;
  List<double> _priceRangeList = [];
  double _price = 0;
  bool isFavorite;
  var pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Map<String,Object>;
    final Camping camping = args['campingData'] as Camping;
    isFavorite = args['favorite'] as bool;
    //ModalRoute.of(context).settings.arguments;
    populatePitchTypeList(camping.campingPitch);
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppTheme.getTheme().backgroundColor,
      appBar: 
      PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child:CustomDetailAppBar(
          camping : camping,
          isFavoriteC: isFavorite,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: getProportionateScreenHeight(350),
                      child: AspectRatio(
                          aspectRatio: 1,
                          child: PageView(
                            controller: pageController,
                            pageSnapping: true,
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              for (var image in camping.photos)
                                CachedNetworkImage(
                                  imageUrl: image,
                                  fit: BoxFit.cover,
                                )
                            ],
                          )),
                    ),
                    Positioned(
                      left: getProportionateScreenWidth(160),
                      top: getProportionateScreenHeight(325),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PageIndicator(
                          layout: PageIndicatorLayout.WARM,
                          size: 10.0,
                          controller: pageController,
                          space: 5.0,
                          count: 3,
                          color: AppTheme.getTheme().backgroundColor,
                          activeColor: AppTheme.getTheme().primaryColor,
                        ),
                      ),
                    )
                  ],
                )),
            Container(
              margin: EdgeInsets.only(top: getProportionateScreenWidth(320)),
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(20),
                  right: getProportionateScreenWidth(20)),
              width: double.infinity,
              color: AppTheme.getTheme().backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    camping.name,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: Colors.black),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        camping.city,
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.withOpacity(0.8)),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Icon(
                        FontAwesomeIcons.mapMarkerAlt,
                        size: 12,
                        color: AppTheme.getTheme().primaryColor,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Container(
                        child: Text(
                          "2.5 km dal centro",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.withOpacity(0.8)),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Row(
                      children: <Widget>[
                        StarRating(
                          allowHalfRating: true,
                          starCount: 5,
                          rating: camping.rating,
                          size: 20,
                          color: AppTheme.getTheme().primaryColor,
                          borderColor: AppTheme.getTheme().primaryColor,
                        ),
                        Text(
                          " ${camping.reviews} Reviews",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.withOpacity(0.8)),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppTheme.getTheme().dividerColor,
                    height: 20,
                  ),
                  getPitchTypeUI(camping),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
                    child: Container(
                      child: Text(
                        "Descrizione",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.grey.withOpacity(0.8)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                    child: ExpandableText(camping.info),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 4.0, bottom: 4.0, top: 8.0),
                    child: Container(
                      child: Text(
                        "Servizi",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.grey.withOpacity(0.8)),
                      ),
                    ),
                  ),
                  getServicesUI(camping.services),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 4.0, top: 16.0),
                    child: Container(
                      child: Text(
                        "Recensioni",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.grey.withOpacity(0.8)),
                      ),
                    ),
                  ),
                  ReviewCard(campingId: camping.cid),
                  Divider(
                    color: AppTheme.getTheme().dividerColor,
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 4.0, top: 16.0),
                    child: Container(
                      child: Text(
                        "Posizione",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.grey.withOpacity(0.8)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 4.0, top: 10.0, bottom: 8.0),
                    child: Container(
                      child: Text(
                        camping.city,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  getMapPositionUI(),
                  Divider(
                    color: AppTheme.getTheme().dividerColor,
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 4.0, top: 16.0, bottom: 16.0),
                    child: Container(
                      child: Text(
                        "Contatta il titolare",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Divider(
                    color: AppTheme.getTheme().dividerColor,
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 4.0, top: 16.0, bottom: 16.0),
                    child: Container(
                      child: Text(
                        "Termini di recesso",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Divider(
                    color: AppTheme.getTheme().dividerColor,
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 4.0, top: 16.0, bottom: 16.0),
                    child: Container(
                      child: Text(
                        "Potrebbero interessarti",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  LikelihoodCamping(cid: camping.cid,campingCity: camping.city, campingPitchCategories: pitchTypeForLikelihood),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: DetailsBottomBar(priceRange: _priceRangeList, price: _price,),
    );
  }

  Widget getPitchTypeUI(Camping camping) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 0, right: 8, top: 4, bottom: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Tipologia piazzola",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.grey.withOpacity(0.8)),
                      ),
                      Container(
                        width: getProportionateScreenWidth(150),
                        height: 45,
                        child: DropdownButtonFormField(
                          value: _currentPitchType ??
                              pitchType.first,
                          decoration: textInputDecoration,
                          items: pitchType.map((type) {
                            return DropdownMenuItem(
                              value: type,
                              child: Text(
                                '$type',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (val) async {
                              var count = await CampingPitchService.getAvailablePitchCount(val, camping.cid);
                              List<double> priceRangeList = [];
                              double price = 0;
                              if(count > 0)
                                price = await CampingPitchService.getPitchPrice(val, camping.cid);
                              else
                                priceRangeList = await CampingPitchService.getPitchRangePrice(camping.cid);
                              
                              setState(() {
                                _currentPitchType = val;
                                _currentPitchCount = count;
                                _price = price;
                                _priceRangeList = priceRangeList;
                              });
                          }
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Container(
              width: 1,
              height: 60,
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 4, bottom: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Piazzole rimaste",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.grey.withOpacity(0.8)),
                      ),
                      Container(
                        width: getProportionateScreenWidth(145),
                        height: 45,
                        child: Center(
                          child: Text(
                            _currentPitchCount == 0 ? "-" : _currentPitchCount.toString(),
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getServicesUI(List<String> services) {
    List<FilterListData> serviceListData = FilterListData.serviceList;
    List<FilterListData> serviceOfCamping = [];
    for (var service in services) {
      serviceOfCamping.add(serviceListData
          .where((element) => element.titleTxt.toLowerCase() == service)
          .first);
    }
    if (serviceOfCamping.isEmpty) {
      return Container(
        height: 50,
        child: Center(
          child: Text(
            "Nessun servizio disponibile",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey.withOpacity(0.8)),
          ),
        ),
      );
    } else {
      return 
          Container(
              height: 50,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                    top: 4, right: 8, bottom: 2),
                itemCount: serviceOfCamping.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    width: 50,
                    child: Icon(serviceOfCamping[index].icon),
                  );
                },
              )
          );
    }
  }

  Widget getMapPositionUI(){
    return 
    Padding(
      padding: const EdgeInsets.only(left: 4.0, top: 16.0, bottom: 8.0),
      child: Container(
        color: Colors.grey.withOpacity(0.8),
        height: 250,
        width: 350,
        child: Center(
          child: Text(
            "Inserire qui screen mappa"
          )
        )    
      ),
    );
  }

  void populatePitchTypeList(List<Pitch> pitchs){
    List<String> temp = ['seleziona tipo'];
    for (var pitch in pitchs) {
      temp.add(pitch.type);
    }
    this.pitchType = temp.toSet().toList();
    this.pitchTypeForLikelihood = temp.toSet().toList();
  }

}
