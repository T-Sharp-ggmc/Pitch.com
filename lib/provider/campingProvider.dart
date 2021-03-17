import 'package:my_camping/models/camping.dart';
import 'package:my_camping/models/filter.dart';
import 'package:my_camping/services/searchService.dart';
import 'package:flutter/material.dart';
import 'package:my_camping/utilities/enum.dart';

class CampingProvider extends ChangeNotifier {
  String _keyword = "";
  List<Camping> _campings;
  List<Camping> _searchedCampings;

  String get keyword => _keyword;
  List<Camping> get campings => _campings;
  List<Camping> get searchedCampings => _searchedCampings;

  void loadCamping(OrderType orderType, Filter filters) async {
    if(filters != null)
      _campings = await SearchService.getFilteredCamping(orderType, filters);
    else
      _campings = await SearchService.getCamping(orderType);

    notifyListeners();
  }

  void searchCamping(String query) async {
    _keyword = query;
    _searchedCampings =
        campings.where((c) => c.name.toLowerCase().contains(keyword) || c.city.toLowerCase().contains(keyword)).toList();

    notifyListeners();
  }

  void resetKeyword() {
    _keyword = "";

    notifyListeners();
  }
}
