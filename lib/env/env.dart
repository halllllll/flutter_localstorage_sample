import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: ".env")
abstract class Env {
  @EnviedField(varName: "SECSTORAGE_KEY", obfuscate: true)
  static final String seccount = _Env.seccount;

  @EnviedField(varName: "PREF_KEY", obfuscate: true, useConstantCase: true)
  static final String prefcount = _Env.prefcount;
}
