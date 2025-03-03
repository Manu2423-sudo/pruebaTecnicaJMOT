import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_jmot/blocs/image/image_bloc.dart';
import 'package:prueba_tecnica_jmot/blocs/image/image_state.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Galería de Imágenes')),
      body: BlocBuilder<ImageBloc, ImageState>(
        builder: (context, state) {
          if (state is ImageLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ImageLoaded) {
            return ListView.builder(
              itemCount: state.images.length,
              itemBuilder: (context, index) {
                final image = state.images[index];
                return ListTile(
                  leading: Image.network(image['imageUrl']!),
                  title: Text(image['title']!),
                  subtitle: Text(image['description']!),
                );
              },
            );
          } else {
            return Center(child: Text('No hay imágenes disponibles.'));
          }
        },
      ),
    );
  }
}