import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_camping/screens/detailScreen/campingDetailScreen.dart';
import 'package:my_camping/widgets/campingCard.dart';
import 'package:my_camping/widgets/starRating.dart';
import '../../utilities/appTheme.dart';
import '../../widgets/customAppBar.dart';

class BookingScreen extends StatefulWidget {
  static String routeName = "/booking";
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NewCustomAppBar(nameOfPage: "Le tue prenotazioni"),
        backgroundColor: Colors.grey[100],
        body: InkWell(
          splashColor: Colors.grey[100].withOpacity(0.9),
          highlightColor: Colors.grey[100].withOpacity(0.9),
          focusColor: Colors.grey[100].withOpacity(0.9),
          onTap: () {},
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return WidgetCard();
            },
          ),
        ));
  }
}

class WidgetCard extends StatelessWidget {
  const WidgetCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(19),
      child: Container(
          padding: EdgeInsets.only(top: 7, left: 20, bottom: 20),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 15.5),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          child: SizedBox(
                              height: MediaQuery.of(context).size.width / 3,
                              width: MediaQuery.of(context).size.height / 5,
                              child: Image(
                                image: AssetImage(
                                    'assets/images/TopPlace/camping_1.jpg'),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10, left: 10),
                            child: Column(
                              children: [
                                Text('Baia degli aranci'),
                                Text('Peschici(FG)'),
                                Text('Dal'),
                                Text('Al')
                              ],
                            ))
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(5),
                    child: Text('Stato Prenotazione :'),
                  )
                ],
              )
            ],
          ),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 3),
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(27))),
    );
  }
}
