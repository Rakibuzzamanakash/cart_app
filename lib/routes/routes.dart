import 'package:cart_app/routes/routes_name.dart';
import 'package:cart_app/views/cart_view.dart';
import 'package:get/get.dart';

class AppRoutes {

  static appRoutes() => [
    GetPage(name: RoutesName.cartView,
      page: ()=> const CartView(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}