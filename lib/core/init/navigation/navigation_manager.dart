import 'package:get/get.dart';

import '../../../view/home_screen.dart';

class NavigationManager {
  static final NavigationManager _instance = NavigationManager._init();
  static NavigationManager get instance => _instance;
  NavigationManager._init();  

  static String get getHomeRoute => "/";

  static List<GetPage> get routes => [
        GetPage(name: getHomeRoute, page: () => const HomeScreen(),transition: Transition.size,transitionDuration: const Duration(milliseconds: 200)),
  ];
}
