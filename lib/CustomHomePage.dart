import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pinkshop/Informationpage.dart';
import 'package:pinkshop/productController.dart';

import 'CustomPage.dart';
import 'cartImplementation.dart';

class CustomHomePage extends StatelessWidget {
  //creating a controller object and using get.put() to insert dependencies.
  ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "   ShopPink",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Icon(
                    Icons.price_change,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  Text(
                    wal.balance.toStringAsFixed(2),
                    style: TextStyle(color: Colors.white),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CartPage()));
                    },
                    child: Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            //grid built inside obx function.
            child: Obx(
              () {
                if (productController.isLoading.value) {
                  //if isloading is true we get circular spinner.
                  return Center(child: CircularProgressIndicator());
                } else
                  //staggered grid view builds given number, in given layout, with given widget.
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: productController.productList.length,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Informationpage(
                                        productController.productList[index])));
                          },
                          child:
                              CustomPage(productController.productList[index]));
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}
