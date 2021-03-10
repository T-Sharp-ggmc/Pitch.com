import 'package:my_camping/models/camping.dart';
import 'package:my_camping/models/campingCoordinate.dart';
import 'package:my_camping/models/pitch.dart';
import 'package:my_camping/services/authService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteService {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  static final currentUserID = AuthService().getUserID();

  static Future<List<Camping>> getFavoriteList() async {
    CollectionReference favoriteCollection =
        userCollection.doc(currentUserID).collection('favoriteCamping');
    QuerySnapshot snapshot = await favoriteCollection.get();
    List<Camping> favoriteCampings = [];

    for (var document in snapshot.docs) {
      favoriteCampings.add(
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

    return favoriteCampings;
  }

  static Future<void> addInFavoriteList(Camping favCamping) async {
    CollectionReference favoriteCollection =
        userCollection.doc(currentUserID).collection('favoriteCamping');
    await favoriteCollection.doc().set({
      'cid': favCamping.cid,
      'name': favCamping.name,
      'info': favCamping.info,
      'city': favCamping.city,
      'category': favCamping.category,
      'rating': favCamping.rating,
      'reviews': favCamping.reviews,
      'numOfBooking': favCamping.numOfBooking,
      'isPremium': favCamping.isPremium,
      'photos': [...favCamping.photos],
      'services': [...favCamping.services],
      'campingPitch': [...favCamping.campingPitch.map((p) => p.toJson())],
      'position': favCamping.position.toJson(),
    }).then((value) => print("Added success!"));
  }

  static Future<void> removeInFavoriteList(int favoriteCid) async {
    CollectionReference favoriteCollection =
        userCollection.doc(currentUserID).collection('favoriteCamping');
    await favoriteCollection
        .where("cid", isEqualTo: favoriteCid)
        .get()
        .then((value) => {
              value.docs.forEach((element) {
                favoriteCollection
                    .doc(element.id)
                    .delete()
                    .then((value) => {print("Remove success!")});
              })
            });
  }
}
