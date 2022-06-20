import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../classes/restaurant.dart';
import '../models/menu_item.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  @override
  _RestaurantDetailsScreenState createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final restaurant = ModalRoute.of(context).settings.arguments as Restaurant;
    final myController = TextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                shape: RoundedRectangleBorder(),
                primary: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/basket');
              },
              child: Text('Basket'),
            ),
          ],
        )),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom:
                      Radius.elliptical(MediaQuery.of(context).size.width, 50),
                ),
                image: DecorationImage(
                    image: NetworkImage(
                      restaurant.imageUrl,
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            RestaurantInformation(restaurant: restaurant),
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
              child: TextFormField(
                validator: (val) => val.isEmpty ? 'Test mand' : null,
                onChanged: (val) {},
                controller: myController,
                decoration: const InputDecoration(
                  labelText: 'Kommenter pizzariaet',
                ),
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection("${restaurant.name}")
                      .add({"comment": myController.text});
                  myController.clear();
                  FocusManager.instance.primaryFocus.unfocus();
                },
                child: Icon(Icons.send)),
            Container(
              width: 370,
              height: 150,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("${restaurant.name}")
                    .snapshots(),
                builder: (
                  context,
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if (!snapshot.hasData) return const SizedBox.shrink();

                  return MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, int index) {
                        final docData = snapshot.data.docs[index];
                        final comment = (docData['comment'] as String);

                        return Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade300))),
                          child: ListTile(
                            leading: Icon(Icons.person),
                            title: Text(comment),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: restaurant.tags.length,
              itemBuilder: (context, index) {
                return _buildMenuItems(restaurant, context, index);
              },
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildMenuItems(Restaurant restaurant, BuildContext context, int index) {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          restaurant.tags[index],
          style: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(color: Theme.of(context).accentColor),
        ),
      ),
      Column(
          children: restaurant.menuItems
              .where((menuItem) => menuItem.category == restaurant.tags[index])
              .map((menuItem) => Column(
                    children: [
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text(menuItem.name,
                              style: Theme.of(context).textTheme.headline5),
                          subtitle: Text(menuItem.description,
                              style: Theme.of(context).textTheme.bodyText1),
                          trailing: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  '${menuItem.price.toInt()} kr',
                                  style: Theme.of(context).textTheme.headline5),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 2,
                      )
                    ],
                  ))
              .toList())
    ],
  );
}

class RestaurantInformation extends StatelessWidget {
  final Restaurant restaurant;


  const RestaurantInformation({Key key, this.restaurant}) : super(key: key);

  String getDiscountString(Restaurant restaurant){
    var builder = StringBuffer();

    for (String n in restaurant.discounts){
      builder.write("- " + n + "\n");
    }

    return builder.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(restaurant.name,
                  style: Theme.of(context).textTheme.headline3.copyWith(
                    color: Theme.of(context).accentColor,
                  )),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tilbud",
                  style: Theme.of(context).textTheme.headline5, ),
                SizedBox(height: 5,),
                Text(getDiscountString(restaurant),
                    style: Theme.of(context).textTheme.bodyText1),
                Text("Rating",
                  style: Theme.of(context).textTheme.headline5,),
                SizedBox(height: 5,),
                //Rating widget
                Text("${restaurant.rating}/5.0"),
                SizedBox(height: 10,),
                Text("Leveringstid",
                  style: Theme.of(context).textTheme.headline5,),
                SizedBox(height: 5,),
                Text("10-15 minutter",
                    style: Theme.of(context).textTheme.bodyText1),
                SizedBox(height: 10,),
                Text("Kontakt",
                  style: Theme.of(context).textTheme.headline5,),
                SizedBox(height: 5,),
                Text("${restaurant.tlf} \n${restaurant.streetName}",
                    style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ),



        ],
      ),
    );
  }
}


