import 'package:my_camping/models/camping.dart';
import 'package:my_camping/models/campingCoordinate.dart';
import 'package:my_camping/models/filter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_camping/models/pitch.dart';
import 'package:my_camping/services/campingPitchService.dart';
import 'package:my_camping/utilities/enum.dart';

class SearchService {
  static CollectionReference _campingCollection =
      FirebaseFirestore.instance.collection('campings');

  static Future<List<Camping>> getCamping(
      OrderType orderType, Filter filters) async {
    List<QuerySnapshot> snapshot = [];


    // TODO da terminare
    if (filters != null) {
      if (filters.categories.isNotEmpty) {
        List<String> categoryList =
            EnumUtilities.getCategoryStringList(filters.categories);
        snapshot.add(await _campingCollection
            .where("category", whereIn: categoryList)
            .get());
      }
      if (filters.services.isNotEmpty) {
        snapshot.add(await _campingCollection
            .where("services", arrayContainsAny: filters.services)
            .get());
      }
      if (filters.dist > 0) {}
      if (filters.date.isNotEmpty) {
        //check date in pitch service
      }
      // TODO chiedere al campeggio come gestiscono le piazzole in base alle persone
      if (filters.numOfAdults > 0) {}
      if (filters.numOfChild > 0) {}
      // TODO
      if (filters.numOfPitch > 0) {
        //check lenght of document pitchs foreach campings
      }
    } else
      snapshot.add(await _campingCollection.get());

    List<Camping> campings = [];

    if (snapshot.length == 1) {
      for (var document in snapshot[0].docs) {
        campings.add(
          Camping(
            cid: document.data()['cid'],
            name: document.data()['name'],
            info: document.data()['info'],
            city: document.data()['city'],
            category:
                EnumUtilities.getCategoryEnum(document.data()['category']),
            rating: document.data()['rating'],
            reviews: document.data()['reviews'],
            numOfBooking: document.data()['numOfBooking'],
            isPremium: document.data()['isPremium'],
            photos: (document.data()['photos'] as List)
                .map((p) => p.toString())
                .toList(),
            services: (document.data()['services'] as List)
                .map((s) => s.toString())
                .toList(),
            campingPitch: await CampingPitchService(cid: document.id).getPitch(),
            position: CampingCoordinate.fromJson(document.data()['position']),
          ),
        );
      }
    } else {
      for (var snap in snapshot) {
        for (var document in snap.docs) {
          campings.add(
            Camping(
              cid: document.data()['cid'],
              name: document.data()['name'],
              info: document.data()['info'],
              city: document.data()['city'],
              category:
                  EnumUtilities.getCategoryEnum(document.data()['category']),
              rating: document.data()['rating'],
              reviews: document.data()['reviews'],
              numOfBooking: document.data()['numOfBooking'],
              isPremium: document.data()['isPremium'],
              photos: (document.data()['photos'] as List)
                  .map((p) => p.toString())
                  .toList(),
              services: (document.data()['services'] as List)
                  .map((s) => s.toString())
                  .toList(),
              campingPitch: CampingPitchService(cid: document.id).getPitch() as List,
              position: CampingCoordinate.fromJson(document.data()['position']),
            ),
          );
        }
      }
    }
    campings = orderList(orderType, campings);

    return campings;
  }

  static int compareForLowestPrice(Camping a, Camping b) {
    Pitch pA = Camping.getLowestPrice(a.campingPitch);
    Pitch pB = Camping.getLowestPrice(b.campingPitch);
    return pA.price.compareTo(pB.price);
  }

  static List<Camping> orderList(
      OrderType orderType, List<Camping> listToOrder) {
    switch (orderType) {
      case OrderType.priceCre:
        listToOrder.sort((a, b) => compareForLowestPrice(a, b));
        break;
      case OrderType.priceDec:
        listToOrder.sort((b, a) => compareForLowestPrice(a, b));
        break;
      case OrderType.avgRating:
        listToOrder.sort((b, a) => a.rating.compareTo(b.rating));
        break;
      case OrderType.popCamp:
        listToOrder.sort((b, a) => a.numOfBooking.compareTo(b.numOfBooking));
        break;
      default:
        listToOrder.sort((a, b) => a.name.compareTo(b.name));
    }
    return listToOrder;
  }
}
