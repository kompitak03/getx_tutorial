import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/products.controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future refresh() async {}
  final scrollCtl = ScrollController();
  final ProductController productController = ProductController();
  bool isBottom = false;

  @override
  void initState() {
    super.initState();
    productController.getProductList(0);
    scrollCtl.addListener(listenScrolling);
  }

  void listenScrolling() {
    if (scrollCtl.position.atEdge) {
      isBottom = scrollCtl.position.pixels != 0;

      setState(() {
        isBottom = isBottom;
      });

      if (isBottom) {
        if (productController.productList.length
            .isLowerThan(productController.total.value)) {
          productController.currentPage.value++;
          productController.getProductList(productController.currentPage.value);
        }
      }
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Obx(() =>
              Text("Home Clicks: ${productController.productList.length}")),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('This is a snackbar'),
                ));
              },
            ),
          ],
        ),
        body: Obx(
          () => productController.productList.isNotEmpty
              ? ListView.separated(
                  controller: scrollCtl,
                  itemCount: productController.productList.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final product = productController.productList[index];
                    return ListTile(
                      leading: Image.network(product.thumbnail),
                      title: Text(product.title),
                      subtitle: Text(product.description),
                    );
                  },
                )
              : const Center(
                  child: Text('No product available'),
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (isBottom) {
              scrollCtl.animateTo(
                0.0,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 300),
              );
            } else {
              scrollCtl.animateTo(
                scrollCtl.position.maxScrollExtent,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 300),
              );
            }
          },
          child: isBottom
              ? const Icon(Icons.arrow_upward)
              : const Icon(Icons.arrow_downward),
        ));
  }
}
