import 'package:bloc/bloc.dart';
import 'package:bloc_api_practice_phots/model_class/photo.dart';
import 'package:bloc_api_practice_phots/repository/repository.dart';
import 'package:meta/meta.dart';

part 'phot_event.dart';
part 'phot_state.dart';

class PhotBloc extends Bloc<PhotEvent, PhotState> {
  final Repository repository = Repository();
  PhotBloc() : super(PhotInitialstate()) {
    on<FetchPhotoEvent>((event, emit) async {
      emit.call(PhotoLoadingState());
      try{
        List<Photo> photo = await repository.fetchPhotoRepository();
        emit( PhotosLoadedState(photo));
      }catch(e){
        emit(PhotoErrorState(e.toString()));
      }
    });
  }
}
