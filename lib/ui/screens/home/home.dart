// import 'package:evently/ui/screens/home/tabs/favorite/favorite_tab.dart';
// import 'package:evently/ui/screens/home/tabs/home/home_tab.dart';
// import 'package:evently/ui/screens/home/tabs/map/map_tab.dart';
// import 'package:evently/ui/screens/home/tabs/profile/profile_tab.dart';
// import 'package:evently/ui/utils/app_assets.dart';
// import 'package:evently/ui/utils/app_colors.dart';
// import 'package:evently/ui/utils/app_routes.dart';
// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int currentIndex = 0;
//   List<Widget> tabs = [
//     const HomeTab(),
//     const MapTab(),
//     const FavoriteTab(),
//     const ProfileTab(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: tabs[currentIndex],
//         floatingActionButton: buildFab(),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         bottomNavigationBar: buildBottomNavigationBar(),
//       ),
//     );
//   }

//   buildBottomNavigationBar() => Theme(
//     data: Theme.of(context).copyWith(canvasColor: AppColors.blue),
//     child: BottomNavigationBar(
//       currentIndex: currentIndex,
//       onTap: (index) {
//         currentIndex = index;
//         setState(() {});
//       },
//       items: [
//         BottomNavigationBarItem(
//           icon: ImageIcon(
//             AssetImage(
//               currentIndex == 0 ? AppAssets.homeActive : AppAssets.icHome,
//             ),
//           ),
//           label: "home",
//         ),
//         BottomNavigationBarItem(
//           icon: ImageIcon(
//             AssetImage(
//               currentIndex == 1 ? AppAssets.mapActive : AppAssets.icMap,
//             ),
//           ),
//           label: "map",
//         ),
//         BottomNavigationBarItem(
//           icon: ImageIcon(
//             AssetImage(
//               currentIndex == 2 ? AppAssets.loveActive : AppAssets.icFavorite,
//             ),
//           ),
//           label: "favorite",
//         ),
//         BottomNavigationBarItem(
//           icon: ImageIcon(
//             AssetImage(
//               currentIndex == 3 ? AppAssets.profileActive : AppAssets.icProfile,
//             ),
//           ),
//           label: "profile",
//         ),
//       ],
//     ),
//   );

//   buildFab() => FloatingActionButton(
//     backgroundColor: AppColors.blue,
//     shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 2)),
//     onPressed: () {
//       Navigator.push(context, AppRoutes.addEvent);
//     },
//     child: const Icon(Icons.add),
//   );
// }
import 'package:evently/ui/screens/home/tabs/favorite/favorite_tab.dart';
import 'package:evently/ui/screens/home/tabs/home/home_tab.dart';
import 'package:evently/ui/screens/home/tabs/map/map_tab.dart';
import 'package:evently/ui/screens/home/tabs/profile/profile_tab.dart';
import 'package:evently/ui/utils/app_assets.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_routes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const MapTab(),
    const FavoriteTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: tabs[currentIndex],
        floatingActionButton: buildFab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  buildBottomNavigationBar() => Theme(
    data: Theme.of(context).copyWith(canvasColor: AppColors.blue),
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) {
        currentIndex = index;
        setState(() {});
      },
      items: [
        buildNavigationBarItem(
          itemIndex: 0,
          label: 'home',
          selectedIcon: AppAssets.homeActive,
          unselectedIcon: AppAssets.icHome,
        ),
        buildNavigationBarItem(
          itemIndex: 1,
          label: 'map',
          selectedIcon: AppAssets.mapActive,
          unselectedIcon: AppAssets.icMap,
        ),
        buildNavigationBarItem(
          itemIndex: 2,
          label: 'favorite',
          selectedIcon: AppAssets.loveActive,
          unselectedIcon: AppAssets.icFavorite,
        ),
        buildNavigationBarItem(
          itemIndex: 3,
          label: 'profile',
          selectedIcon: AppAssets.profileActive,
          unselectedIcon: AppAssets.icProfile,
        ),
      ],
    ),
  );

  BottomNavigationBarItem buildNavigationBarItem({
    required int itemIndex,
    required String label,
    required String selectedIcon,
    required String unselectedIcon,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        currentIndex == itemIndex ? selectedIcon : unselectedIcon,
        fit: BoxFit.contain,
      ),
      label: label,
    );
  }

  buildFab() => FloatingActionButton(
    backgroundColor: AppColors.blue,
    shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 4)),
    onPressed: () {
      Navigator.push(context, AppRoutes.addEvent);
    },
    child: const Icon(Icons.add, size: 36, color: Colors.white),
  );
}
