import 'package:uuid/v8.dart';

class PostId {
  final String value;
  PostId(this.value);
  factory PostId.create() => PostId(const UuidV8().generate());
  @override
  String toString() => value;
}
