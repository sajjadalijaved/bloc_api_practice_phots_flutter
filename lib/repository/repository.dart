import 'package:bloc_api_practice_phots/model_class/photo.dart';
import 'package:bloc_api_practice_phots/repository/photo_api.dart';

class Repository {
  final _photoApiServices = PhotoApiServices();

  Future<List<Photo>> fetchPhotoRepository() async {
    return await _photoApiServices.fetchPhoto();
  }
}
