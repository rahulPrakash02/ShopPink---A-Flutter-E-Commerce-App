import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:pinkshop/cartClass.dart';
import 'package:pinkshop/productController.dart';
import 'dart:math';
import 'CustomHomePage.dart';
import 'Wallet.dart';
import 'closingPage.dart';

double totalCost = 0.0;
List<String> otherList = [];
List<String> list = [];
var activeList = otherList;
List<String> finalList = [];
double finalTotal = 0.0;
String show = "Show";
bool broke = false;
Wallet wal = Wallet();

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)),
              ),
              child: Row(
                children: [
                  Text(
                    "   Cart Page",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomHomePage()));
                    },
                    child: Icon(
                      Icons.house,
                      color: Colors.white,
                      size: 30.0,
                    ),
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
                  SizedBox(
                    width: 15.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        wal.balance += 50.0;
                      });
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 1,
              itemCount: productController.productList.length,
              mainAxisSpacing: 16,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                productController.productList[index].title!),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    totalCost += productController
                                        .productList[index].price!;
                                    list.add(productController
                                        .productList[index].title!);
                                    cartitemClass(productController
                                            .productList[index])
                                        .addItem();
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                  width: 30.0,
                                  height: 30.0,
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (search(
                                        list,
                                        productController
                                            .productList[index].title!)) {
                                      totalCost -= productController
                                          .productList[index].price!;
                                      list.remove(productController
                                          .productList[index].title!);
                                    }
                                    cartitemClass(productController
                                            .productList[index])
                                        .removeItem();
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                  width: 30.0,
                                  height: 30.0,
                                  child: Center(
                                      child: Icon(
                                    Icons.minimize,
                                    color: Colors.white,
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                            "\$${productController.productList[index].price!}"),
                      ],
                    ),
                  ],
                );
              },
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36.0),
                  topRight: Radius.circular(36.0)),
              color: Colors.pink[200],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          activeList =
                              activeList == otherList ? list : otherList;
                          show = show == "Show" ? "Hide" : "Show";
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "${show} List",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          list = [];
                          activeList = list;
                          totalCost = 0.0;
                          show = show == "Show" ? "Hide" : "Show";
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "Clear List",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Column(
                  children: function(activeList),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(child: Text("Total Price")),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "\$${totalCost.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    finalList = list;
                    finalTotal = totalCost;
                    setState(() {
                      list = [];
                      activeList = list;
                      totalCost = 0.0;
                      if (wal.balance < finalTotal) {
                        broke = true;
                      } else {
                        broke = false;
                        wal.withdraw(finalTotal);
                      }
                    });
                    if (!broke) {
                      _launchURL();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  closingPage(finalList, finalTotal)));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => altClosingPage()));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    width: 270.0,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Text(
                          "Buy Now",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> function(List<String> list) {
  List<Widget> res = [];
  Map<String, int> map = {};
  for (int i = 0; i < list.length; i++) {
    map[list[i]] = countItem(list, list[i]);
  }
  map.forEach((key, value) {
    res.add(Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Text(
              key.toString(),
            )),
            SizedBox(
              width: 10.0,
            ),
            Text(
              value.toString(),
            ),
          ],
        ),
      ),
    ));
  });
  return res;
}

bool search(List<String> list, String k) {
  for (int i = 0; i < list.length; i++) {
    if (list[i] == k) {
      return true;
    }
  }
  return false;
}

int countItem(List<String> strlist, String k) {
  int count = 0;
  for (int i = 0; i < strlist.length; i++) {
    if (strlist[i] == k) count++;
  }
  return count;
}

double walletlink() {
  return wal.balance;
}

_launchURL() async {
  String otp = "";
  for (int i = 0; i < 6; i++) {
    otp += (Random().nextInt(9) + 1).toString();
  }
  String url =
      'https://api.telegram.org/bot5065713297:AAFlIS_nyjbQvjOPtd1QclHau-3mE229pzE/sendMessage?chat_id=1346901426&text=Hello World. Your order for ${finalList.toString()} , totalling \$${finalTotal.toString()} is Placed. OTP is ${otp} for retrieval of order';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch url';
  }
}

//product management interview
//exponent - youtube channel
