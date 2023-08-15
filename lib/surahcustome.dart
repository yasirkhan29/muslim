import 'package:flutter/material.dart';
import 'package:muslim/surah.dart';

Widget SurahCustomeListTitle(
    {required Surah surah,
    required BuildContext context,
    required VoidCallback ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 200,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 3.0,
        )
      ]),
      child: Column(children: [
        Container(
          alignment: Alignment.center,
          height: 30,
          width: 40,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: Text(
            (surah.number).toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              surah.englistName.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Text(
              surah.englishNameTranslation.toString(),
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
        Spacer(),
        Text(
          surah.name!,
          style: TextStyle(
              color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 20),
        )
      ]),
    ),
  );
}
