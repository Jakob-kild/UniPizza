
import 'package:flutter/material.dart';

class DetailPizza extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
       body: Stack(
         children: <Widget>[
           Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               Stack(
                 children: <Widget>[
                  Image.asset("assets/pizza1.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250.0,),
                   Text("Luca pizzaria",
                   TextStyle
                   )
                 ]
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
           ),

           new Positioned(
             top: 0.0,
             left: 0.0,
             right: 0.0,
             child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,),
           )
         ],
       ),
      /*
      backgroundColor: Colors.grey[200],
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: BackButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Luca Pizzaria"),
        ),
        body: Image.asset("assets/pizza1.jpg",
        fit: BoxFit.cover,
        width: double.infinity,
        height: 200,),
        */

        /*Column(
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
        )*/
    );
  }
}


