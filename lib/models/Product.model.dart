import 'dart:developer';
import 'dart:ffi';

class Product {
  int id;
  String title;
  String description;
  num price;
  num discountPercentage;
  num rating;
  num stock;
  String brand;
  String category;
  String thumbnail;
  List<dynamic> images;

  Product(
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  );

  factory Product.fromJson(dynamic json) {
    return Product(
      json['id'] as int,
      json['title'] as String,
      json['description'] as String,
      json['price'] as num,
      json['discountPercentage'] as num,
      json['rating'] as num,
      json['stock'] as num,
      json['brand'] as String,
      json['category'] as String,
      json['thumbnail'] as String,
      json['images'] as List<dynamic>,
    );
  }
}
