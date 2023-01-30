// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ordersystem/app/modules/cart/views/wa.dart';
import 'package:ordersystem/app/modules/home/controllers/home_controller.dart';
import 'package:ordersystem/styles/typo.dart';

import '../../../../styles/colors.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text('Pesanan', style: heading1normal),
        elevation: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GetBuilder<HomeController>(builder: (context) {
                  String namaMenu = "";
                  String qtyMenu = "";
                  String hargaMenu = "";
                  String daftarPesanan = "";
                  int banyakMakanan = 0;
                  int banyakMinum = 0;
                  int banyakCemil = 0;
                  int totalCart = 0;
                  int totalMinum = 0;
                  int totalCemilan = 0;
                  for (var element in context.listMakanan) {
                    if (element.qty != 0) {
                      daftarPesanan =
                          "$daftarPesanan\n${element.name} (${element.qty})";
                      namaMenu = "$namaMenu\n${element.name}\n";
                      qtyMenu = "$qtyMenu\n${element.qty}\n";
                      banyakMakanan += element.qty!;
                      hargaMenu = "$hargaMenu\n Rp. ${element.price}\n";
                      totalCart += element.price! * element.qty!;
                    }
                  }
                  for (var element in context.listMinuman) {
                    if (element.qty != 0) {
                      daftarPesanan =
                          "$daftarPesanan\n${element.name} (${element.qty})";
                      namaMenu = "$namaMenu\n${element.name}\n";
                      qtyMenu = "$qtyMenu\n${element.qty}\n";
                      banyakMinum += element.qty!;
                      hargaMenu = "$hargaMenu\n Rp. ${element.price}\n";
                      totalMinum += element.price! * element.qty!;
                    }
                  }
                  for (var element in context.listCemilan) {
                    if (element.qty != 0) {
                      daftarPesanan =
                          "$daftarPesanan\n${element.name} (${element.qty})";
                      namaMenu = "$namaMenu\n${element.name}\n";
                      qtyMenu = "$qtyMenu\n${element.qty}\n";
                      banyakCemil += element.qty!;
                      hargaMenu = "$hargaMenu\n Rp. ${element.price}\n";
                      totalCemilan += element.price! * element.qty!;
                    }
                  }
                  int totalQty = banyakMakanan + banyakMinum + banyakCemil;
                  int totalPesanan = totalCart + totalMinum + totalCemilan;
                  return Column(
                    children: [
                      head(),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 1,
                        height: 25,
                      ),
                      // , printer
                      listPesanan(namaMenu, qtyMenu, hargaMenu, banyakMakanan,
                          banyakMinum, banyakCemil),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 1.5,
                        height: 35,
                      ),
                      totalPesan(totalQty, totalPesanan),
                      const SizedBox(height: 42),
                      printStruk(daftarPesanan, totalPesanan)
                    ],
                  );
                })
              ],
            ),
          )),
    );
  }
}

Widget printStruk(String pes, int totalPesanan) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: SizedBox(
        width: double.infinity,
        height: 62,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: colorPrimary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: () => Get.dialog(kirim(pes, totalPesanan)),
          child: Text(
            'Lanjutkan',
            style: heading2normal,
          ),
        )),
  );
}

Widget listPesanan(String namaMenu, String qtyMenu, String hargaMenu, int makan,
    int minum, int cemil) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 8,
            child: Text(
              namaMenu,
              style: body2normal,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              qtyMenu,
              style: body2normal,
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              hargaMenu,
              style: body2normal,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget head() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 8,
        child: Text(
          "Menu Item",
          style: heading1normal,
        ),
      ),
      Expanded(
        flex: 3,
        child: Text(
          "Qty",
          style: heading1normal,
        ),
      ),
      Expanded(
        flex: 4,
        child: Text(
          "Harga",
          style: heading1normal,
        ),
      ),
    ],
  );
}

Widget totalPesan(int totalQty, int totalPesanan) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 8,
        child: Text("Total", style: body2normal),
      ),
      Expanded(
          flex: 3,
          child: Text(
            '$totalQty',
            style: heading2normal,
          )),
      Expanded(
        flex: 4,
        child: Text("Rp. $totalPesanan", style: body2normal),
      ),
    ],
  );
}

Widget kirim(String daftarPesanan, int totalPesanan) {
  final controller = Get.put(CartController());
  return SizedBox(
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.3, horizontal: 16),
      child: Container(
        height: Get.height * 0.6,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6)),
        child: Material(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama*', style: heading2normal),
              const SizedBox(height: 8),
              SizedBox(
                  height: 46,
                  child: TextField(
                    controller: controller.nama,
                    cursorColor: colorPrimary,
                    style: body2normal,
                    decoration: InputDecoration(
                        hintText: 'Isi Nama...',
                        hintStyle: body3normal,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: colorPrimary)),
                        border: const OutlineInputBorder()),
                  )),
              const SizedBox(height: 12),
              Text('Alamat*', style: heading2normal),
              const SizedBox(height: 8),
              SizedBox(
                  height: 46,
                  child: TextField(
                    controller: controller.alamat,
                    cursorColor: colorPrimary,
                    style: body2normal,
                    decoration: InputDecoration(
                        hintText: 'Isi Alamat...',
                        hintStyle: body3normal,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: colorPrimary)),
                        border: const OutlineInputBorder()),
                  )),
              const Spacer(),
              SizedBox(
                  width: double.infinity,
                  height: 62,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: colorPrimary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () async {
                      // ignore: prefer_interpolation_to_compose_strings
                      String data = '''
*Nama : ${controller.nama.text}
*Alamat : ${controller.alamat.text}
''';

                      WhatsAppM.direct("""
$data

*Pesanan :
  $daftarPesanan

*Total Bayar : Rp. $totalPesanan
""");
                    },
                    child: Text(
                      'Pesan',
                      style: heading2normal,
                    ),
                  )),
            ],
          ),
        ),
      ),
    ),
  );
}
