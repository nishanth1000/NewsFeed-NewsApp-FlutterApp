import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class NewsArticle extends StatefulWidget {
  const NewsArticle({Key? key}) : super(key: key);

  @override
  State<NewsArticle> createState() => _NewsArticleState();
}

class _NewsArticleState extends State<NewsArticle> {
  Map urlData = {};

  @override
  Widget build(BuildContext context) {
    urlData = urlData.isNotEmpty
        ? urlData
        : ModalRoute.of(context)?.settings.arguments as Map;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff212121),
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.blue,
              size: 18,
            ),
            splashRadius: 23,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'News',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                'Feed',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/countrylist');
              },
              icon: const Icon(
                Icons.public,
                color: Colors.blue,
                size: 24,
              ),
              splashRadius: 23,
            ),
            const SizedBox(width: 5),
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(urlData['newsurl'])),
            )),
          ],
        ),
      ),
    );
  }
}
