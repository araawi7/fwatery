// we use this file because it offer flexibility

import 'package:flutter/material.dart';
import 'package:fwatery/Pages/Viewpdf.dart';
import 'package:fwatery/Pages/about_page.dart';
import 'package:fwatery/Pages/contact_page.dart';
import 'package:fwatery/Pages/first_page.dart';
import 'package:fwatery/Pages/forget_page.dart';
import 'package:fwatery/Pages/fwatery_page.dart';
import 'package:fwatery/Pages/login_page.dart';
import 'package:fwatery/Pages/main_page.dart';
import 'package:fwatery/Pages/not_found.dart';
import 'package:fwatery/Pages/pdf_view.dart';
import 'package:fwatery/Pages/setting_page.dart';
import 'package:fwatery/Pages/singup_page.dart';
import 'package:fwatery/routes/route_name.dart';

class CustomRoute{
  static Route<dynamic> allRoutes(RouteSettings settings){
    switch(settings.name){
      case firstPageRoute:
        return MaterialPageRoute(builder: (_)=>FirstPage());
      case loginPageRoute:
        return MaterialPageRoute(builder: (_)=> LoginPage());
      case forgetPageRoute:
        return MaterialPageRoute(builder: (_)=> ForgetPage());
      case signupPageRoute:
        return MaterialPageRoute(builder: (_)=> SignupPage());
      case mainPageRoute:
        return MaterialPageRoute(builder: (_)=> MainPage());
      case forgetPageRoute:
        return MaterialPageRoute(builder: (_)=> ForgetPage());
      case settingPageRoute:
        return MaterialPageRoute(builder: (_)=> SettingsPage());
      case contactPageRoute:
        return MaterialPageRoute(builder: (_)=> ContactPage());
      case aboutPageRoute:
        return MaterialPageRoute(builder: (_)=> AboutPage());
      case foaterPageRoute:
        return MaterialPageRoute(builder: (_)=> FoaterPage(url: settings.arguments),
            settings: settings);
      case pdfUrlPageRoute:
        return MaterialPageRoute(
            fullscreenDialog: true, builder: (_) => PdfViewUrl(url: settings.arguments),
            settings: settings);
      case viewpdfPageRoute:
        return MaterialPageRoute(
            fullscreenDialog: true, builder: (_) => Viewpdf());


    }
    return MaterialPageRoute(builder: (_)=> NotFoundPage());

  }
}
