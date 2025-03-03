import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prueba_tecnica_jmot/blocs/image/image_event.dart';
import 'package:prueba_tecnica_jmot/blocs/image/image_state.dart';
import 'dart:io';
import 'package:prueba_tecnica_jmot/repositories/image_repository.dart';


class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageRepository imageRepository;

  ImageBloc(this.imageRepository) : super(ImageInitial()) {
    on<UploadImageEvent>((event, emit) async {
      emit(ImageLoading());
      try {
        await imageRepository.uploadImage(event.image, event.title, event.description);
        emit(ImageUploaded());
      } catch (e) {
        emit(ImageError(e.toString()));
      }
    });

    on<FetchImagesEvent>((event, emit) async {
      emit(ImageLoading());
      try {
        final images = await imageRepository.fetchImages();
        emit(ImageLoaded(images));
      } catch (e) {
        emit(ImageError(e.toString()));
      }
    });
  }
}