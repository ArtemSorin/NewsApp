import 'package:flutter/material.dart';

class NewsCountry extends StatelessWidget {
  const NewsCountry(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.data});

  final String image, title, description, data;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        width: 300,
        height: 150,
        child: Row(
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
              //height: 275,
              width: 125,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0.0,
                shadowColor: Colors.transparent,
                fixedSize: const Size(175, 150),
              ),
              child: Column(children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        description,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        data,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 91, 117, 240),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ));
  }
}
