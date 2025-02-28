import 'dart:io'; // New begin
import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'navigation_home_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:best_flutter_ui_templates/delayed_animation.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:best_flutter_ui_templates/googleLogin.dart';
import 'package:best_flutter_ui_templates/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp())
  );
}



// ###################################################

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  late double _scale;
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       statusBarIconBrightness: Brightness.dark,
//       statusBarBrightness:
//           !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
//       systemNavigationBarColor: Colors.white,
//       systemNavigationBarDividerColor: Colors.transparent,
//       systemNavigationBarIconBrightness: Brightness.dark,
//     ));
//     return MaterialApp(
//       title: 'Flutter UI',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         textTheme: AppTheme.textTheme,
//         platform: TargetPlatform.iOS,
//       ),
//       //home: NavigationHomeScreen(),
//     );
//   }
// }


// ############################################################
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    final color = Colors.white;
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 60, 66, 222),
          body: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 90.0,
                ),
                AvatarGlow(
                  endRadius: 100,
                  duration: Duration(seconds: 1),
                  glowColor: Colors.white24,
                  repeat: true,
                  repeatPauseDuration: Duration(seconds: 1),
                  startDelay: Duration(seconds: 1),
                  child: Material(
                      elevation: 8.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        child: Image.asset('assets/images/logo_big.png'),
                        radius: 90.0,
                      )),
                ),
                DelayedAnimation(
                  child: Text(
                    "WhetherTravel",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: color),
                  ),
                  delay: delayedAmount + 1000,
                ),
                //  SizedBox(
                //   height: 30.0,
                // ),
                // DelayedAnimation(
                //   child: Text(
                //     "",
                //     style: TextStyle(
                //         fontWeight: FontWeight.bold,
                //         fontSize: 35.0,
                //         color: color),
                //   ),
                //   delay: delayedAmount + 2000,
                // ),
                // SizedBox(
                //   height: 30.0,
                // ),
                DelayedAnimation(
                  child: Text(
                    "Weather Analytics and Travel Path Guider",
                    style: TextStyle(fontSize: 15.0, color: color),
                  ),
                  delay: delayedAmount + 3000,
                ),
                DelayedAnimation(
                  child: Text(
                    "",
                    style: TextStyle(fontSize: 15.0, color: color),
                  ),
                  delay: delayedAmount + 3000,
                ),
                DelayedAnimation(
                  child: Text(
                    "",
                    style: TextStyle(fontSize: 15.0, color: color),
                  ),
                  delay: delayedAmount + 3000,
                ),
                SizedBox(
                  height: 100.0,
                ),
                DelayedAnimation(
                  
                  child: GestureDetector(
                    onTapDown: _onTapDown,
                    onTapUp: _onTapUp,
                    
                    child: Transform.scale(
                      scale: _scale,
                      child: _animatedButtonUI,
                      
                      // child: TextButton(
                      //                     style: ButtonStyle(
                      //                       overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      //                         (Set<MaterialState> states) {
                      //                           if (states.contains(MaterialState.focused))
                      //                             return Colors.red;
                      //                           return null; // Defer to the widget's default.
                      //                         }
                      //                       ),
                      //                     ),
                      //                     onPressed: () { },
                      //                     child: Text(
                      //                               'LOGIN WITH GOOGLE',
                      //                               style: TextStyle(
                      //                                 fontSize: 20.0,
                      //                                 fontWeight: FontWeight.bold,
                      //                                 color: Color.fromARGB(255, 255, 255, 255),
                                                      
                      //                               ),
                      //                             ),
                      //                   )

                    ),
                  ),
                  delay: delayedAmount + 4000,
                ),
                SizedBox(
                  height: 50.0,
                ),
                DelayedAnimation(
                  child: Text(
                    "For TEsting".toUpperCase(),
                    style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                        color: color),
                  ),
                  delay: delayedAmount + 5000,
                  
                ),
                
   Container(
        height: 30,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        
        child: Center(
          child: TextButton(
  style: ButtonStyle(
    overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.focused))
          return Colors.red;
        return null; // Defer to the widget's default.
      }
    ),
  ),
  onPressed: homeScreen,
  child:  Text(
            'GO TO APP',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 60, 66, 222),
              
            ),
          ),
        )
        ),
      )
              ],
            ),
          )
          //  Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text('Tap on the Below Button',style: TextStyle(color: Colors.grey[400],fontSize: 20.0),),
          //     SizedBox(
          //       height: 20.0,
          //     ),
          //      Center(

          //   ),
          //   ],

          // ),
          ),
    );
  }

  Widget get _animatedButtonUI => Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        
        child: Center(
          child: TextButton(
  style: ButtonStyle(
    overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.focused))
          return Colors.red;
        return null; // Defer to the widget's default.
      }
    ),
  ),
  onPressed: googleLogin,
  child:  Text(
            'LOGIN WITH GOOGLE',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color:Color.fromARGB(255, 32, 45, 235),
              
            ),
          ),
        )
        ),
      );

      

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
//#########################################################################

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
