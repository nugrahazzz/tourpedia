import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/features/onboarding/controller/onboarding_controller.dart';

class OnboardingBinding implements Binding {
  @override
  List<Bind> dependencies() {
    return [
      //Controller
      Bind.put(OnboardingController()),
    ];
  }
}
