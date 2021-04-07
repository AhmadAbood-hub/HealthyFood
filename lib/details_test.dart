import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details_Test extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;

  Details_Test({this.heroTag, this.foodName, this.foodPrice});

  @override
  _Details_TestState createState() => _Details_TestState();
}

class _Details_TestState extends State<Details_Test> {
  var selectedCard = 'Wight';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        title: Text(
          "Details",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontSize: 18.0,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.more_horiz_outlined,
                color: Colors.white,
              ),
              onPressed: null)
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent),
              Positioned(
                top: 75,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(75),
                          topRight: Radius.circular(75))),
                ),
              ),
              Positioned(
                  top: 20,
                  left: MediaQuery.of(context).size.width / 4,
                  child: Hero(
                    tag: widget.heroTag,
                    child: Container(
                      height: MediaQuery.of(context).size.width / 2,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.heroTag))),
                    ),
                  )),
              Positioned(
                  top: 250,
                  left: 25,
                  right: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.foodName,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(widget.foodPrice,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0,
                                  color: Colors.grey)),
                          Container(
                              height: 25.0, color: Colors.grey, width: 1.0),
                          Container(
                            width: 125.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17.0),
                                color: Color(0xFF7A9BEE)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 25.0,
                                    width: 25.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        color: Color(0xFF7A9BEE)),
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Text('2',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Montserrat',
                                        fontSize: 15.0)),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 25.0,
                                    width: 25.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        color: Colors.white),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Color(0xFF7A9BEE),
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildInfoCard('WEIGHT', '300', 'G'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('CALORIES', '267', 'CAL'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('VITAMINS', 'A, B6', 'VIT'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('AVAIL', 'NO', 'AV')
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25)),
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Text(widget.foodPrice,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat')),
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }

  _buildInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
      onTap: () {
        selectCard(cardTitle);
      },
      child: AnimatedContainer(
        height: 100,
        width: 100,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: selectedCard == cardTitle ? Color(0xFF7A9BEE) : Colors.white,
            border: Border.all(
                color: cardTitle == selectedCard
                    ? Colors.transparent
                    : Colors.grey.withOpacity(0.3),
                style: BorderStyle.solid,
                width: 0.75)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 15),
              child: Text(cardTitle,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12.0,
                    color: cardTitle == selectedCard
                        ? Colors.white
                        : Colors.grey.withOpacity(0.7),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(info,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          color: cardTitle == selectedCard
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold)),
                  Text(unit,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12.0,
                        color: cardTitle == selectedCard
                            ? Colors.white
                            : Colors.black,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
