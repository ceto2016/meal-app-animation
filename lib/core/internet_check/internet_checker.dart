// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

// import '../../injection_container.dart';
// import '../../util/navigator.dart';

// abstract class InternetChecker {
//   Stream<bool> checkInternetStream();
//   void retrunToLastRoute();
// }

// class InternetCheckerImpl implements InternetChecker {
//   Widget? lastWidget;
//   late Stream<bool> onConnectivityChanged;

//   @override
//   Stream<bool> checkInternetStream() {
//     onConnectivityChanged = Connectivity()
//         .onConnectivityChanged
//         .asyncExpand((ConnectivityResult result) async* {
//       if (result != ConnectivityResult.none) {
//         yield await InternetConnectionChecker().hasConnection;
//       } else {
//         sl<AppNavigator>().popToFrist();
//         yield false;
//       }
//     });

//     return onConnectivityChanged;
//   }

//   @override
//   void retrunToLastRoute() async {
//     final res = await InternetConnectionChecker().hasConnection;
//     onConnectivityChanged.asyncExpand((event) async* {
//       yield res;
//     });
//     if (res) {
//       sl<AppNavigator>().pop();
//     }
//   }
// }
