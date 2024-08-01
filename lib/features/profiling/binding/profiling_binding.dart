import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/features/profiling/controller/profiling_controller.dart';

class ProfilingBinding implements Binding {
  @override
  List<Bind> dependencies() {
    return [
      //Controller
      Bind.lazyPut(() => ProfilingController()),
    ];
  }
}
