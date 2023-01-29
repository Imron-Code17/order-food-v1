import 'package:url_launcher/url_launcher_string.dart';

class WhatsAppM {
  static Future<void> direct(String pesan) async {
    await launchUrlString("https://wa.me/+6281234944838?text=$pesan",
        mode: LaunchMode.externalApplication);
  }
}
