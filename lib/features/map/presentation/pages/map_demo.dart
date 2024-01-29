// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';


// class MapsDemo extends StatefulWidget {
//   // FIXME: You need to pass in your access token via the command line argument
//   // --dart-define=ACCESS_TOKEN=ADD_YOUR_TOKEN_HERE
//   // It is also possible to pass it in while running the app via an IDE by
//   // passing the same args there.
//   //
//   // Alternatively you can replace `String.fromEnvironment("ACCESS_TOKEN")`
//   // in the following line with your access token directly.
//   static const String ACCESS_TOKEN = String.fromEnvironment("ACCESS_TOKEN");

//   @override
//   State<MapsDemo> createState() => _MapsDemoState();
// }

// class _MapsDemoState extends State<MapsDemo> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   /// Determine the android version of the phone and turn off HybridComposition
//   /// on older sdk versions to improve performance for these
//   ///
//   /// !!! Hybrid composition is currently broken do no use !!!
//   Future<void> initHybridComposition() async {
//     if (!kIsWeb && Platform.isAndroid) {
//       final androidInfo = await DeviceInfoPlugin().androidInfo;
//       final sdkVersion = androidInfo.version.sdkInt;
//       if (sdkVersion != null && sdkVersion >= 29) {
//         MapboxMap.useHybridComposition = true;
//       } else {
//         MapboxMap.useHybridComposition = false;
//       }
//     }
//   }

//   void _pushPage(BuildContext context, ExamplePage page) async {
//     if (!kIsWeb) {
//       final location = Location();
//       final hasPermissions = await location.hasPermission();
//       if (hasPermissions != PermissionStatus.granted) {
//         await location.requestPermission();
//       }
//     }
//     Navigator.of(context).push(MaterialPageRoute<void>(
//         builder: (_) => Scaffold(
//               appBar: AppBar(title: Text(page.title)),
//               body: page,
//             )));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('MapboxMaps examples')),
//       body: MapsDemo.ACCESS_TOKEN.isEmpty ||
//               MapsDemo.ACCESS_TOKEN.contains("YOUR_TOKEN")
//           ? buildAccessTokenWarning()
//           : ListView.separated(
//               itemCount: _allPages.length,
//               separatorBuilder: (BuildContext context, int index) =>
//                   const Divider(height: 1),
//               itemBuilder: (_, int index) => ListTile(
//                 leading: _allPages[index].leading,
//                 title: Text(_allPages[index].title),
//                 onTap: () => _pushPage(context, _allPages[index]),
//               ),
//             ),
//     );
//   }

//   Widget buildAccessTokenWarning() {
//     return Container(
//       color: Colors.red[900],
//       child: SizedBox.expand(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             "Please pass in your access token with",
//             "--dart-define=ACCESS_TOKEN=ADD_YOUR_TOKEN_HERE",
//             "passed into flutter run or add it to args in vscode's launch.json",
//           ]
//               .map((text) => Padding(
//                     padding: EdgeInsets.all(8),
//                     child: Text(text,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white)),
//                   ))
//               .toList(),
//         ),
//       ),
//     );
//   }
// }
