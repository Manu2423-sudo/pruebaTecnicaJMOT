import 'package:equatable/equatable.dart';
import 'dart:io';

abstract class ImageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UploadImageEvent extends ImageEvent {
  final File image;
  final String title;
  final String description;

  UploadImageEvent(this.image, this.title, this.description);

  @override
  List<Object?> get props => [image, title, description];
}

class FetchImagesEvent extends ImageEvent {}