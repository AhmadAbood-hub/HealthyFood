import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './details_test.dart';
import './details.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15, right: 10, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: null),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(Icons.apps_sharp, color: Colors.white),
                          onPressed: null),
                      IconButton(
                          icon: Icon(Icons.menu, color: Colors.white),
                          onPressed: null),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 30,
            ),
            child: Row(
              children: [
                Text(
                  "Healthy",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Food",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 170,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75))),
            child: ListView(
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 45),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300.0,
                    child: ListView(
                      children: [
                        _buildFoodItem(
                            'assets/plate1.png', 'Salmon bowl', '\$24.00'),
                        _buildFoodItem(
                            'assets/plate2.png', 'Spring bowl', '\$22.00'),
                        _buildFoodItem(
                            'assets/plate6.png', 'Avocado bowl', '\$26.00'),
                        _buildFoodItem(
                            'assets/plate5.png', 'Berry bowl', '\$24.00'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1.0),
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: Icon(Icons.search),
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1.0),
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: Icon(Icons.lock),
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFoodItem(String imgPath, String foodName, String price) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Details_Test(
                    heroTag: imgPath,
                    foodName: foodName,
                    foodPrice: price,
                  )));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                child: Row(children: [
              Hero(
                  tag: imgPath,
                  child: Image(
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover,
                      height: 75.0,
                      width: 75.0)),
              SizedBox(width: 10.0),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(foodName,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold)),
                Text(price,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.grey))
              ])
            ])),
            IconButton(
                icon: Icon(Icons.add), color: Colors.black, onPressed: () {})
          ],
        ));
  }
}
