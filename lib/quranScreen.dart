import 'package:flutter/material.dart';
import 'package:muslim/constant.dart';
import 'package:muslim/juz_screen.dart';
import 'package:muslim/sajda.dart';
import 'package:muslim/sajda_custom_tile.dart';
import 'package:muslim/surah.dart';
import 'package:muslim/surah_custome_tile.dart';
import 'package:muslim/surah_detail.dart';
import 'package:muslim/surahcustome.dart';

import 'api_services.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Quran'),
              centerTitle: true,
              bottom: const TabBar(tabs: [
                Text(
                  'Surah',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                Text(
                  'Sajda',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                Text(
                  'Para',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                Text(
                  'Duain',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                )
              ]),
            ),
            body: TabBarView(children: <Widget>[
              Container(
                height: 300,
                child: FutureBuilder(
                  future: apiServices.getSurah(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Surah>> snapshot) {
                    if (snapshot.hasData) {
                      List<Surah>? surah = snapshot.data;
                      return ListView.builder(
                        itemCount: surah!.length,
                        itemBuilder: (context, index) => SurahCustomListTile(
                            surah: surah[index],
                            context: context,
                            ontap: () {
                              setState(() {
                                Constants.surahIndex = (index + 1);
                              });
                              Navigator.pushNamed(context, Surahdetail.id);
                            }),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              FutureBuilder(
                future: apiServices.getSajda(),
                builder: (context, AsyncSnapshot<SajdaList> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Something went wrong'),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.sajdaAyahs.length,
                    itemBuilder: (context, index) => SajdaCustomTile(
                        snapshot.data!.sajdaAyahs[index], context),
                  );
                },
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            Constants.juzIndex = (index + 1);
                          });
                          Navigator.pushNamed(context, JuzScreen.id);
                        },
                        child: Card(
                          elevation: 6,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              '${index + 1} ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: 300,
                child: Text("Due"),
              ),
            ]),
          ),
        ));
  }
}
