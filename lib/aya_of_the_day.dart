class AyaofTheDay {
  final String? arText;
  final String? enTran;
  final String? surEnName;
  final String? surNumber;

  AyaofTheDay({this.arText, this.enTran, this.surEnName, this.surNumber});

  factory AyaofTheDay.fromeJSON(Map<String, dynamic> json) {
    return AyaofTheDay(
      arText: json['data'][0]['text'],
      enTran: json['data'][2]['text'],
      surEnName: json['data'][2]['surah']['text'],
      surNumber: json['data'][2]['surah']['text'],
    );
  }
}
