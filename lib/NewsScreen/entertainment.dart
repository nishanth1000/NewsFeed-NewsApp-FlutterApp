import 'package:flutter/material.dart';
import '../Classes/news.dart';
import '../Classes/newstemplate.dart';
import '../Screens/apiloadingscreen.dart';

class Entertainment extends StatefulWidget {
  String countryCode;
  String countryName;

  Entertainment(
      {Key? key, required this.countryCode, required this.countryName})
      : super(key: key);

  @override
  State<Entertainment> createState() => _EntertainmentState();
}

class _EntertainmentState extends State<Entertainment> {
  bool _loading = true;

  List<NewsTemplate> allNewsData = [];
  int index = 0;

  String category = 'entertainment';
  late String country;

  void updateNews() async {
    News newsdata = News();
    await newsdata.getNews(widget.countryCode, category);
    allNewsData = newsdata.data;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    updateNews();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const ApiLoadingScreen()
        : Column(
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Top Headlines ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 19,
                        ),
                      ),
                      const Text(
                        'in ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        widget.countryName,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              allNewsData.isNotEmpty
                  ? Expanded(
                      flex: 90,
                      child: ListView.builder(
                        itemCount: allNewsData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/newsarticle',
                                    arguments: {
                                      'newsurl': allNewsData[index].urlToNews
                                    });
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: Image.network(
                                            allNewsData[index].urlToImage),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 3),
                                    child: Text(
                                      allNewsData[index].title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : const Expanded(
                      flex: 90,
                      child: Center(
                        child: Text(
                          'Currently no News in API',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w300,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
            ],
          );
  }
}
