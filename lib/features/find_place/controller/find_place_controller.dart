import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/features/discover/models/location.dart';

class FindPlaceController extends GetxController {
  RxString searchKeyword = "".obs;

  List<Location> listAllPlace = Location.getLocations().take(9).toList();
  late List<Location> listSearchPlace;

  void searchPlace() {
    if (searchKeyword.trim() != "") {
      listSearchPlace = Location.getSearchedlocation(searchKeyword.value);
    }
  }
}
