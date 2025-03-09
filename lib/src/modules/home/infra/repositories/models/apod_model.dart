class ApodModel {
  ApodModel({
    required this.title,
    required this.explanation,
    required this.hdUrl,
    required this.mediaType,
    required this.url,
    required this.date,
  });

  factory ApodModel.fromMap(Map<String, dynamic> map) {
    return ApodModel(
      title: map['title'] as String,
      explanation: map['explanation'] as String,
      hdUrl: map['hdurl'] as String,
      mediaType: map['media_type'] as String,
      url: map['url'] as String,
      date: map['date'] as String,
    );
  }

  final String title;
  final String explanation;
  final String hdUrl;
  final String mediaType;
  final String url;
  final String date;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'explanation': explanation,
      'hdurl': hdUrl,
      'media_type': mediaType,
      'url': url,
      'date': date,
    };
  }
}
