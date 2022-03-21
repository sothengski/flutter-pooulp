import 'package:uuid/uuid.dart';

class UuidGenerator {
  final uuid = const Uuid();

  // Generate a v1 (time-based) id
  String? uuidV1() {
    return uuid.v1();
    // -> '6c84fb90-12c4-11e1-840d-7b25c5ee775a'
  }

  // Generate a v4 (random) id
  String? uuidV4() {
    return uuid.v4();
    // -> '110ec58a-a0f2-4ac4-8393-c866d813b8d1'
  }

  // Generate a v5 (namespace-name-sha1-based) id
  String? uuidV5({String? nameSpace, String? name = ''}) {
    return uuid.v5(
      Uuid.NAMESPACE_URL,
      name,
    );
    // -> 'c74a196f-f19d-5ea9-bffd-a2742432fc9c'
  }
}
