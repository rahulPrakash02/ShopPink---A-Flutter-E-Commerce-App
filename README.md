# pinkshop

A basic dummy E-Commerce Application developed using Flutter. 

This is a model of a E-Shopping app designed with flutter. This app has been imbued with features that are listed below:

LIST OF ITEMS:
This list of items is taken from the fakestore api at : https://fakestoreapi.com/products , and is displayed on the homepage. 

INFORMATION PAGE:
This is an extension of the information shown as the api link is more extensively used, and its features are more exploited to show more information about the given product. This page is shown by tapping the corresponding product's card on the homepage. It also has two links, one to go to the shopping cart and one to go to the homepage. 

CART PAGE:
The list of items is constructed using staggered view. One can add an item or remove an item based on button presses. You can either show the list or hide the list. There is also provision to clear the list. There is a buy now option present, which will either process the transaction and send user alert using telegram bot, or display an error page. Both success page and Error page have options to go home. Which route is taken depends upon how much money the wallet has and whether it is enough for the current transaction. You can also directly go to cart via the floating action button present in the homepage.

WALLET:
a sort of makeshift money holder for the app to check on transactions. You can withdraw and recharge the amount in the wallet through use of the methods of the wallet class.

TELEGRAM ALERT:
If the transaction is a success, it sends a telegram alert to fixed URL through a fixed bot, telling us what we ordered, what was the price and the OTP to retrieve the order.

FLUTTER PACKAGES USED TO DESIGN THE APP:
1. HTTP
2. GET
3. STAGGERED GRID VIEW
4. URL LAUNCHER

Flutter features used in the following:
1. GestureDetector
2. Navigator
3. FloatingActionButton
4. Get.put() for dependency insertion
5. Futures, async and await was used for asynchronous fetch and display
6. Icons
7. Material Widget
8. Custom Widgets
9. Dart Classes and Objects

Other Features:
Telegram Alert
Wallet Model

Documentation and Readme will be updated regularly.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
