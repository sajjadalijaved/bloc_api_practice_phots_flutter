part of 'phot_bloc.dart';

@immutable
abstract class PhotEvent {}

class FetchPhotos extends PhotEvent {}

class FetchPhotoEvent extends PhotEvent {}
