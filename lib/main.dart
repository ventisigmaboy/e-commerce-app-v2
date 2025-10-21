import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:ecommerce_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
    ),
  );
}
