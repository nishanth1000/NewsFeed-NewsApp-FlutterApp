import 'package:flutter/material.dart';
import 'package:newsfeed/Classes/countries.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryList extends StatelessWidget {
  const CountryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CountriesData countries = CountriesData();

    return Scaffold(
      backgroundColor: const Color(0xff212121),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: const Color(0xff212121),
            title: const Text(
              'Select a Country',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w300,
              ),
            ),
            centerTitle: true,
            expandedHeight: 190,
            pinned: true,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 8,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: countries.data.length,
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/home', arguments: {
                      'code': countries.data[index][2],
                      'name': countries.data[index][1]
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13.0, vertical: 3),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff212121),
                          border: Border.all(
                            color: const Color(0xff212121),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(11))),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              "assets/" + countries.data[index][0],
                              height: 50,
                              width: 50,
                            ),
                          ),
                          Text(
                            countries.data[index][1],
                            style: const TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w300,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 8,
            ),
          ),
        ],
      ),
    );
  }
}
