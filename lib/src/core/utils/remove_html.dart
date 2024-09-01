import 'package:html/parser.dart';

class RemoveHtml {
  static String descriptionFromHtml(String text) {
    final htmlString = parse(text);
    final String convertedString =
        parse(htmlString.body!.text).documentElement!.text;
    return convertedString;
  }
}
