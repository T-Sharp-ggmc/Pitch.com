import 'package:flutter/material.dart';
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

  static Future<List<Camping>> getCamping(OrderType orderType) async {
    QuerySnapshot snapshot = await _campingCollection.get();
    List<String> dateToFilter = [];

    List<Camping> campings = [];

    for (var document in snapshot.docs) {
      campings.add(
        Camping(
          cid: document.data()['cid'],
          name: document.data()['name'],
          info: document.data()['info'],
          city: document.data()['city'],
          category: EnumUtilities.getCategoryEnum(document.data()['category']),
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
          campingPitch: await CampingPitchService(cid: document.id)
              .getPitch(dateToFilter, null),
          position: CampingCoordinate.fromJson(document.data()['position']),
        ),
      );
    }
    campings = orderList(orderType, campings);

    return campings;
  }

  static Future<List<Camping>> getFilteredCamping(
      OrderType orderType, Filter filters) async {
    List<QuerySnapshot> snapshot = [];
    List<String> dateToFilter = [];
    List<Pitch> pitchs;
    int numOfPitch = 0;
    RangeValues _price;

    if (filters.categories.isNotEmpty) {
      List<String> categoryList =
          EnumUtilities.getCategoryStringList(filters.categories);
      snapshot.add(await _campingCollection
          .where("category", whereIn: categoryList)
          .get());
      if (snapshot.last.docs.isEmpty) snapshot.removeLast();
    }
    if (filters.services.isNotEmpty) {
      snapshot.add(await _campingCollection
          .where("services", arrayContainsAny: filters.services)
          .get());
      if (snapshot.last.docs.isEmpty) snapshot.removeLast();
    }
    if (filters.numOfPitch > 0) {
      numOfPitch = filters.numOfPitch;
    }
    if (filters.date.isNotEmpty) {
      dateToFilter = filters.date;
    }
    if(filters.priceRange.start > 0 && filters.priceRange.end < 1000){
      _price = filters.priceRange;
    }

    // TODO chiedere al campeggio come gestiscono le piazzole in base alle persone
    if (filters.numOfAdults > 0) {}
    if (filters.numOfChild > 0) {}
    // TODO capire se lasciarlo o meno
    if (filters.dist > 0) {}

    List<QueryDocumentSnapshot> documents = [];
    List<Camping> campings = [];

    if (snapshot.isEmpty) snapshot.add(await _campingCollection.get());

    if (snapshot.length > 1)
      documents = getQuerySnapshot(snapshot);
    else
      documents = getOneQuerySnapshot(snapshot);

    for (var document in documents) {
      pitchs =
          await CampingPitchService(cid: document.id).getPitch(dateToFilter,_price);
      if (pitchs.isNotEmpty) {
        if (numOfPitch > 0) {
          if (await _campingCollection
                  .doc(document.id)
                  .collection("pitchs")
                  .snapshots()
                  .length <
              numOfPitch) {
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
                campingPitch: pitchs,
                position:
                    CampingCoordinate.fromJson(document.data()['position']),
              ),
            );
          }
        } else {
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
              campingPitch: pitchs,
              position: CampingCoordinate.fromJson(document.data()['position']),
            ),
          );
        }
      }
    }
    campings = orderList(orderType, campings);

    return campings;
  }

  static List<QueryDocumentSnapshot> getQuerySnapshot(
      List<QuerySnapshot> queryList) {
    List<QueryDocumentSnapshot> categoryDocumentSnapshot = queryList[0].docs;
    List<QueryDocumentSnapshot> servicesDocumentSnapshot = queryList[1].docs;
    List<QueryDocumentSnapshot> result = [];

    for (var doc1 in categoryDocumentSnapshot) {
      for (var doc2 in servicesDocumentSnapshot) {
        if (doc1.id == doc2.id) result.add(doc1);
      }
    }
    return result;
  }

  static List<QueryDocumentSnapshot> getOneQuerySnapshot(
      List<QuerySnapshot> queryList) {
    List<QueryDocumentSnapshot> result = [];

    for (var doc in queryList[0].docs) {
      result.add(doc);
    }
    return result;
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
