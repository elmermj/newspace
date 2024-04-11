import 'package:get/get.dart';
import 'package:newspace/main.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleController extends GetxController{
  launchWeb(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
    } else {
        logRed('Could not launch URL: $url');
    }
  }
}