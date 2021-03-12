import 'package:my_camping/models/camping.dart';
import 'package:my_camping/models/campingCoordinate.dart';
import 'package:my_camping/models/pitch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CampingService {
  static CollectionReference _campingCollection = FirebaseFirestore.instance.collection('campings');

  static Future<List<Camping>> getCamping() async {
    QuerySnapshot snapshot = await _campingCollection.get();

    List<Camping> campings = [];

    for (var document in snapshot.docs) {
      campings.add(
        Camping(
          cid: document.data()['cid'],
          name: document.data()['name'],
          info: document.data()['info'],
          city: document.data()['city'],
          category: document.data()['category'],
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
          campingPitch: (document.data()['campingPitch'] as List)
              .map((p) => Pitch.fromJson(p))
              .toList(),
          position: CampingCoordinate.fromJson(document.data()['position']),
        ),
      );
    }

    return campings;
  }

  static Future<List<Camping>> getPremiumCamping() async {
    QuerySnapshot snapshot = await _campingCollection.get();
    var documents =
        snapshot.docs.where((document) => document.data()['isPremium'] == true);
    List<Camping> campings = [];

    for (var document in documents) {
      campings.add(
        Camping(
          cid: document.data()['cid'],
          name: document.data()['name'],
          info: document.data()['info'],
          city: document.data()['city'],
          category: document.data()['category'],
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
          campingPitch: (document.data()['campingPitch'] as List)
              .map((p) => Pitch.fromJson(p))
              .toList(),
          position: CampingCoordinate.fromJson(document.data()['position']),
        ),
      );
    }

    return campings;
  }
}
