import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ordersystem/app/data/minuman_model.dart';

import '../../../data/cemilan_model.dart';
import '../../../data/makanan_model.dart';

class HomeController extends GetxController {
  int totMaki = 0;
  int totMini = 0;
  int totCemi = 0;

  int get totMak => totMaki;
  int get totMin => totMini;
  int get totCem => totCemi;

  int get total => totMaki + totMini + totCemi;
  final int _satu = 1;
  final int _dua = 2;
  final int _tiga = 2;
  int totalPrices = 0;
  int get totalPrice => _satu + _dua + _tiga;

  void addMakanan(String name, int id, bool isAdd, int price, int totalPrice) {
    if (listMakanan.where((element) => id == element.id).isNotEmpty) {
      var index = listMakanan.indexWhere((element) => element.id == id);
      listMakanan[index].qty = (isAdd)
          ? listMakanan[index].qty! + 1
          : (listMakanan[index].qty! > 0)
              ? listMakanan[index].qty! - 1
              : 0;

      totMaki = (isAdd)
          ? totMaki + 1
          : (totMaki > 0)
              ? totMaki - 1
              : 0;

      totalPrices = (isAdd)
          ? price * totMaki
          : (totMaki > 0)
              ? totalPrice - price
              : 0;
    } else {
      listMakanan.add(Makanan(
          name: name, id: id, qty: 1, price: price, totalPrice: totalPrice));
      totMaki = totMaki + 1;
      totalPrices = price * totMaki + 1;
    }
    update();
  }

  List<Makanan> listMakanan = [];
  List<Makanan> makanan = [];

  getMakanan() async {
    var response = await http.get(Uri.parse(
        'https://script.google.com/macros/s/AKfycbyrYTcTqDxNENhMTq8AvXUgw5Twe3N3ghmsLdpDjt045REa_1C5KXV7va7tA7Bt4bBMoA/exec'));

    if (response.statusCode == 200) {
      makanan = (json.decode(response.body) as List)
          .map((e) => Makanan.fromJson(e))
          .toList();

      listMakanan = makanan;

      update();
    }
  }

  void addMinuman(String name, int id, bool isAdd, int price, int totalPrice) {
    if (listMinuman.where((element) => id == element.id).isNotEmpty) {
      var index = listMinuman.indexWhere((element) => element.id == id);
      listMinuman[index].qty = (isAdd)
          ? listMinuman[index].qty! + 1
          : (listMinuman[index].qty! > 0)
              ? listMinuman[index].qty! - 1
              : 0;

      totMini = (isAdd)
          ? totMini + 1
          : (totMini > 0)
              ? totMini - 1
              : 0;

      totalPrices = (isAdd)
          ? price * totMini
          : (totMini > 0)
              ? totalPrice - price
              : 0;
    } else {
      listMinuman.add(Minuman(
          name: name, id: id, qty: 1, price: price, totalPrice: totalPrice));
      totMini = totMini + 1;
      totalPrices = price * totMini + 1;
    }
    update();
  }

  List<Minuman> listMinuman = [];
  List<Minuman> minuman = [];
  getMinuman() async {
    var response = await http.get(Uri.parse(
        'https://script.google.com/macros/s/AKfycbx6PTOAvVbD9Le7zrlDu6P3qSZVFx5C_4MntEFEt84Rv746PUal4t-rP3ARRPjW38miWA/exec'));

    if (response.statusCode == 200) {
      minuman = (json.decode(response.body) as List)
          .map((e) => Minuman.fromJson(e))
          .toList();

      listMinuman = minuman;

      update();
    }
  }

  void addCemilan(String name, int id, bool isAdd, int price, int totalPrice) {
    if (listCemilan.where((element) => id == element.id).isNotEmpty) {
      var index = listCemilan.indexWhere((element) => element.id == id);
      listCemilan[index].qty = (isAdd)
          ? listCemilan[index].qty! + 1
          : (listCemilan[index].qty! > 0)
              ? listCemilan[index].qty! - 1
              : 0;

      totCemi = (isAdd)
          ? totCemi + 1
          : (totCemi > 0)
              ? totCemi - 1
              : 0;

      totalPrices = (isAdd)
          ? price * totCemi
          : (totCemi > 0)
              ? totalPrice - price
              : 0;
    } else {
      listCemilan.add(Cemilan(
          name: name, id: id, qty: 1, price: price, totalPrice: totalPrice));
      totCemi = totCemi + 1;
      totalPrices = price * totCemi + 1;
    }
    update();
  }

  List<Cemilan> listCemilan = [];
  List<Cemilan> cemilan = [];
  getCemilan() async {
    var response = await http.get(Uri.parse(
        'https://script.google.com/macros/s/AKfycbz-82R7wLuOPzyCbDZEP3DkY8WoaL0LCJ6cA7h9LJocpTDmIqPJOw8VzYPyoioQSR7tKw/exec'));

    if (response.statusCode == 200) {
      cemilan = (json.decode(response.body) as List)
          .map((e) => Cemilan.fromJson(e))
          .toList();

      listCemilan = cemilan;

      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getMakanan();
    getMinuman();
    getCemilan();
  }
}
