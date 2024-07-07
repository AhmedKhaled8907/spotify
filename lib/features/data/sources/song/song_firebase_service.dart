import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/core/utils/resources/strings_manager.dart';
import 'package:spotify/core/utils/resources/values_manager.dart';

import '../../models/song/song_model.dart';

abstract class SongFirebaseService {
  Future<Either<String, List<SongModel>>> getNewSongs();
}

class SongFirebaseServiceImpl implements SongFirebaseService {
  @override
  Future<Either<String, List<SongModel>>> getNewSongs() async {
    final firestore = FirebaseFirestore.instance;
    final List<SongModel> songs = [];

    try {
      var data = await firestore
          .collection(AppStrings.songsCollection)
          .orderBy(AppStrings.songReleaseDate, descending: true)
          .limit(AppSelectedIndex.i3)
          .get();

      for (var element in data.docs) {
        var model = SongModel.fromJson(element.data());
        songs.add(model);
      }
      return right(songs);
    } catch (e) {
      return left('An Error Occurred');
    }
  }
}
