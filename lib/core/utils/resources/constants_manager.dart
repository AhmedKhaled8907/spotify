class AppConstants {}

class AppUrl {
  static String fireStoreImage(String artist) =>
      'https://firebasestorage.googleapis.com/v0/b/spotify-8a711.appspot.com/o/covers%2F$artist.jpg?alt=media';
  static String fireStoreSong(String title) =>
      'https://firebasestorage.googleapis.com/v0/b/spotify-8a711.appspot.com/o/songs%2F$title.mp3?alt=media';
}
