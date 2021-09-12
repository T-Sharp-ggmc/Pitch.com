import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_camping/models/pitchAvailableDate.dart';
import 'package:intl/intl.dart';

class AvailablePitchDateService {
  final String pid;
  final String cid;
  AvailablePitchDateService({this.cid, this.pid});

  Future<List<PitchAvailableDate>> getAvailablePitchDate(List<String> dateToFilter) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('campings').doc(cid).collection("pitchs").doc(pid).collection("availableDate").get();
    
    List<PitchAvailableDate> availablePitchDateList = [];

    for (var document in snapshot.docs) {
      availablePitchDateList.add(
        PitchAvailableDate(
          endDate: document.data()['endDate'],
          startDate: document.data()['startDate'],
        ),
      );
    }

    if(dateToFilter.isNotEmpty && availablePitchDateList.isNotEmpty){
      return getDateFiltered(availablePitchDateList, dateToFilter);
    }

    return availablePitchDateList;
  }

  List<PitchAvailableDate> getDateFiltered(List<PitchAvailableDate> availablePitchDateList, List<String> dateToFilter){
    List<PitchAvailableDate> listOfPitchFiltered = [];

    // convertire la lista del db in datetime
    for (var x = 0; x < availablePitchDateList.length; x++) {

      DateTime startDateTime = DateTime.parse(availablePitchDateList[x].startDate);
      DateTime endDateTime = DateTime.parse(availablePitchDateList[x].endDate);
      
      // ricavare tutte le date tra la start e la end in string
      List<String> listDate = getDaysInBeteween(startDateTime, endDateTime);
      
      // cercare date corrispondenti e salvarle in una lista
      bool allContained = true;
      
        for (var i = 0; i < dateToFilter.length; i++) {
          if(!listDate.contains(dateToFilter[i]))
          {  allContained = false;
            break;
          }
        }
      
      if(allContained)
        listOfPitchFiltered.add(availablePitchDateList[x]);
    }

    return listOfPitchFiltered;
  }

  List<String> getDaysInBeteween(DateTime startDate, DateTime endDate) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String dateFormatted;
    List<String> days = [];
    DateTime start = startDate;
    dateFormatted = formatter.format(start);
    days.add(dateFormatted);
    
      for (int i = 1; i <= endDate.difference(startDate).inDays; i++) {
        start = start.add(Duration(days: 1));
        dateFormatted = formatter.format(start);
        days.add(dateFormatted);
      }
      return days;
  }
}
