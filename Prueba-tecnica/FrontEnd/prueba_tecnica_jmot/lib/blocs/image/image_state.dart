import 'package:equatable/equatable.dart';

abstract class ImageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageUploaded extends ImageState {}

class ImageError extends ImageState {
  final String message;

  ImageError(this.message);

  @override
  List<Object?> get props => [message];
}

class ImageLoaded extends ImageState {
  final List<Map<String, String>> images;

  ImageLoaded(this.images);

  @override
  List<Object?> get props => [images];
}