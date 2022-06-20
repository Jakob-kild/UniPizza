import 'package:flutter/material.dart';
import '../classes/restaurant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
       toolbarHeight: 50,
        title: Text(
          'UniPizza',style: TextStyle(fontSize: 25),
        ),
      )
      ,
      body: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Pizzeriaer',
                  style: Theme.of(context).textTheme.headline4,
                )),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: Restaurant.restaurants.length,
            itemBuilder: (context, index) {
              return RestaurantCard(restaurant: Restaurant.restaurants[index]);
            },
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({Key key, this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/home', arguments: restaurant);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                      image: NetworkImage(restaurant.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  )),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${restaurant.deliveryTime} min',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )),
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(restaurant.name,
                      style: Theme.of(context).textTheme.headline5),
                  SizedBox(height: 5),

                  // Text('${restaurant.tags}'),
                  Row(
                      children: restaurant.tags
                          .map(
                            (tag) => restaurant.tags.indexOf(tag) ==
                                    restaurant.tags.length - 1
                                ? Text(tag,
                                    style:
                                        Theme.of(context).textTheme.bodyText1)
                                : Text('$tag, ',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                          )
                          .toList()),
                  SizedBox(height: 5),
                  Text(
                      '${restaurant.distance}km -\$${restaurant.deliveryFee} delivery fee',
                      style: Theme.of(context).textTheme.bodyText1)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


  @override
  Size get preferredSize => Size.fromHeight(56);

