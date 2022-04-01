import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.transparent,
              statusBarColor: Colors.transparent),
          elevation: 0.0,
          titleSpacing: 0,
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 59, 58, 58)),
          ),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                alignment: Alignment.topLeft,
                child: const Text(
                  'My Account',
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Icon(
                        Ionicons.notifications_outline,
                        color: Colors.black,
                      ),
                    ),
                    Icon(Ionicons.search, color: Colors.black),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          userDetails(),
          topButtons(),
          const SizedBox(height: 20.0),
          yourOrdersProducts(),
          const SizedBox(height: 15.0),
          Container(height: 3.0, color: Colors.black12),
          const SizedBox(height: 15.0),
          keepShoppingForProducts(),
          const SizedBox(height: 15.0),
          Container(height: 3.0, color: Colors.black12),
          const SizedBox(height: 15.0),
          buyAgainProducts(),
          const SizedBox(height: 15.0),
          Container(height: 3.0, color: Colors.black12),
          const SizedBox(height: 65.0)
        ],
      ),
    );
  }

  Widget userDetails() {
    return Container(
      decoration: const BoxDecoration(
          // color: Colors.white,
          // borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                'Hello,',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 05.0),
                child: const Text(
                  'Sahil',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 02.5),
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.black26),
            child: const Padding(
              padding: EdgeInsets.all(05.0),
              child: Icon(
                Icons.person_outline_rounded,
                color: Colors.white,
                size: 31.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget topButtons() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    height: 40.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 0.0),
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.white),
                    child: OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black12.withOpacity(0.03),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Your orders',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    height: 40.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 0.0),
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.white),
                    child: OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black12.withOpacity(0.03),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Buy Again',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                height: 40.0,
                child: OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black12.withOpacity(0.03),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Your Account',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                height: 40.0,
                child: OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black12.withOpacity(0.03),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Your Wish List',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget yourOrdersProducts() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15.0),
              child: const Text(
                'Your Orders',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                'See all',
                style: TextStyle(
                    color: Colors.cyan[800], fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
        Container(
          height: 170.0,
          padding: const EdgeInsets.only(left: 10.0, top: 20.0, right: 0.0),
          child: ListView.builder(
              itemCount: itemsList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var data = itemsList;
                return Container(
                  padding: const EdgeInsets.only(left: 05.0, right: 05.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 1.5),
                        borderRadius: BorderRadius.circular(05.0),
                        color: Colors.white),
                    child: Container(
                      width: 180.0,
                      padding: const EdgeInsets.all(10.0),
                      alignment: Alignment.center,
                      child: Image.network(data[index].image1,
                          fit: BoxFit.cover, width: 180.0),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget keepShoppingForProducts() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15.0),
              child: const Text(
                'Keep shopping for',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              'Edit',
              style: TextStyle(
                  color: Colors.cyan[800], fontWeight: FontWeight.normal),
            ),
            const Text(
              '|',
              style: TextStyle(color: Colors.black),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                'Browser history',
                style: TextStyle(
                    color: Colors.cyan[800], fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
        Container(
          height: 180.0,
          padding: const EdgeInsets.only(left: 10.0, top: 20.0, right: 0.0),
          child: ListView.builder(
              itemCount: itemsList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var data = itemsList;
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 05.0, right: 05.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black12, width: 1.5),
                            borderRadius: BorderRadius.circular(05.0),
                            color: Colors.white),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          child: Image.network(data[index].image2,
                              fit: BoxFit.cover, height: 120.0, width: 120.0),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: 130.0,
                      padding: const EdgeInsets.only(top: 04.0),
                      child: Text(data[index].title),
                    )
                  ],
                );
              }),
        ),
      ],
    );
  }

  Widget buyAgainProducts() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Buy Again',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'See all',
                style: TextStyle(
                    color: Colors.cyan[800], fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        Container(
          height: 140.0,
          padding: const EdgeInsets.only(left: 10.0, top: 20.0, right: 0.0),
          child: ListView.builder(
              itemCount: itemsList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var data = itemsList;
                return Container(
                  padding: const EdgeInsets.only(left: 05.0, right: 05.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 1.5),
                        borderRadius: BorderRadius.circular(05.0),
                        color: Colors.white),
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      alignment: Alignment.center,
                      child: Image.network(data[index].image3,
                          fit: BoxFit.cover, width: 100.0),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  List<ItemLists> itemsList = [
    ItemLists(
      image1: 'https://m.media-amazon.com/images/I/615fBi41SoL._SL1500_.jpg',
      image2: 'https://m.media-amazon.com/images/I/71VsrlK3VZL._SL1500_.jpg',
      title: 'Books',
      btTitle: 'Your Browsing History',
      image3: 'https://m.media-amazon.com/images/I/71VsrlK3VZL._SL1500_.jpg',
    ),
    ItemLists(
      image1: 'https://m.media-amazon.com/images/I/519uMzMXJVL._SL1100_.jpg',
      image2: 'https://m.media-amazon.com/images/I/71b5BwTCcZL._SL1500_.jpg',
      title: 'Smartphone & gift',
      btTitle: 'Amazon Pay',
      image3: 'https://m.media-amazon.com/images/I/31ybLm+jxNL.jpg',
    ),
    ItemLists(
      image1: 'https://m.media-amazon.com/images/I/616iwsWI1OS._SL1500_.jpg',
      image2: 'https://m.media-amazon.com/images/I/61KIy6gX-CL._SL1000_.jpg',
      title: 'Tablets',
      btTitle: 'Subscribe & Save',
      image3: 'https://m.media-amazon.com/images/I/61KIy6gX-CL._SL1000_.jpg',
    ),
    ItemLists(
      image1: 'https://m.media-amazon.com/images/I/61UtY2UWYYS._SL1500_.jpg',
      image2: 'https://m.media-amazon.com/images/I/61UtY2UWYYS._SL1500_.jpg',
      title: 'Audio headphone',
      btTitle: 'Prime',
      image3: 'https://m.media-amazon.com/images/I/61UtY2UWYYS._SL1500_.jpg',
    ),
  ];
}

class ItemLists {
  String image1;
  String image2;
  String title;
  String btTitle;
  String image3;

  ItemLists(
      {required this.image1,
      required this.image2,
      required this.title,
      required this.btTitle,
      required this.image3});
}
