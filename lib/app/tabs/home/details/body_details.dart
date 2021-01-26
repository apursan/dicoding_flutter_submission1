import 'package:dicoding_flutter_submission1/app/components/custom_header.dart';
import 'package:flutter/material.dart';

Widget iconBadge({@required IconData icon, @required Color iconColor}) {
  return Container(
    padding: const EdgeInsets.all(4.0),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4.0,
          offset: Offset(3.0, 3.0),
        )
      ],
      shape: BoxShape.circle,
      color: Colors.white,
    ),
    child: Icon(
      icon,
      size: 20.0,
      color: iconColor,
    ),
  );
}

Widget detailsTab() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ut enim leo. In sagittis velit nibh. Morbi sollicitudin lorem vitae nisi iaculis,sit amet suscipit orci mollis. Ut dictum lectus eget diam vestibulum, at eleifend felis mattis. Sed molestie congue magna at venenatis. In mollis felis ut consectetur consequat.',
          ),
        ),
      ],
    ),
  );
}

Widget renderCardReview() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              child: Icon(Icons.person),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Person',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'Januari 26, 2021',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 50.0,
            top: 2.0,
          ),
          child: Text(
            'Cras ac nunc pretium, lacinia lorem ut, congue metus. Aenean vitae lectus at mauris eleifend placerat. Proin a nisl ut risus euismod ultrices et sed dui.',
            style: TextStyle(
              fontSize: 13.0,
            ),
          ),
        )
      ],
    ),
  );
}

Widget reviewTab() {
  return SingleChildScrollView(
    child: Container(
      child: Column(
        children: <Widget>[
          renderCardReview(),
          renderCardReview(),
          renderCardReview(),
          renderCardReview(),
        ],
      ),
    ),
  );
}

class BodyDetails extends StatefulWidget {
  @override
  _BodyDetailsState createState() => _BodyDetailsState();
}

class _BodyDetailsState extends State<BodyDetails>
    with TickerProviderStateMixin {
  int quantity = 0;
  int screenTab = 0;
  TabController _tabController;

  @override
  void initState() {
    this._tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map screenArguments = ModalRoute.of(context).settings.arguments;
    Map product = screenArguments['product'];
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CustomHeader(
            title: '',
            quantity: this.quantity,
            internalScreen: true,
          ),
          Container(
            margin: EdgeInsets.only(
              top: size.width * 0.55,
              left: 50.0,
              right: 50.0,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 50.0),
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              width: size.width - 100.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 15.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            product['name'],
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Text(
                            '\Rp ${product['price']}',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'dari',
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                        Text(' Warunk Blenger'),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 20.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            if (this.quantity > 0) {
                              setState(() {
                                this.quantity--;
                              });
                            }
                          },
                          child: Icon(
                            Icons.remove,
                            size: 30.0,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30.0,
                            vertical: 8.0,
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Pesan',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              this.quantity++;
                            });
                          },
                          child: Icon(
                            Icons.add,
                            size: 30.0,
                            color: theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TabBar(
                      controller: this._tabController,
                      labelColor: theme.primaryColor,
                      labelPadding: EdgeInsets.all(0),
                      indicatorColor: Colors.white,
                      labelStyle: TextStyle(
                        fontSize: 18.0,
                      ),
                      tabs: [
                        Container(
                          height: 25.0,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Deskripsi',
                          ),
                        ),
                        Container(
                          height: 25.0,
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Ulasan',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: this._tabController,
                      children: [
                        detailsTab(),
                        reviewTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
