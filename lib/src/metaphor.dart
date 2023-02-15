import 'platform_interface/metaphor_platform_interface.dart';

class Metaphor {
  Future<String?> getPlatformVersion() {
    return MetaphorPlatform.instance.getPlatformVersion();
  }
}
