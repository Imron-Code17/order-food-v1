import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ordersystem/app/modules/home/controllers/home_controller.dart';
import 'package:ordersystem/styles/colors.dart';
import 'package:ordersystem/styles/typo.dart';

Widget minuman() {
  final controller = Get.put(HomeController());
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      GetBuilder<HomeController>(builder: (ctx) {
        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ctx.listMinuman.length,
            itemBuilder: (context, index) {
              final minuman = ctx.listMinuman[index];
              return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SizedBox(
                      height: Get.height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: Get.height * 0.08,
                              width: Get.width * 0.2,
                              decoration: BoxDecoration(
                                  color: colorPrimary,
                                  borderRadius: BorderRadius.circular(6),
                                  image: DecorationImage(
                                      image: NetworkImage('${minuman.image}'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 6,
                            child: SizedBox(
                                height: Get.height * 0.078,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('${minuman.name}',
                                        overflow: TextOverflow.ellipsis,
                                        style: body2normal),
                                    const SizedBox(height: 4),
                                    Text('${minuman.description}',
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            color: Colors.grey.shade500)),
                                    const Spacer(),
                                    Text('Rp. ${minuman.price}',
                                        style: heading3normal),
                                  ],
                                )),
                          ),
                          const Spacer(),
                          Expanded(
                            flex: 4,
                            child: SizedBox(
                                child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => controller.addMinuman(
                                        minuman.name!,
                                        minuman.id!,
                                        true,
                                        minuman.price!,
                                        0),
                                    child: Container(
                                      height: 22,
                                      width: 22,
                                      decoration: const BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle),
                                      child: const Center(
                                          child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 16,
                                      )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: GetBuilder<HomeController>(
                                        builder: (context) {
                                      return Text(
                                          (minuman.id == -1)
                                              ? "0"
                                              : minuman.qty.toString(),
                                          style: body2normal);
                                    }),
                                  ),
                                  GestureDetector(
                                    onTap: () => controller.addMinuman(
                                        minuman.name!,
                                        minuman.id!,
                                        false,
                                        minuman.price!,
                                        0),
                                    child: Container(
                                      height: 22,
                                      width: 22,
                                      decoration: const BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle),
                                      child: const Center(
                                          child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 16,
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          )
                        ],
                      )));
            });
      }),
      const SizedBox(height: 120)
    ],
  );
}
