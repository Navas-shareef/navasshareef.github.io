// Web-specific utilities
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

void openUrl(String url, String target) {
  html.window.open(url, target);
}

void openEmail(String email) {
  html.window.open('mailto:$email', 'email');
}
