enum PopupTextType { no, ad, ch }

enum OrderType { noOrder, priceCre, priceDec, avgRating, popCamp }

enum CampingCategory { none, mare, lago, montagna, fiume }

class EnumUtilities {
  
  static CampingCategory getCategoryEnum(String dbValue) {
    switch (dbValue.toLowerCase()) {
      case 'mare':
        return CampingCategory.mare;
        break;
      case 'lago':
        return CampingCategory.lago;
        break;
      case 'montagna':
        return CampingCategory.montagna;
        break;
      case 'fiume':
        return CampingCategory.fiume;
        break;
      default:
        return CampingCategory.none;
    }
  }

  static String getCategoryString(CampingCategory dbValue) {
    switch (dbValue) {
      case CampingCategory.mare:
        return 'mare';
        break;
      case CampingCategory.lago:
        return  'lago';
        break;
      case CampingCategory.montagna:
        return 'montagna';
        break;
      case CampingCategory.fiume:
        return 'fiume';
        break;
      default:
        return "";
    }
  }

  static List<String> getCategoryStringList(List<CampingCategory> cat){
    List<String> catList = <String>[];
    for (var i = 0; i < cat.length; i++) {
      catList.add(getCategoryString(cat[i]));
    }
    return catList;
  }
  
}

