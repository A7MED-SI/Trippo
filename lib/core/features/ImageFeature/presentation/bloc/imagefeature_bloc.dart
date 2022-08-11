import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'imagefeature_event.dart';
part 'imagefeature_state.dart';

class ImagefeatureBloc extends Bloc<ImagefeatureEvent, ImagefeatureState> {
  ImagefeatureBloc() : super(ImagefeatureInitial()) {
    on<ImagefeatureEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
