import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          PetCard(),
        ],
      ),
    );
  }
}

class PetCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.zero),
                  ),
                  child: Text(
                    'Golden Retreiver',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor   Lorem ipsum dolor sit amet, consectetur a '),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Adopt',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
