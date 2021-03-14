import 'package:my_camping/models/pitch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'availablePitchDateService.dart';

class CampingPitchService {
  final String cid;
  CampingPitchService({this.cid});

  //static CollectionReference _pitchCollection = FirebaseFirestore.instance.collection('campings'); //.doc(cid).collection('pitchs');

  Future<List<Pitch>> getPitch() async {

    //_pitchCollection = _pitchCollection.doc(cid).collection('pitchs');
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('campings').doc(cid).collection('pitchs').get();
    
    List<Pitch> pitchs = [];
    for (var document in snapshot.docs) {
      pitchs.add(
        Pitch(
          type: document.data()['type'],
          price: document.data()['price'],
          firstSize: document.data()['firstSize'],
          secondSize: document.data()['secondSize'],
          isAvailable: document.data()['isAvailable'],
          availableDate: await AvailablePitchDateService(pid: document.id, cid: this.cid).getAvailablePitchDate(),
        ),
      );
    }

    return pitchs;
  }
}
