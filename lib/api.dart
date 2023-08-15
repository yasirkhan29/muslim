import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:muslim/aya_of_the_day.dart';

class ApiServices {
  Future<AyaofTheDay> getAyaofTheDay() async {
    String url =
        "http://api.alquran.cloud/v1/ayah/${random(1, 6237)}/editions/quran-uthmani,en.asad,en.pickthall";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return AyaofTheDay.fromeJSON(json.decode(response.body));
    } else {
      print("Faild to load");
      throw Exception("Faild to Load post");
    }
  }

  random(min, max) {
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }
}
