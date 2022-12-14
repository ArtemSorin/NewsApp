import 'package:flutter/material.dart';
import 'package:newsapp/components/news.dart';

class CurrentNewsScreen extends StatelessWidget {
  const CurrentNewsScreen(
      {Key? key,
      required this.name,
      required this.place,
      required this.cost,
      required this.image,
      required this.content})
      : super(key: key);

  final String name, place, cost, image, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            color: const Color.fromARGB(255, 91, 117, 240),
            icon: const Icon(Icons.arrow_back_ios_sharp),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Back',
            style: TextStyle(
              color: Color.fromARGB(255, 91, 117, 240),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  //alignment: Alignment.centerLeft,
                  fit: BoxFit.fill,
                  image: NetworkImage(image),
                ),
                //shape: BoxShape.circle,
              ),
              height: 275,
              width: 225,
            ),
            Text(
              content,
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
        ));
  }
}
