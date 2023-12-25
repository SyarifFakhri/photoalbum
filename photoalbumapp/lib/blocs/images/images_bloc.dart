import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoalbum/common/x_file_eq.dart';

// TODO: SF: this should probably be a set
class ImagesCubit extends Cubit<List<XFileEq>> {
  ImagesCubit(super.initialState);

  bool get isEmpty => state.isEmpty;

  void addImages(Iterable<XFileEq> files) {
    emit([...state, ...files]);
  }
}
