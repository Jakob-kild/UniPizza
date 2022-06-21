import 'package:flutter/material.dart';
import '../classes/restaurant.dart';
import 'maps.dart';
import 'pizzaSearch.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
  }

  final pages = [
    MapScreen(),
    menuScreen(),
    search(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        title: const Text('UniPizza', style: TextStyle(fontSize: 25)),
      ),
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }

  BottomNavigationBar CustomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Map'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search')
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class PizzariaCard extends StatelessWidget {
  final Pizzaria pizzaria;

  const PizzariaCard({Key key, this.pizzaria}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/home', arguments: pizzaria);
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
                      image: NetworkImage(pizzaria.imageUrl),
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
                    alignment: Alignment.center,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${pizzaria.rating}/5", style: Theme.of(context).textTheme.bodyText1),

                          WidgetSpan(
                            child: Icon(Icons.star, size: 17, color: Colors.yellow,),
                          ),

                        ],
                      ),
                    )),
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pizzaria.name,
                      style: Theme.of(context).textTheme.headline5),
                  SizedBox(height: 5),

                  // Text('${restaurant.tags}'),
                  Row(
                      children: pizzaria.discounts
                          .map(
                            (tag) => pizzaria.discounts.indexOf(tag) ==
                                    pizzaria.discounts.length - 1
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
                      '${pizzaria.distance}km - ${pizzaria.deliveryFee.toInt()} kr levering',
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

class menuScreen extends StatefulWidget {
  @override
  State<menuScreen> createState() => _menuScreenState();
}

class _menuScreenState extends State<menuScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
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
            itemCount: Pizzaria.restaurants.length,
            itemBuilder: (context, index) {
              return PizzariaCard(
                  pizzaria: Pizzaria.getSortedResturants()[index]);
            },
          ),
        ],
      )),
    );
  }
}
