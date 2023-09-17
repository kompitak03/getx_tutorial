import 'package:get/get.dart';

class DummyProvider extends GetConnect {

  Future<Response> getProduct(int id) => get('https://dummyjson.com/products/$id');

  Future<Response> getProducts() => get('https://dummyjson.com/products');

}