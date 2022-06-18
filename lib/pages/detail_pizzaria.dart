
import 'package:flutter/material.dart';

class DetailPizza extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Placeholder'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(40.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/pizza1.jpg"),
                  fit: BoxFit.cover,
                )
              ),
              child: Text(
                  args['name'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 35.0
                  )
              ),
            ),
            SizedBox(height: 20.0),
            Text(
                "Rating",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )
            ),
            Text(
              args['rating'],
            ),
            SizedBox(height: 20.0),
            Text(
                "Tilbud",
              style: TextStyle(
                fontWeight: FontWeight.bold,

              )
            ),
            Text(
                "   -    Tilbud 1"
            ),
            Text(
                "   -    Tilbud 2"
            ),
            SizedBox(height: 20.0),
            Text(
                "Menu",
                style: TextStyle(
                  fontWeight: FontWeight.bold,

                )
            ),
            Text(
                "Link"
            ),
            SizedBox(height: 20.0),
            Text(
                "Kontankt",
                style: TextStyle(
                  fontWeight: FontWeight.bold,

                )
            ),
            Text(
                "TLF"
            ),
            Text(
                "Addresse"
            ),
            SizedBox(height: 20.0),
            Text(
                "Anbefalet bestilling",
                style: TextStyle(
                  fontWeight: FontWeight.bold,

                )
            ),
            Text(
                "Anbf 1"
            ),
            Text(
                "Anbf 2"
            ),
            SizedBox(height: 20.0),
            Text(
                "Kommentarer",
                style: TextStyle(
                  fontWeight: FontWeight.bold,

                )
            ),
            Text(
                "Placeholder"
            ),
          ],
        )
    );
  }
}


