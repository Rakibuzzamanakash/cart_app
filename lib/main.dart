import 'package:cart_app/resources/app_collors/app_colors.dart';
import 'package:cart_app/routes/routes.dart';
import 'package:cart_app/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appWhiteColor1,
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesName.cartView,
        getPages: AppRoutes.appRoutes(),

      ),
    );
  }
}

