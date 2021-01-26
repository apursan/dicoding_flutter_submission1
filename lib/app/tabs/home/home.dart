import 'package:dicoding_flutter_submission1/app/components/food_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<Map<String, String>> popularFood = [
    {
      'name': 'Ayam Capcay',
      'price': '25k',
      'rate': '4.9',
      'clients': '200',
      'image': 'images/plate-001.png'
    },
    {
      'name': 'Salmon Spesial',
      'price': '50k',
      'rate': '4.5',
      'clients': '168',
      'image': 'images/plate-002.png'
    },
    {
      'name': 'Rice and Meat',
      'price': '65k',
      'rate': '4.8',
      'clients': '150',
      'image': 'images/plate-003.png'
    },
    {
      'name': 'Vegan food',
      'price': '25k',
      'rate': '4.2',
      'clients': '150',
      'image': 'images/plate-007.png'
    },
    {
      'name': 'Special Dessert',
      'price': '95k',
      'rate': '4.6',
      'clients': '10',
      'image': 'images/plate-006.png'
    }
  ];

  final List<Map<String, String>> foodOptions = [
    {
      'name': 'Proteins',
      'image': 'images/Icon-001.png',
    },
    {
      'name': 'Burger',
      'image': 'images/Icon-002.png',
    },
    {
      'name': 'Fastfood',
      'image': 'images/Icon-003.png',
    },
    {
      'name': 'Salads',
      'image': 'images/Icon-004.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Laperin Aja',
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 105,
                  margin: const EdgeInsets.only(
                    top: 20.0,
                    bottom: 25.0,
                  ),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(
                        left: 20.0,
                      ),
                      itemCount: this.foodOptions.length,
                      itemBuilder: (context, index) {
                        Map<String, String> option = this.foodOptions[index];
                        return Container(
                          margin: const EdgeInsets.only(right: 35.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 70,
                                height: 70,
                                margin: const EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      option['image'],
                                    ),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10.0,
                                      color: Colors.grey[300],
                                      offset: Offset(6.0, 6.0),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                option['name'],
                                style: TextStyle(fontSize: 17.0),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                  child: Text(
                    'Makanan Terpopuler',
                    style: TextStyle(fontSize: 21.0),
                  ),
                ),
                Container(
                  height: 220.0,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 10.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: this.popularFood.length,
                    itemBuilder: (context, index) {
                      Map<String, String> product = this.popularFood[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            'details',
                            arguments: {
                              'product': product,
                              'index': index,
                            },
                          );
                        },
                        child: Hero(
                          tag: 'detail_food$index',
                          child: FoodCard(
                            width: size.width / 2 - 30.0,
                            primaryColor: theme.primaryColor,
                            productName: product['name'],
                            productPrice: product['price'],
                            productUrl: product['image'],
                            productClients: product['clients'],
                            productRate: product['rate'],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    bottom: 10.0,
                    top: 35.0,
                  ),
                  child: Text(
                    'Makanan Tebaik',
                    style: TextStyle(fontSize: 21.0),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Map<String, String> localProduct = {
                      'name': 'Sandwich Blenger',
                      'price': '35k',
                      'rate': '5.0',
                      'clients': '150',
                      'image': 'images/plate-005.jpg'
                    };
                    Navigator.pushNamed(context, 'details', arguments: {
                      'product': localProduct,
                      'index': this.popularFood.length
                    });
                  },
                  child: Hero(
                    tag: 'detail_food${this.popularFood.length}',
                    child: Container(
                        width: size.width - 40,
                        color: Colors.white,
                        padding: const EdgeInsets.only(bottom: 10.0),
                        margin: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 15.0,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    height: size.width - 40,
                                    width: size.width - 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                      image: DecorationImage(
                                        image:
                                            AssetImage('images/plate-005.jpg'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 4.0,
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Sandwich Blenger',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 5.0,
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      '5.0 \(150\)',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    Text(
                                      '\Rp 35k',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
