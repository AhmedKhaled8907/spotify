import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/core/utils/resources/strings_manager.dart';

class SongModel {
  final String title;
  final String artist;
  final num duration;
  final Timestamp releaseDate;

  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      title: json[AppStrings.songTitle],
      artist: json[AppStrings.songArtist],
      duration: json[AppStrings.songDuration],
      releaseDate: json[AppStrings.songReleaseDate],
    );
  }
  
  
}


