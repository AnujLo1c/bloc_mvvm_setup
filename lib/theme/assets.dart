part of 'r.dart';
class _ResAssets {

  String get google => _png('splash');
  String get nike => _png('nike');
  String get back => _svg('back');
  String get eyeSlash => _svg('eye_slash');
  String get eye => _svg('eye');


}
String _png(String fileName) {
  return 'assets/png/$fileName.png';
}
String _svg(String fileName) {
  return 'assets/svg/$fileName.svg';
}