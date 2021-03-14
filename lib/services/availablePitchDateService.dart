import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_camping/models/pitchAvailableDate.dart';

class AvailablePitchDateService {
  final String pid;
  final String cid;
  AvailablePitchDateService({this.cid, this.pid});

  //static CollectionReference _availablePitchDateCollection = FirebaseFirestore.instance.collection('campings');

  Future<List<PitchAvailableDate>> getAvailablePitchDate() async {
    //_availablePitchDateCollection = _availablePitchDateCollection.doc(cid).collection("pitchs").doc(pid).collection("availableDate");
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('campings').doc(cid).collection("pitchs").doc(pid).collection("availableDate").get();
    
    List<PitchAvailableDate> availablePitchDateList = [];
    for (var document in snapshot.docs) {
      availablePitchDateList.add(
        PitchAvailableDate(
          endDate: document.data()['endDate'],
          startDate: document.data()['startDate'],
        ),
      );
    }
    return availablePitchDateList;
  }
}
