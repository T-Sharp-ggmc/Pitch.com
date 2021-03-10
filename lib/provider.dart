import 'package:my_camping/provider/campingProvider.dart';
import 'package:my_camping/provider/favoriteCampingProvider.dart';
import 'package:my_camping/provider/premiumCampingProvider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProvider = [
  ChangeNotifierProvider(create: (_) => CampingProvider()),
  ChangeNotifierProvider(create: (_) => PremiumCampingProvider()),
  ChangeNotifierProvider(create: (_) => FavoriteCampingProvider()),
];
