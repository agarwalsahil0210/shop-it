import 'package:flutter/material.dart';
import 'package:shop_it/widgets/counter_fav.dart';
import "package:velocity_x/velocity_x.dart";

class ProductDetailsPage extends StatefulWidget {
  String title;

  var price;
  String description;
  String image;
  ProductDetailsPage(
      {Key? key,
      required this.title,
      required this.description,
      required this.price,
      required this.image})
      : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image(
              alignment: Alignment.center,
              image: NetworkImage(widget.image),
              height: 300,
            ),
            const SizedBox(height: 20),
            VStack(
              [
                Text(widget.title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                10.heightBox,
                Text(widget.description,
                    textAlign: TextAlign.start, style: const TextStyle()),
                10.heightBox,
                [
                  "Price : \$".text.gray500.make(),
                  Text(widget.price.toString())
                ].row(),
                10.heightBox,
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey[600],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {},
                    child: const Text(
                      'Buy Now',
                    )),
                10.heightBox,
                const CounterWithFavBtn(),
              ],
            ).p20(),
          ]),
        ),
      ),
    );
  }
}
