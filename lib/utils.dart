import 'dart:io';

class Utils
{
  static File imagePicker()
  {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String bgPath = appDocDir.uri.resolve("background.jpg").path;
    File bgFile = await image.copy(bgPath);
  }
}
