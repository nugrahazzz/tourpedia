import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/features/home/controller/home_controller.dart';

class HomeBinding implements Binding {
  @override
  List<Bind> dependencies() {
    return [
      //Controller
      Bind.put(HomeController()),
    ];
  }
}
