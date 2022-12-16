import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CurrentNewsScreen extends StatelessWidget {
  const CurrentNewsScreen(
      {Key? key,
      required this.name,
      required this.place,
      required this.cost,
      required this.image,
      required this.content,
      required this.url})
      : super(key: key);

  final String name, place, cost, image, content, url;

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
          actions: [
            IconButton(
                onPressed: () async => {
                      if (await canLaunch(url))
                        {await launch(url)}
                      else
                        {throw 'Could not launch $url'}
                    },
                icon: const Icon(
                  Icons.rocket_launch_sharp,
                  color: Color.fromARGB(255, 91, 117, 240),
                ))
          ],
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
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
        ));
  }
}
