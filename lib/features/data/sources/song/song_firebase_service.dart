import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/core/utils/resources/strings_manager.dart';
import 'package:spotify/core/utils/resources/values_manager.dart';
import 'package:spotify/features/domain/usecases/song/is_favorite_song_usecase.dart';
import '../../../../core/utils/constants/service_locator.dart';
import '../../models/song/song_model.dart';

abstract class SongFirebaseService {
  Future<Either<String, List<SongModel>>> getNewSongs();
  Future<Either<String, List<SongModel>>> getPlaylist();
  Future<Either<String, bool>> addOrRemoveFavoriteSong(
    String songId,
  );
  Future<bool> isFavoriteSong(String songId);
}

class SongFirebaseServiceImpl implements SongFirebaseService {
  var firestore = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

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
        bool isFavorite = await sl<IsFavoriteSongUsecase>().call(
          param: element.reference.id,
        );

        model.isFavorite = isFavorite;
        model.songId = element.reference.id;

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
        bool isFavorite = await sl<IsFavoriteSongUsecase>().call(
          param: element.reference.id,
        );

        model.isFavorite = isFavorite;
        model.songId = element.reference.id;
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
  Future<Either<String, bool>> addOrRemoveFavoriteSong(
    String songId,
  ) async {
    var user = auth.currentUser;
    var uid = user!.uid;
    late bool isFavorite;

    try {
      // get the songs in favorite with the same songId
      QuerySnapshot favoriteSongs = await firestore
          .collection(AppStrings.firebaseUsers)
          .doc(uid)
          .collection(AppStrings.firebaseFavorites)
          .where(AppStrings.firebaseSongId, isEqualTo: songId)
          .get();

      if (favoriteSongs.docs.isNotEmpty) {
        // if there songs in favorite then delete it
        await favoriteSongs.docs.first.reference.delete();

        // after delete, set isFavorite to false
        isFavorite = false;
      } else {
        // if there no songs in favorite then add it
        await firestore
            .collection(AppStrings.firebaseUsers)
            .doc(uid)
            .collection(AppStrings.firebaseFavorites)
            .add(
          {
            AppStrings.firebaseSongId: songId,
            AppStrings.firebaseAddedAt: Timestamp.now(),
          },
        );
        // after add, set isFavorite to true
        isFavorite = true;
      }
      return Right(isFavorite);
    } catch (e) {
      return left('An error occurred: $e');
    }
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    var user = auth.currentUser;
    var uid = user!.uid;

    try {
      // get the songs in favorite with the same songId
      QuerySnapshot favoriteSongs = await firestore
          .collection(AppStrings.firebaseUsers)
          .doc(uid)
          .collection(AppStrings.firebaseFavorites)
          .where(AppStrings.firebaseSongId, isEqualTo: songId)
          .get();

      if (favoriteSongs.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
