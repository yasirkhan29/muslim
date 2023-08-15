class Surah {
  int? number;
  String? name;
  String? englistName;
  String? englishNameTranslation;
  int? numberOfAyahs;
  String? revelationType;

  Surah(
      {this.number,
      this.name,
      this.englistName,
      this.englishNameTranslation,
      this.numberOfAyahs,
      this.revelationType});

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      number: json['number'],
      name: json['name'],
      englistName: json['englishName'],
      englishNameTranslation: json['ennlistNameTranslation'],
      numberOfAyahs: json['numberOfAyahs'],
      revelationType: json['revelationType'],
    );
  }
}
