import 'package:flutter/material.dart';
import 'package:newsapp/components/news.dart';
import 'package:newsapp/components/newscard.dart';
import 'dart:convert' show utf8;

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<List<Result>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchCoinsList();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            bottomOpacity: 0.0,
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(
              color: const Color.fromARGB(255, 91, 117, 240),
              icon: const Icon(Icons.list_outlined),
              onPressed: () {},
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                color: Color.fromARGB(255, 91, 117, 240),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  'Start enjoying exploring your dream news',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, top: 0),
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(children: <Widget>[
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search_outlined,
                        color: Color.fromARGB(255, 91, 117, 240),
                      )),
                  const Text('search...'),
                ]),
              ),
              Container(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 91, 117, 240)),
                      ),
                      onPressed: () {},
                      child: const Text('Politics'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 91, 117, 240)),
                      ),
                      child: const Text('Economy'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 91, 117, 240)),
                      ),
                      child: const Text('technologies'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                height: 275,
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: FutureBuilder<List<Result>>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Scaffold(
                          body: FutureBuilder<List<Result>>(
                        future: futureAlbum,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.all(8),
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return NewsCard(
                                      name: snapshot.data![index].title.length >
                                              20
                                          ? utf8.decode(utf8.encode(
                                              "${snapshot.data![index].title.substring(0, 20)}..."))
                                          : snapshot.data![index].title,
                                      place: snapshot
                                                  .data![index].title.length >
                                              20
                                          ? "${snapshot.data![index].title.substring(0, 20)}..."
                                          : snapshot.data![index].title,
                                      cost: snapshot.data![index].pubDate
                                          .toString()
                                          .substring(0, 16),
                                      image: snapshot.data![index].imageUrl);
                                });
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          return const CircularProgressIndicator();
                        },
                      ));
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                child: Row(children: [
                  const Text(
                    'Group Tours',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5, left: width * 0.45),
                    child: const Text(
                      'See All',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ]),
              ),
            ]),
          )),
    );
  }
}
