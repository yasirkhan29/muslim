import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:muslim/api.dart';
import 'package:muslim/aya_of_the_day.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices _apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal('ar');
    var _size = MediaQuery.of(context).size;
    var _hijri = HijriCalendar.now();
    var day = DateTime.now();
    var format = DateFormat('EEE , d MMM yyyy');
    var formated = format.format(day);

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            height: _size.height * 0.22,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/background_img.jpg'))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(formated,
                    style: TextStyle(color: Colors.white, fontSize: 29)),
                RichText(
                  text: TextSpan(
                    children: <InlineSpan>[
                      WidgetSpan(
                        style: TextStyle(fontSize: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(_hijri.hDay.toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),
                      WidgetSpan(
                        child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(_hijri.longMonthName,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))),
                      ),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text('${_hijri.hYear}AH',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsetsDirectional.only(top: 10, bottom: 20),
            child: Column(
              children: [
                FutureBuilder<AyaofTheDay>(
                  future: _apiServices.getAyaofTheDay(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {}
                    if (!snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 60, top: 100),
                        child: Center(
                          child: Column(
                            children: [
                              Text("we check Internet"),
                              SizedBox(height: 15),
                              CircularProgressIndicator(),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container(
                          margin: EdgeInsetsDirectional.all(16),
                          padding: EdgeInsetsDirectional.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: Offset(0, 1))
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Quran Aya of the Day",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 0.5,
                              ),
                              Text(
                                snapshot.data!.arText!,
                                style: TextStyle(color: Colors.black54),
                              ),
                              Text(
                                snapshot.data!.enTran!,
                                style: TextStyle(color: Colors.black54),
                              ),
                              RichText(
                                  text: TextSpan(children: <InlineSpan>[
                                WidgetSpan(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(snapshot.data?.surNumber ?? ""),
                                )),
                                WidgetSpan(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(snapshot.data?.surEnName ?? ""),
                                )),
                              ]))
                            ],
                          ));
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
