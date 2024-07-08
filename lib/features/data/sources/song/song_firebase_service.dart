import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/core/utils/resources/strings_manager.dart';
import 'package:spotify/core/utils/resources/values_manager.dart';
import '../../models/song/song_model.dart';

abstract class SongFirebaseService {
  Future<Either<String, List<SongModel>>> getNewSongs();
  Future<Either<String, List<SongModel>>> getPlaylist();
}

class SongFirebaseServiceImpl implements SongFirebaseService {
  final firestore = FirebaseFirestore.instance;
  @override
  Future<Either<String, List<SongModel>>> getNewSongs() async {
    List<SongModel> songs = [];

    try {
      var data = await firestore
          .collection(AppStrings.songsCollection)
          .orderBy(AppStrings.songReleaseDate, descending: true)
          .limit(AppSelectedIndex.i5)
          .get();

      for (var element in data.docs) {
        var model = SongModel.fromJson(element.data());

        songs.add(model);
      }
      return right(songs);
    } catch (e) {
      // Log the error message for debugging purposes
      log('Error occurred while fetching new songs: $e');
      return left('An error occurred: $e');
    }
  }

  @override
  Future<Either<String, List<SongModel>>> getPlaylist() async {
    List<SongModel> songs = [];

    try {
      var data = await firestore
          .collection(AppStrings.songsCollection)
          .orderBy(AppStrings.songReleaseDate, descending: false)
          .get();

      for (var element in data.docs) {
        var model = SongModel.fromJson(element.data());

        songs.add(model);
      }
      return right(songs);
    } catch (e) {
      // Log the error message for debugging purposes
      log('Error occurred while fetching new songs: $e');
      return left('An error occurred: $e');
    }
  }
}
