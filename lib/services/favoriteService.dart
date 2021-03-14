import 'package:my_camping/models/camping.dart';
import 'package:my_camping/models/campingCoordinate.dart';
import 'package:my_camping/services/authService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_camping/utilities/enum.dart';

import 'campingPitchService.dart';

class FavoriteService {
  static final currentUserID = AuthService().getUserID();
  static CollectionReference favoriteCollection = FirebaseFirestore.instance.collection('users').doc(currentUserID).collection('favoriteCamping');

  static Future<List<Camping>> getFavoriteList() async {
    QuerySnapshot snapshot = await favoriteCollection.get();
    List<Camping> favoriteCampings = [];

    for (var document in snapshot.docs) {
      favoriteCampings.add(
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
          campingPitch: await CampingPitchService(cid: document.id).getPitch(),
          position: CampingCoordinate.fromJson(document.data()['position']),
        ),
      );
    }

    return favoriteCampings;
  }

  static Future<void> addInFavoriteList(Camping favCamping) async {
    await favoriteCollection.doc().set({
      'cid': favCamping.cid,
      'name': favCamping.name,
      'info': favCamping.info,
      'city': favCamping.city,
      'category': favCamping.category.toString(),
      'rating': favCamping.rating,
      'reviews': favCamping.reviews,
      'numOfBooking': favCamping.numOfBooking,
      'isPremium': favCamping.isPremium,
      'photos': [...favCamping.photos],
      'services': [...favCamping.services],
      // TODO capire se funge con la modifica
      //'campingPitch': [...favCamping.campingPitch.map((p) => p.toJson())], 
      'position': favCamping.position.toJson(),
    }).then((value) => print("Added success!"));
  }

  static Future<void> removeInFavoriteList(int favoriteCid) async {
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
