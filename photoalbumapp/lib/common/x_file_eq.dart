import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

// todo: this wrapping might not be needed...Android generates the cache folder procedurally...
class XFileEq extends Equatable {
  final XFile xFile;

  const XFileEq(this.xFile);

  @override
  List<Object> get props => [xFile.name];
}
