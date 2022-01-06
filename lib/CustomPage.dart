import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'ProductModel.dart';

class CustomPage extends StatelessWidget {
  CustomPage(this.product);

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.pink,
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: CachedNetworkImage(
                imageUrl: product.image!,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Text(
              product.title!,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.pink,
                    size: 20.0,
                  ),
                  SizedBox(
                    width: 3.0,
                  ),
                  Text(
                    product.rating!.rate.toString(),
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 20.0,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Center(
              child: Text(
                '\$${product.price!}',
                style: TextStyle(fontSize: 30.0, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
