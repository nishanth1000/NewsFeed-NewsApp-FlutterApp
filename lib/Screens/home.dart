import 'package:flutter/material.dart';
import 'package:newsfeed/NewsScreen/business.dart';
import 'package:newsfeed/NewsScreen/entertainment.dart';
import 'package:newsfeed/NewsScreen/health.dart';
import 'package:newsfeed/NewsScreen/science.dart';
import 'package:newsfeed/NewsScreen/sports.dart';
import 'package:newsfeed/NewsScreen/technology.dart';
import '../NewsScreen/general.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map countryData = {};

  @override
  Widget build(BuildContext context) {
    try {
      countryData = countryData.isNotEmpty
          ? countryData
          : ModalRoute.of(context)?.settings.arguments as Map;
    } catch (e) {
      countryData = {'code': 'in', 'name': 'India'};
    }

    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: const Color(0xff212121),
        appBar: AppBar(
          backgroundColor: const Color(0xff212121),
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: Visibility(
            visible: false,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.change_circle,
                color: Colors.blue,
                size: 24,
              ),
              splashRadius: 23,
            ),
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
          elevation: 0,
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
          bottom: const TabBar(isScrollable: true, tabs: [
            Tab(
              text: 'General',
            ),
            Tab(
              text: 'Business',
            ),
            Tab(
              text: 'Entertainment',
            ),
            Tab(
              text: 'Health',
            ),
            Tab(
              text: 'Science',
            ),
            Tab(
              text: 'Sports',
            ),
            Tab(
              text: 'Technology',
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            General(
              countryName: countryData['name'],
              countryCode: countryData['code'],
            ),
            Business(
              countryName: countryData['name'],
              countryCode: countryData['code'],
            ),
            Entertainment(
              countryName: countryData['name'],
              countryCode: countryData['code'],
            ),
            Health(
              countryName: countryData['name'],
              countryCode: countryData['code'],
            ),
            Science(
              countryName: countryData['name'],
              countryCode: countryData['code'],
            ),
            Sports(
              countryName: countryData['name'],
              countryCode: countryData['code'],
            ),
            Technology(
              countryName: countryData['name'],
              countryCode: countryData['code'],
            ),
          ],
        ),
      ),
    );
  }
}
