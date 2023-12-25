import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

// TODO: SF: this wrapping might not be needed...Android generates the cache folder procedurally in the emulator...
class XFileEq extends Equatable {
  final XFile xFile;

  const XFileEq(this.xFile);

  @override
  List<Object> get props => [xFile.name];
}
