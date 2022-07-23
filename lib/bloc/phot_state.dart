part of 'phot_bloc.dart';

@immutable
abstract class PhotState {}

class PhotInitialstate extends PhotState {
  PhotInitialstate();
}

class PhotoLoadingState extends PhotState {
  PhotoLoadingState();
}

class PhotosLoadedState extends PhotState {
  final List<Photo> photo;
  PhotosLoadedState(this.photo);
}

class PhotoLoadedState extends PhotState {
  final int albumId;
  final int id;
  final String title;
  PhotoLoadedState(this.id, this.albumId, this.title);
}

class PhotoErrorState extends PhotState {
  final String errormessage;
  PhotoErrorState(this.errormessage);
}
