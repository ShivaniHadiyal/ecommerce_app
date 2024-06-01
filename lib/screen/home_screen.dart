import 'package:e_commerce_flutter/core/api_service.dart';
import 'package:e_commerce_flutter/screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/product_controller.dart';
import '../core/product_repositry.dart';
import '../widget/page_wrapper.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int newIndex = 0;
  late final ProductController productController;

  @override
  void initState() {
    super.initState();
    // Initialize the ProductController here
    productController = Get.put(ProductController(ProductRepository(ApiService())));
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      AllProductList(controller: productController,),
      //FavoriteScreen(),
      // CartScreen(),
      //ProfileScreen()
    ];
    return PageWrapper(
      child: Scaffold(
/*        bottomNavigationBar: BottomNavyBar(
          itemCornerRadius: 10,
          selectedIndex: newIndex,
          items: AppData.bottomNavyBarItems
              .map(
                (item) => BottomNavyBarItem(
                  icon: item.icon,
                  title: Text(item.title),
                  activeColor: item.activeColor,
                  inactiveColor: item.inActiveColor,
                ),
              )
              .toList(),
          onItemSelected: (currentIndex) {
            newIndex = currentIndex;
            setState(() {});
          },
        ),*/
        body: PageTransitionSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (
              Widget child,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: screens[newIndex],
        ),
      ),
    );
  }
}
