
import 'package:flutter/material.dart';
import 'package:fwatery/Pages/about_page.dart';
import 'package:fwatery/Pages/account_page.dart';
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
      case foaterPageRoute:
        return MaterialPageRoute(builder: (_)=> FoaterPage());
      case settingPageRoute:
        return MaterialPageRoute(builder: (_)=> SettingsPage());
      case accountPageRoute:
        return MaterialPageRoute(builder: (_)=>AccountPage() );
      case contactPageRoute:
        return MaterialPageRoute(builder: (_)=> ContactPage());
      case aboutPageRoute:
        return MaterialPageRoute(builder: (_)=> AboutPage());
      case pdfUrlPageRoute:
        return MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => PdfViewUrl(url: settings.arguments),
            settings: settings);


    }
    return MaterialPageRoute(builder: (_)=> NotFoundPage());

  }
}