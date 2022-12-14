import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Data welcomeFromJson(String str) => Data.fromJson(json.decode(str));

String welcomeToJson(Data data) => json.encode(data.toJson());

Future<List<Result>> fetchCoinsList() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/everything?q=Apple&from=2022-12-14&sortBy=popularity&apiKey=ee601c7a02ed4d5f81b6e7ff189583bb'));

  if (response.statusCode == 200) {
    Map<String, dynamic> userMap = jsonDecode(response.body);
    return (userMap['articles'] as List)
        .map((e) => Result.fromJson(e))
        .toList();
  } else {
    throw Exception('Failed to load CoinsList');
  }
}

class Data {
  Data({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Result> articles;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        totalResults: json["totalResults"],
        articles:
            List<Result>.from(json["articles"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        source: Source.fromJson(json["source"]),
        author: json["author"] == null ? "" : json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"] == null ? "" : json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author == null ? null : author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage == null ? null : urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  Source({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? "" : json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? "" : id,
        "name": name,
      };
}
