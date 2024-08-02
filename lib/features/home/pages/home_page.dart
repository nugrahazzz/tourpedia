import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:flutter/material.dart';
import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/core/app/extensions.dart';
import 'package:tourpedia/core/utils/global_widgets/widgets.dart';
import 'package:tourpedia/core/utils/resources/color_manager.dart';
import 'package:tourpedia/features/chat_gemini/components/introduce_chat_page.dart';
import 'package:tourpedia/features/discover/pages/discover_page.dart';
import 'package:tourpedia/features/find_place/pages/search_page.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:tourpedia/features/home/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> listOfWidget = <Widget>[
      const DiscoverPage(),
      const FindPlacePage(),
      const IntroduceChatPage(),
      // ProfileScreen()
      // const DashboardPage(),
      // const AgendaPage(),
    ];

    return ConnectivityWidget(
      showOfflineBanner: false,
      builder: (context, isOnline) => (isOnline)
          ? Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                color: ColorManager.primaryColor.withOpacity(0.1),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: controller.pageController,
                        children: listOfWidget,
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(
                    color: ColorManager.primaryColor,
                    width: 0.1.wp,
                  ),
                )),
                padding: EdgeInsets.only(
                  bottom: 1.75.wp,
                ),
                child: Obx(() => SlidingClippedNavBar(
                      backgroundColor: ColorManager.white,
                      onButtonPressed: (index) {
                        controller.onButtonPressed(index);
                      },
                      iconSize: 8.0.wp,
                      activeColor: ColorManager.primaryColor,
                      fontSize: 3.5.wp,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      selectedIndex: controller.selectedIndex.value,
                      barItems: <BarItem>[
                        BarItem(
                          icon: Icons.dashboard,
                          title: 'Discover',
                        ),
                        BarItem(
                          icon: Icons.search_rounded,
                          title: 'Search',
                        ),
                        BarItem(
                          icon: Icons.assistant,
                          title: 'AsistenQ',
                        ),
                        // BarItem(
                        //   icon: Icons.person_rounded,
                        //   title: 'Profil',
                        // ),
                      ],
                    )),
              ),
            )
          : NoConnectionDialog(
              colorStatusBar: ColorManager.transparent,
              colorNavigationBar: ColorManager.bgDark,
            ),
    );
  }
}

//ListView(
//   children: <Widget>[
//     SlimyCard(
//       color: Colors.red,
//       width: 200,
//       topCardHeight: 400,
//       bottomCardHeight: 200,
//       borderRadius: 15,
//       topCardWidget: myWidget01(),
//       bottomCardWidget: myWidget02(),
//       slimeEnabled: true,
//     ),
//   ],
// ),ListView(
//   children: <Widget>[
//     SlimyCard(
//       color: Colors.red,
//       width: 200,
//       topCardHeight: 400,
//       bottomCardHeight: 200,
//       borderRadius: 15,
//       topCardWidget: myWidget01(),
//       bottomCardWidget: myWidget02(),
//       slimeEnabled: true,
//     ),
//   ],
// ),
//SlimyCard(
//   topCardWidget: topCardWidget((snapshot.data)
//       ? 'assets/images/rock_aggresive.jpg'
//       : 'assets/images/rock_calm.jpg'),
// ),
