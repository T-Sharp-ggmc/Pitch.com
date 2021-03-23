import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_camping/models/campingReviews.dart';

class ReviewService {

  static Future<List<CampingReviews>> getCampingReviews(String cid) async {
    CollectionReference _reviewCollection = FirebaseFirestore.instance.collection('campings').doc(cid).collection("reviews");

    QuerySnapshot snapshot = await _reviewCollection.get();
    List<CampingReviews> reviews = [];

    for (var document in snapshot.docs) {
      reviews.add(
        CampingReviews(
          cid: document.data()['cid'],
          title: document.data()['title'],
          description: document.data()['description'],
          date: document.data()['date'],
          rating: document.data()['rating'] is double ? document.data()['rating'] : CampingReviews.convertIntToDouble(document.data()['rating']),
        ),
      );
    }

    return reviews;
  }
}
