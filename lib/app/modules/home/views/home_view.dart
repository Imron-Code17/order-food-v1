import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ordersystem/app/modules/home/views/cemilan.dart';
import 'package:ordersystem/app/modules/home/views/makanan.dart';
import 'package:ordersystem/app/modules/home/views/minuman.dart';
import 'package:ordersystem/app/routes/app_pages.dart';
import 'package:ordersystem/styles/typo.dart';
import 'package:badges/badges.dart' as bad;
import '../../../../styles/colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: colorPrimary,
            onPressed: () => Get.toNamed(Routes.CART),
            child: bad.Badge(
              badgeContent: GetBuilder<HomeController>(builder: (context) {
                return Text(
                  (context.total > 0) ? context.total.toString() : "",
                  style:
                      GoogleFonts.montserrat(color: Colors.white, fontSize: 12),
                );
              }),
              child: const Icon(
                Icons.shopping_bag,
                color: Colors.white,
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: colorPrimary,
            title: Text('Daftar Menu', style: heading1normal),
            elevation: 0,
            bottom: TabBar(
                labelPadding: const EdgeInsets.symmetric(vertical: 12),
                indicatorColor: Colors.white,
                labelStyle: body2normal,
                tabs: const [
                  Text('Makanan'),
                  Text('Minuman'),
                  Text('Cemilan')
                ]),
          ),
          body: TabBarView(children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(child: makanan()),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(child: minuman()),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(child: cemilan()),
            )
          ])),
    );
  }
}
