import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/core/utils/resources/strings_manager.dart';

class SongModel {
  final String title;
  final String artist;
  final num time;
  final Timestamp releaseDate;

  SongModel({
    required this.title,
    required this.artist,
    required this.time,
    required this.releaseDate,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      title: json[AppStrings.songTitle],
      artist: json[AppStrings.songArtist] ?? '',
      time: json[AppStrings.songTime],
      releaseDate: json[AppStrings.songReleaseDate],
    );
  }
}
