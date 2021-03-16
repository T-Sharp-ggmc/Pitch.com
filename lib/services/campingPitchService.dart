import 'package:flutter/material.dart';
import 'package:my_camping/models/pitch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_camping/models/pitchAvailableDate.dart';

import 'availablePitchDateService.dart';

class CampingPitchService {
  final String cid;
  CampingPitchService({this.cid});

  Future<List<Pitch>> getPitch(List<String> dateToFilter, RangeValues rangeValues) async {
    QuerySnapshot snapshot;
    if(rangeValues == null)
      snapshot = await FirebaseFirestore.instance.collection('campings').doc(cid).collection('pitchs').get();
    else
      snapshot = await FirebaseFirestore.instance.collection('campings').doc(cid).collection('pitchs')
      .where("price", isGreaterThan: rangeValues.start)
      .where("price", isLessThan: rangeValues.end)
      .get();
    
    List<Pitch> pitchs = [];
    List<PitchAvailableDate> date = [];
      for (var document in snapshot.docs) {
        date = await AvailablePitchDateService(pid: document.id, cid: this.cid).getAvailablePitchDate(dateToFilter);
        if(date.isNotEmpty){
          pitchs.add(
            Pitch(
              pid: document.data()['pid'],
              type: document.data()['type'],
              price: document.data()['price'],
              firstSize: document.data()['firstSize'],
              secondSize: document.data()['secondSize'],
              isAvailable: document.data()['isAvailable'],
              availableDate: date,
            ),
          );
        }
      }
    return pitchs;
  }
}
