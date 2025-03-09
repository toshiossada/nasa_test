import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../enums/media_type_enum.dart';

@immutable
class ApodEntity {
  ApodEntity({
    required this.title,
    required this.explanation,
    required this.hdUrl,
    required this.url,
    required this.date,
    required String mediaType,
  }) : mediaType = MediaTypeEnum.values.firstWhere((e) => e.name == mediaType);

  final String title;
  final String explanation;
  final String hdUrl;
  final MediaTypeEnum mediaType;
  final String url;
  final String date;
  String get brlDate {
    final date = DateTime.parse(this.date);
    final formattedDate = DateFormat('dd/MM/yyyy').format(date);
    return formattedDate; 
  }

  @override
  bool operator ==(Object other) {
    return other is ApodEntity &&
        title == other.title &&
        explanation == other.explanation &&
        hdUrl == other.hdUrl &&
        mediaType == other.mediaType &&
        date == other.date &&
        url == other.url;
  }

  @override
  int get hashCode =>
      title.hashCode ^
      explanation.hashCode ^
      hdUrl.hashCode ^
      mediaType.hashCode ^
      date.hashCode ^
      url.hashCode;
}
