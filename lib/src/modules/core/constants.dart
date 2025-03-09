import 'package:envied/envied.dart';

part 'constants.g.dart';

@Envied(path: '.env', useConstantCase: true)
final class Constants {
  @EnviedField(varName: 'API_KEY', obfuscate: true)
  static final String apiKey = _Constants.apiKey;
}
