import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prueba_tecnica_jmot/blocs/image/image_bloc.dart';
import 'package:prueba_tecnica_jmot/blocs/image/image_event.dart';
import 'package:prueba_tecnica_jmot/blocs/image/image_state.dart';



class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? _image;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _uploadImage() {
    if (_image != null &&
        titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      BlocProvider.of<ImageBloc>(context).add(
        UploadImageEvent(_image!, titleController.text, descriptionController.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Subir Imagen')),
      body: BlocConsumer<ImageBloc, ImageState>(
        listener: (context, state) {
          if (state is ImageUploaded) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Imagen subida con éxito')));
          } else if (state is ImageError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                if (_image != null) Image.file(_image!, height: 150),
                ElevatedButton(onPressed: _pickImage, child: Text('Tomar Foto')),
                TextField(controller: titleController, decoration: InputDecoration(labelText: 'Título')),
                TextField(controller: descriptionController, decoration: InputDecoration(labelText: 'Descripción')),
                SizedBox(height: 20),
                if (state is ImageLoading) CircularProgressIndicator(),
                if (state is! ImageLoading)
                  ElevatedButton(onPressed: _uploadImage, child: Text('Subir Imagen')),
              ],
            ),
          );
        },
      ),
    );
  }
}