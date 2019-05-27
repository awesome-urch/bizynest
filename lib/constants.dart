import 'package:flutter/material.dart';

class AppConstants{
  static final String logoMin = "assets/logo.png";
  static final String logo_max = "assets/logo_extended.png";
  static final String appName = "Bizynest";
  static final Color appBlue = new Color(0xff1565c0);
  static final Color appPurple = new Color(0xFF601183);

  //REST API
  static final String BASE_WEBSITE = "https://bizynest.com/";
  static final String BASE_URL = "https://bizynest.com/api/src/routes/";
  static final String PROCESS_GET = BASE_URL + "process_one.php?";
  static final String PROCESS_POST = BASE_URL + "process_post.php";

}