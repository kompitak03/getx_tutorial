import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/Product.model.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;
  var currentPage = 0.obs;
  var isLoading = true.obs;
  var total = 0.obs;

  Future<void> getProductList(num page) async {
    var response = await http.get(Uri.parse('https://dummyjson.com/products?skip=${page * 30}'));
    isLoading.value = true;
    log('call');
    if (response.statusCode == 200) {
      List products = jsonDecode(response.body)['products'];
      total.value = jsonDecode(response.body)['total'];
      for (var product in products) {
        productList.add(Product.fromJson(product));
      }
      isLoading.value = false;
      update();
    } else {
      Get.snackbar(
          'Error Loading data!', 'Server response: ${response.statusCode}');
      isLoading.value = false;
    }
  }

}
