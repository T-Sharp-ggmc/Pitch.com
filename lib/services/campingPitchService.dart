import 'dart:math';

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
  static Future<int> getAvailablePitchCount(String pitchType, String cid) async {
    CollectionReference _pitchCollection = FirebaseFirestore.instance.collection('campings').doc(cid).collection('pitchs');
    QuerySnapshot snap = await _pitchCollection
      .where("isAvailable", isEqualTo: true)
      .where("type", isEqualTo: pitchType.toLowerCase())
      .get();
      
    return snap.docs.length ?? 0;
  }
  static Future<double> getPitchPrice(String pitchType, String cid) async {
    CollectionReference _pitchCollection = FirebaseFirestore.instance.collection('campings').doc(cid).collection('pitchs');
    QuerySnapshot snap = await _pitchCollection
      .where("isAvailable", isEqualTo: true)
      .where("type", isEqualTo: pitchType.toLowerCase())
      .get();
      
    return snap.docs.first.data()['price'] ?? 0;
  }
  static Future<List<double>> getPitchRangePrice(String cid) async {
    CollectionReference _pitchCollection = FirebaseFirestore.instance.collection('campings').doc(cid).collection('pitchs');
    QuerySnapshot snap = await _pitchCollection
      .where("isAvailable", isEqualTo: true)
      .get();

    List<double> priceRange = [];
    double lowerPrice;
    double higherPrice;
    
    for (var doc in snap.docs) {
      priceRange.add(doc.data()['price']);
    }
    lowerPrice = priceRange.reduce(min);
    higherPrice = priceRange.reduce(max);
    priceRange.clear();
    priceRange.add(lowerPrice);
    priceRange.add(higherPrice);

    return priceRange;
  }
}
