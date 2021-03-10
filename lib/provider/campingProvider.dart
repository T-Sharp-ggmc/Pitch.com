import 'package:my_camping/models/camping.dart';
import 'package:my_camping/services/campingService.dart';
import 'package:flutter/material.dart';

class CampingProvider extends ChangeNotifier {
  String _keyword = "";
  List<Camping> _campings;
  List<Camping> _searchedCampings;

  String get keyword => _keyword;
  List<Camping> get campings => _campings;
  List<Camping> get searchedCampings => _searchedCampings;

  void loadCamping() async {
    _campings = await CampingService.getCamping();

    notifyListeners();
  }

  void searchCamping(String query) async {
    _keyword = query;
    _searchedCampings =
        campings.where((c) => c.name.toLowerCase().contains(keyword)).toList();

    notifyListeners();
  }

  void resetKeyword() {
    _keyword = "";

    notifyListeners();
  }
}
