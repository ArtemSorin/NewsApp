import 'package:flutter/material.dart';
import 'package:newsapp/screens/current_news_screen.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.name,
    required this.place,
    required this.data,
    required this.image,
    required this.content,
    required this.url,
  }) : super(key: key);

  final String name, place, data, image, content, url;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        alignment: Alignment.bottomCenter,
        margin: const EdgeInsets.all(5),
        child: Stack(
          children: <Widget>[
            Container(
                height: 85,
                width: 225,
                color: Colors.white,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CurrentNewsScreen(
                                    cost: '',
                                    image: image,
                                    name: '',
                                    place: '',
                                    content: content,
                                    url: url,
                                  )));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                name,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                place,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const Spacer(),
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
                        )
                      ],
                    )))
          ],
        ));
  }
}
