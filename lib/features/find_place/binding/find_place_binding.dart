import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/features/find_place/controller/find_place_controller.dart';

class FindPlaceBinding implements Binding {
  @override
  List<Bind> dependencies() {
    return [
      //Controller
      Bind.lazyPut(() => FindPlaceController()),
    ];
  }
}
