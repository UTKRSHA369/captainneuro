import 'package:captainneuro/pages/const.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

double textFontSize = 13;
double iconSize = 35;

String emergencyNumber = "999";
String youtubeBaseUrl = "https://www.youtube.com/watch?v=";
String youtubeInformationId = "g1cfHImkGYU";
String youtubeSongsPlaylist = "h9ZGKALMMuc&list=PLFF599438873BC71E";

void handleEmergency() {
  launchUrl(Uri.parse("tel://" + emergencyNumber));
}

void handleInformation() {
  launchUrl(Uri.parse(youtubeBaseUrl + youtubeInformationId),
      mode: LaunchMode.externalApplication);
}

void handleMusic() {
  launchUrl(Uri.parse(youtubeBaseUrl + youtubeSongsPlaylist),
      mode: LaunchMode.externalApplication);
}

void onUserTap(String tappedText) {
  print(tappedText);
  switch (tappedText) {
    case HomePageOptions.EMERGENCY:
      handleEmergency();
      break;
    case HomePageOptions.INFORMATION:
      handleInformation();
      break;
    case HomePageOptions.MUSIC:
      handleMusic();
      break;
    default:
      print("Invalid option tapped");
  }
}

Widget getBoxIcons(String textToPrint, String iconData) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        onUserTap(textToPrint);
      },
      child: Container(
        width: 150,
        height: 150,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: ColorConstants.bgColorTrinary,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(4, 8), // Shadow position
            ),
          ],
        ),
        alignment: Alignment.center,
        child: ListTile(
          leading: Image.asset(iconData,
              width: iconSize, height: iconSize, fit: BoxFit.cover),
          title: Text(
            textToPrint,
            style: TextStyle(
                color: ColorConstants.textColorSecondary,
                fontSize: textFontSize),
          ),
        ),
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (40 / 20),
                children: [
          getBoxIcons(
              HomePageOptions.EMERGENCY, "images/icons8-emergency-call-64.png"),
          getBoxIcons(HomePageOptions.ASSISTANCE, "images/Google-Gemini.png"),
          getBoxIcons(
              HomePageOptions.INFORMATION, "images/icons8-information-50.png"),
          getBoxIcons(HomePageOptions.MUSIC, "images/icons8-radio-96.png"),
          getBoxIcons(
              HomePageOptions.NAVIGATE, "images/icons8-navigate-48.png"),
          getBoxIcons(
              HomePageOptions.SETTINGS, "images/icons8-settings-64.png"),
        ])));
  }
}
