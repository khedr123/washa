import 'dart:io';

import 'package:carservice/screens/vendorhome/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitalState());

  static HomeCubit get(context) => BlocProvider.of(context);






  File? myImage;
  chooseMyImage() {
    ImagePicker.platform.getImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        myImage = File(value.path);
        emit(HomeImageState());
      }
    });
  }
}