// import 'package:flutter/material.dart';

// class SubscriberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT Flutter Subscriber'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'MQTT Flutter',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'Subscriber',
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           Divider(),
//           SizedBox(height: 16),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(labelText: 'Topic'),
//               keyboardType: TextInputType.text,
//               textInputAction: TextInputAction.next,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               decoration: InputDecoration(labelText: 'Message'),
//               keyboardType: TextInputType.multiline,
//               maxLines: 10,
//               readOnly: true,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(labelText: 'Status'),
//               readOnly: true,
//             ),
//           ),
//           SizedBox(height: 16),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle subscribe button press
//                   },
//                   child: Text('Subscribe'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle unsubscribe button press
//                   },
//                   child: Text('Unsubscribe'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// subscriber.dart
// import 'package:flutter/material.dart';

// class SubscriberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT Home (Flutter)'),
//       ),
//       body:

//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'MQTT Subscriber',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'Subscriber',
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           Divider(),
//           SizedBox(height: 16),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(labelText: 'Topic'),
//               keyboardType: TextInputType.text,
//               textInputAction: TextInputAction.next,
//               style: TextStyle(fontSize: 16), // Apply custom font size
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle subscribe button press
//                   },
//                   child: Text('Subscribe'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green, // Apply custom button color
//                     textStyle:
//                         TextStyle(fontSize: 16), // Apply custom font size
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle unsubscribe button press
//                   },
//                   child: Text('Unsubscribe'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red, // Apply custom button color
//                     textStyle:
//                         TextStyle(fontSize: 16), // Apply custom font size
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class SubscriberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT Home (Flutter)'),
//       ),
//       body: Container(
//         color: Colors.grey[200], // Set background color
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'MQTT Subscriber',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue, // Apply custom text color
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'Subscriber',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.black, // Apply custom text color
//                 ),
//               ),
//             ),
//             Divider(),
//             SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Topic',
//                   labelStyle: TextStyle(
//                       fontSize: 16), // Apply custom font size to label
//                 ),
//                 keyboardType: TextInputType.text,
//                 textInputAction: TextInputAction.next,
//                 style: TextStyle(
//                     fontSize: 16), // Apply custom font size to input text
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle subscribe button press
//                     },
//                     child: Text('Subscribe'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor:
//                           Colors.green, // Apply custom button color
//                       textStyle:
//                           TextStyle(fontSize: 16), // Apply custom font size
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle unsubscribe button press
//                     },
//                     child: Text('Unsubscribe'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red, // Apply custom button color
//                       textStyle:
//                           TextStyle(fontSize: 16), // Apply custom font size
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// ----------------------------------------------------------------------------
// 2024.04.26

// import 'package:flutter/material.dart';

// class SubscriberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT Home (Flutter)'),
//       ),
//       body: Container(
//         color: Colors.white, // Set background color to white
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'MQTT Subscriber',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.red, // Apply custom text color
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'Subscriber',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.red, // Apply custom text color
//                 ),
//               ),
//             ),
//             Divider(color: Colors.red), // Add red divider
//             SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Topic',
//                   labelStyle: TextStyle(
//                       fontSize: 16,
//                       color: Colors.red), // Apply custom label color
//                   border: OutlineInputBorder(), // Add border to the input field
//                 ),
//                 keyboardType: TextInputType.text,
//                 textInputAction: TextInputAction.next,
//                 style: TextStyle(
//                     fontSize: 16), // Apply custom font size to input text
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Message',
//                   labelStyle: TextStyle(
//                       fontSize: 16,
//                       color: Colors.red), // Apply custom label color
//                   border: OutlineInputBorder(), // Add border to the input field
//                 ),
//                 keyboardType: TextInputType.multiline,
//                 maxLines: null, // Allow multiple lines for message input
//                 style: TextStyle(
//                     fontSize: 16), // Apply custom font size to input text
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Status',
//                   labelStyle: TextStyle(
//                       fontSize: 16,
//                       color: Colors.red), // Apply custom label color
//                   border: OutlineInputBorder(), // Add border to the input field
//                 ),
//                 readOnly: true, // Make status field read-only
//                 style: TextStyle(
//                     fontSize: 16), // Apply custom font size to input text
//               ),
//             ),
//             SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle subscribe button press
//                     },
//                     child: Text('Subscribe'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor:
//                           Colors.green, // Apply custom button color
//                       textStyle:
//                           TextStyle(fontSize: 16), // Apply custom font size
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle unsubscribe button press
//                     },
//                     child: Text('Unsubscribe'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red, // Apply custom button color
//                       textStyle:
//                           TextStyle(fontSize: 16), // Apply custom font size
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//  2024.04.26 ended
// ========================================================================================
// 2024.04.29 started
// topic input box implemented only
// import 'package:flutter/material.dart';

// class SubscriberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT Home (Flutter)'),
//       ),
//       body: Container(
//         color: Colors.grey[200], // Set background color
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'MQTT Subscriber',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               'Subscriber',
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//             Divider(), // Add a divider
//             SizedBox(height: 16),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Topic',
//                 border: OutlineInputBorder(), // Apply border to the input field
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle subscribe button press
//                   },
//                   child: Text('Subscribe'),
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(
//                         Colors.green), // Apply custom button color
//                     textStyle: MaterialStateProperty.all<TextStyle>(
//                         TextStyle(fontSize: 16)), // Apply custom font size
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle unsubscribe button press
//                   },
//                   child: Text('Unsubscribe'),
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(
//                         Colors.red), // Apply custom button color
//                     textStyle: MaterialStateProperty.all<TextStyle>(
//                         TextStyle(fontSize: 16)), // Apply custom font size
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ------------------------------------
// import 'package:flutter/material.dart';

// class SubscriberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT Home (Flutter)'),
//       ),
//       body: Container(
//         color: Colors.grey[200], // Set background color
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'MQTT Subscriber',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               'Subscriber',
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//             Divider(), // Add a divider
//             SizedBox(height: 16),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Topic',
//                 border: OutlineInputBorder(), // Apply border to the input field
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Message',
//                 border: OutlineInputBorder(), // Apply border to the input field
//               ),
//               keyboardType: TextInputType.multiline,
//               maxLines: null, // Allow multiple lines for message input
//             ),
//             SizedBox(height: 16),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Status',
//                 border: OutlineInputBorder(), // Apply border to the input field
//               ),
//               readOnly: true, // Make status field read-only
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle subscribe button press
//                   },
//                   child: Text('Subscribe'),
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(
//                         Colors.green), // Apply custom button color
//                     textStyle: MaterialStateProperty.all<TextStyle>(
//                         TextStyle(fontSize: 16)), // Apply custom font size
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle unsubscribe button press
//                   },
//                   child: Text('Unsubscribe'),
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(
//                         Colors.red), // Apply custom button color
//                     textStyle: MaterialStateProperty.all<TextStyle>(
//                         TextStyle(fontSize: 16)), // Apply custom font size
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// --------------
// import 'package:flutter/material.dart';

// class SubscriberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT Home (Flutter)'),
//       ),
//       body: Container(
//         color: Colors.grey[200], // Set background color
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'MQTT Subscriber',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               'Subscriber',
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//             Divider(), // Add a divider
//             SizedBox(height: 16),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Topic',
//                 border: OutlineInputBorder(), // Apply border to the input field
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Message',
//                 border: OutlineInputBorder(), // Apply border to the input field
//               ),
//               keyboardType: TextInputType.multiline,
//               maxLines: null, // Allow multiple lines for message input
//             ),
//             SizedBox(height: 16),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Status',
//                 border: OutlineInputBorder(), // Apply border to the input field
//               ),
//               readOnly: true, // Make status field read-only
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle subscribe button press
//                   },
//                   child: Text('Subscribe'),
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(
//                         Colors.green), // Apply custom button color
//                     textStyle: MaterialStateProperty.all<TextStyle>(
//                         TextStyle(fontSize: 16)), // Apply custom font size
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle unsubscribe button press
//                   },
//                   child: Text('Unsubscribe'),
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(
//                         Colors.red), // Apply custom button color
//                     textStyle: MaterialStateProperty.all<TextStyle>(
//                         TextStyle(fontSize: 16)), // Apply custom font size
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// --------------------------------
// import 'package:flutter/material.dart';

// class SubscriberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT Home (Flutter)'),
//       ),
//       body: Container(
//         color: Colors.grey[200],
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'MQTT Subscriber',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               'Subscriber',
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//             Divider(),
//             SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Topic',
//                   border: OutlineInputBorder(),
//                   fillColor: Colors.purple, // Set input box color
//                   filled: true, // Ensure the box is filled with color
//                 ),
//                 keyboardType: TextInputType.text,
//                 textInputAction: TextInputAction.next,
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//             SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Message',
//                   border: OutlineInputBorder(),
//                   fillColor: Colors.purple, // Set input box color
//                   filled: true, // Ensure the box is filled with color
//                 ),
//                 keyboardType: TextInputType.multiline,
//                 maxLines: 10, // Allow multiple lines
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Status',
//                   border: OutlineInputBorder(),
//                   fillColor: Colors.cyan, // Set input box color
//                   filled: true, // Ensure the box is filled with color
//                 ),
//                 readOnly: true,
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//             SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle subscribe button press
//                     },
//                     child: Text('Subscribe'),
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(
//                           Colors.green), // Apply custom button color
//                       textStyle: MaterialStateProperty.all(
//                           TextStyle(fontSize: 16)), // Apply custom font size
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle unsubscribe button press
//                     },
//                     child: Text('Unsubscribe'),
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(
//                           Colors.red), // Apply custom button color
//                       textStyle: MaterialStateProperty.all(
//                           TextStyle(fontSize: 16)), // Apply custom font size
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// -----------------
// import 'package:flutter/material.dart';

// class SubscriberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT Home (Flutter)'),
//       ),
//       body: Container(
//         color: Colors.grey[200], // Set background color
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'MQTT Subscriber',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black, // Apply custom text color
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Subscriber',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.black, // Apply custom text color
//               ),
//             ),
//             Divider(color: Colors.black), // Add a divider with custom color
//             SizedBox(height: 16),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Topic',
//                 labelStyle:
//                     TextStyle(color: Colors.black), // Apply custom label color
//                 border: OutlineInputBorder(), // Apply border to the input field
//               ),
//             ),
//             SizedBox(height: 16),
//             Container(
//               height: 150, // Set the height of the message box to 150
//               child: TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Message',
//                   labelStyle: TextStyle(
//                       color: Colors.black), // Apply custom label color
//                   border:
//                       OutlineInputBorder(), // Apply border to the input field
//                 ),
//                 keyboardType: TextInputType.multiline,
//                 maxLines: 10, // Set the maximum lines to 10
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Status',
//                 labelStyle:
//                     TextStyle(color: Colors.black), // Apply custom label color
//                 border: OutlineInputBorder(), // Apply border to the input field
//               ),
//               readOnly: true, // Make status field read-only
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle subscribe button press
//                   },
//                   child: Text('Subscribe'),
//                   style: ElevatedButton.styleFrom(
//                     textStyle: TextStyle(
//                         color: Colors.black), // Apply custom text color
//                     backgroundColor: Colors.green, // Apply custom button color
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle unsubscribe button press
//                   },
//                   child: Text('Unsubscribe'),
//                   style: ElevatedButton.styleFrom(
//                     textStyle: TextStyle(
//                         color: Colors.black), // Apply custom text color
//                     backgroundColor: Colors.red, // Apply custom button color
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// ----------------
// import 'package:flutter/material.dart';

// class SubscriberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT Home (Flutter)'),
//       ),
//       body: Container(
//         color: Colors.grey[200], // Set background color
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'MQTT Subscriber',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black, // Apply custom text color
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Subscriber',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.black, // Apply custom text color
//               ),
//             ),
//             Divider(color: Colors.black), // Add a divider with custom color
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Text(
//                   'Topic',
//                   style:
//                       TextStyle(color: Colors.black), // Apply custom text color
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border:
//                           OutlineInputBorder(), // Apply border to the input field
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Text(
//                   'Message',
//                   style:
//                       TextStyle(color: Colors.black), // Apply custom text color
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Container(
//                     height: 200, // Set the height of the message box to 200
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border:
//                             OutlineInputBorder(), // Apply border to the input field
//                       ),
//                       keyboardType: TextInputType.multiline,
//                       maxLines:
//                           null, // Allow unlimited lines for the message input
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Text(
//                   'Status',
//                   style:
//                       TextStyle(color: Colors.black), // Apply custom text color
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border:
//                           OutlineInputBorder(), // Apply border to the input field
//                     ),
//                     readOnly: true, // Make status field read-only
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle subscribe button press
//                   },
//                   child: Text('Subscribe'),
//                   style: ElevatedButton.styleFrom(
//                     textStyle: TextStyle(
//                         color: Colors.white), // Apply custom text color
//                     backgroundColor: Colors.green, // Apply custom button color
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle unsubscribe button press
//                   },
//                   child: Text('Unsubscribe'),
//                   style: ElevatedButton.styleFrom(
//                     textStyle: TextStyle(
//                         color: Colors.white), // Apply custom text color
//                     backgroundColor: Colors.red, // Apply custom button color
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// -----------------------------------
// import 'package:flutter/material.dart';

// class SubscriberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT Home (Flutter)'),
//       ),
//       body: Container(
//         color: Colors.grey[200], // Set background color
//         padding: EdgeInsets.all(16.0),
//         width: MediaQuery.of(context).size.width *
//             2 /
//             3, // Set width to two-thirds of the screen width
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'MQTT Subscriber',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black, // Apply custom text color
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Subscriber',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.black, // Apply custom text color
//               ),
//             ),
//             Divider(color: Colors.black), // Add a divider with custom color
//             SizedBox(height: 16),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Topic',
//                   style:
//                       TextStyle(color: Colors.black), // Apply custom text color
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: SizedBox(
//                     width: 200, // Set a specific width for the input field
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border:
//                             OutlineInputBorder(), // Apply border to the input field
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Message',
//                   style:
//                       TextStyle(color: Colors.black), // Apply custom text color
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Container(
//                     width: 200, // Set a specific width for the input field
//                     height: 200, // Set the height of the message box to 200
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border:
//                             OutlineInputBorder(), // Apply border to the input field
//                       ),
//                       keyboardType: TextInputType.multiline,
//                       maxLines:
//                           null, // Allow unlimited lines for the message input
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Status',
//                   style:
//                       TextStyle(color: Colors.black), // Apply custom text color
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: SizedBox(
//                     width: 200, // Set a specific width for the input field
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border:
//                             OutlineInputBorder(), // Apply border to the input field
//                       ),
//                       readOnly: true, // Make status field read-only
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle subscribe button press
//                   },
//                   child: Text('Subscribe'),
//                   style: ElevatedButton.styleFrom(
//                     textStyle: TextStyle(
//                         color: Colors.white), // Apply custom text color
//                     backgroundColor: Colors.green, // Apply custom button color
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle unsubscribe button press
//                   },
//                   child: Text('Unsubscribe'),
//                   style: ElevatedButton.styleFrom(
//                     textStyle: TextStyle(
//                         color: Colors.white), // Apply custom text color
//                     backgroundColor: Colors.red, // Apply custom button color
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class SubscriberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT Home (Flutter)'),
//       ),
//       body: Container(
//         color: Colors.white, // Set background color
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               color: Colors
//                   .white, // Set background color of the header region to white
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'MQTT Subscriber',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black, // Apply custom text color
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Subscriber',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black, // Apply custom text color
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Text(
//                   'Topic',
//                   style:
//                       TextStyle(color: Colors.black), // Apply custom text color
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border:
//                           OutlineInputBorder(), // Apply border to the input field
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Text(
//                   'Message',
//                   style:
//                       TextStyle(color: Colors.black), // Apply custom text color
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Container(
//                     height: 200, // Set the height of the display box
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                           color:
//                               Colors.grey), // Apply border to the display box
//                     ),
//                     child: SingleChildScrollView(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           border: InputBorder
//                               .none, // Remove border from the input field
//                         ),
//                         keyboardType: TextInputType.multiline,
//                         maxLines:
//                             null, // Allow multiple lines for message input
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Text(
//                   'Status',
//                   style:
//                       TextStyle(color: Colors.black), // Apply custom text color
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Container(
//                     height: 100, // Set the height of the display box
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                           color:
//                               Colors.grey), // Apply border to the display box
//                     ),
//                     child: SingleChildScrollView(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           border: InputBorder
//                               .none, // Remove border from the input field
//                         ),
//                         readOnly: true, // Make status field read-only
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment:
//                   MainAxisAlignment.center, // Align buttons to the center
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle subscribe button press
//                   },
//                   child: Text('Subscribe'),
//                   style: ElevatedButton.styleFrom(
//                     textStyle: TextStyle(
//                         color: Colors.white), // Apply custom text color
//                     backgroundColor: Colors.green, // Apply custom button color
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle unsubscribe button press
//                   },
//                   child: Text('Unsubscribe'),
//                   style: ElevatedButton.styleFrom(
//                     textStyle: TextStyle(
//                         color: Colors.white), // Apply custom text color
//                     backgroundColor: Colors.red, // Apply custom button color
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class SubscriberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT Home (Flutter)'),
//       ),
//       body: Container(
//         color: Colors.white, // Set background color
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               color: Colors
//                   .white, // Set background color of the header region to white
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'MQTT Subscriber',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black, // Apply custom text color
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Subscriber',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black, // Apply custom text color
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Text(
//                   'Topic',
//                   style:
//                       TextStyle(color: Colors.black), // Apply custom text color
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: TextField(
//                     textAlign: TextAlign
//                         .left, // Align the text cursor to the left inside the input box
//                     decoration: InputDecoration(
//                       border:
//                           OutlineInputBorder(), // Apply border to the input field
//                       contentPadding: EdgeInsets.symmetric(
//                           vertical: 10.0,
//                           horizontal: 10.0), // Add padding to the input field
//                       isCollapsed:
//                           true, // Collapse the input field to remove extra padding
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Text(
//                   'Message',
//                   style:
//                       TextStyle(color: Colors.black), // Apply custom text color
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Container(
//                     height: 200, // Set the height of the display box
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                           color:
//                               Colors.grey), // Apply border to the display box
//                     ),
//                     child: SingleChildScrollView(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           border: InputBorder
//                               .none, // Remove border from the input field
//                         ),
//                         keyboardType: TextInputType.multiline,
//                         maxLines:
//                             null, // Allow multiple lines for message input
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Text(
//                   'Status',
//                   style:
//                       TextStyle(color: Colors.black), // Apply custom text color
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Container(
//                     height: 100, // Set the height of the display box
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                           color:
//                               Colors.grey), // Apply border to the display box
//                     ),
//                     child: SingleChildScrollView(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           border: InputBorder
//                               .none, // Remove border from the input field
//                         ),
//                         readOnly: true, // Make status field read-only
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment:
//                   MainAxisAlignment.center, // Align buttons to the center
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle subscribe button press
//                   },
//                   child: Text('Subscribe'),
//                   style: ElevatedButton.styleFrom(
//                     textStyle: TextStyle(
//                         color: Colors.white), // Apply custom text color
//                     backgroundColor: Colors.green, // Apply custom button color
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle unsubscribe button press
//                   },
//                   child: Text('Unsubscribe'),
//                   style: ElevatedButton.styleFrom(
//                     textStyle: TextStyle(
//                         color: Colors.white), // Apply custom text color
//                     backgroundColor: Colors.red, // Apply custom button color
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class SubscriberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double topicInputBoxWidth = (2 / 3) * screenWidth;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT Home (Flutter)'),
//       ),
//       body: Container(
//         color: Colors.white, // Set background color
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               color: Colors
//                   .white, // Set background color of the header region to white
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'MQTT Subscriber',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black, // Apply custom text color
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Subscriber',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black, // Apply custom text color
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Text(
//                   'Topic',
//                   style:
//                       TextStyle(color: Colors.black), // Apply custom text color
//                 ),
//                 SizedBox(width: 16),
//                 Container(
//                   width: topicInputBoxWidth,
//                   child: TextField(
//                     textAlign: TextAlign
//                         .left, // Align the text cursor to the left inside the input box
//                     decoration: InputDecoration(
//                       border:
//                           OutlineInputBorder(), // Apply border to the input field
//                       contentPadding: EdgeInsets.symmetric(
//                           vertical: 10.0,
//                           horizontal: 10.0), // Add padding to the input field
//                       isCollapsed:
//                           true, // Collapse the input field to remove extra padding
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Text(
//                   'Message',
//                   style:
//                       TextStyle(color: Colors.black), // Apply custom text color
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Container(
//                     height: 200, // Set the height of the display box
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                           color:
//                               Colors.grey), // Apply border to the display box
//                     ),
//                     child: SingleChildScrollView(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           border: InputBorder
//                               .none, // Remove border from the input field
//                         ),
//                         keyboardType: TextInputType.multiline,
//                         maxLines:
//                             null, // Allow multiple lines for message input
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Text(
//                   'Status',
//                   style:
//                       TextStyle(color: Colors.black), // Apply custom text color
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Container(
//                     height: 100, // Set the height of the display box
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                           color:
//                               Colors.grey), // Apply border to the display box
//                     ),
//                     child: SingleChildScrollView(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           border: InputBorder
//                               .none, // Remove border from the input field
//                         ),
//                         readOnly: true, // Make status field read-only
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment:
//                   MainAxisAlignment.center, // Align buttons to the center
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle subscribe button press
//                   },
//                   child: Text('Subscribe'),
//                   style: ElevatedButton.styleFrom(
//                     textStyle: TextStyle(
//                         color: Colors.white), // Apply custom text color
//                     backgroundColor: Colors.green, // Apply custom button color
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle unsubscribe button press
//                   },
//                   child: Text('Unsubscribe'),
//                   style: ElevatedButton.styleFrom(
//                     textStyle: TextStyle(
//                         color: Colors.white), // Apply custom text color
//                     backgroundColor: Colors.red, // Apply custom button color
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class SubscriberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double topicInputBoxWidth = (2 / 3) * screenWidth;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT Home (Flutter)'),
//       ),
//       body: Container(
//         color: Colors.white, // Set background color
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               color: Colors
//                   .white, // Set background color of the header region to white
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'MQTT Subscriber',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black, // Apply custom text color
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Subscriber',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black, // Apply custom text color
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Text(
//                   'Topic',
//                   style:
//                       TextStyle(color: Colors.black), // Apply custom text color
//                 ),
//                 Spacer(), // Add spacer to push the input box to the right
//                 Container(
//                   width: topicInputBoxWidth,
//                   child: TextField(
//                     textAlign: TextAlign
//                         .left, // Align the text cursor to the left inside the input box
//                     decoration: InputDecoration(
//                       border:
//                           OutlineInputBorder(), // Apply border to the input field
//                       contentPadding: EdgeInsets.symmetric(
//                           vertical: 10.0,
//                           horizontal: 10.0), // Add padding to the input field
//                       isCollapsed:
//                           true, // Collapse the input field to remove extra padding
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Text(
//                   'Message',
//                   style:
//                       TextStyle(color: Colors.black), // Apply custom text color
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Container(
//                     height: 200, // Set the height of the display box
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                           color:
//                               Colors.grey), // Apply border to the display box
//                     ),
//                     child: SingleChildScrollView(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           border: InputBorder
//                               .none, // Remove border from the input field
//                         ),
//                         keyboardType: TextInputType.multiline,
//                         maxLines:
//                             null, // Allow multiple lines for message input
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Text(
//                   'Status',
//                   style:
//                       TextStyle(color: Colors.black), // Apply custom text color
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Container(
//                     height: 100, // Set the height of the display box
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                           color:
//                               Colors.grey), // Apply border to the display box
//                     ),
//                     child: SingleChildScrollView(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           border: InputBorder
//                               .none, // Remove border from the input field
//                         ),
//                         readOnly: true, // Make status field read-only
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment:
//                   MainAxisAlignment.center, // Align buttons to the center
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle subscribe button press
//                   },
//                   child: Text('Subscribe'),
//                   style: ElevatedButton.styleFrom(
//                     textStyle: TextStyle(
//                         color: Colors.white), // Apply custom text color
//                     backgroundColor: Colors.green, // Apply custom button color
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle unsubscribe button press
//                   },
//                   child: Text('Unsubscribe'),
//                   style: ElevatedButton.styleFrom(
//                     textStyle: TextStyle(
//                         color: Colors.white), // Apply custom text color
//                     backgroundColor: Colors.red, // Apply custom button color
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class SubscriberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double boxWidth = (2 / 3) * screenWidth;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT Home (Flutter)'),
//       ),
//       body: Container(
//         color: Colors.white,
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'MQTT Subscriber',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Subscriber',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Text(
//                     'Topic',
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   flex: 2,
//                   child: Container(
//                     width: boxWidth,
//                     child: TextField(
//                       textAlign: TextAlign.left,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Text(
//                     'Message',
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   flex: 2,
//                   child: Container(
//                     width: boxWidth,
//                     child: TextField(
//                       textAlign: TextAlign.left,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Text(
//                     'Status',
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   flex: 2,
//                   child: Container(
//                     width: boxWidth,
//                     child: TextField(
//                       textAlign: TextAlign.left,
//                       readOnly: true,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {},
//                     child: Text('Subscribe'),
//                   ),
//                   SizedBox(width: 16),
//                   ElevatedButton(
//                     onPressed: () {},
//                     child: Text('Unsubscribe'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class SubscriberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double boxWidth = (2 / 3) * screenWidth;

    return Scaffold(
      appBar: AppBar(
        title: Text('MQTT Home (Flutter)'),
      ),
      body: Container(
        color: Colors.white,
        //color: Colors.grey[200],
        padding: EdgeInsets.all(16.0),
        //padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MQTT Flutter',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Subscriber (Flutter)',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            // ?
            Divider(), // Add a divider
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey[200], // Set background color to gray
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Topic',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: boxWidth,
                          decoration: BoxDecoration(
                            color: Colors
                                .white, // Set background color of input box to white
                            borderRadius:
                                BorderRadius.circular(8.0), // Add border radius
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Message',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: boxWidth,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(239, 255, 243, 1),
                            borderRadius:
                                BorderRadius.circular(8.0), // Add border radius
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            maxLines: 10,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Status',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: boxWidth,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(223, 247, 255, 1),
                            borderRadius:
                                BorderRadius.circular(8.0), // Add border radius
                          ),
                          child: TextField(
                            readOnly: true,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Background color
                        ),
                        child: Text(
                          'Subscribe',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Background color
                        ),
                        child: Text(
                          'Unsubscribe',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ---------------------------------------

// import 'package:flutter/material.dart';

// class SubscriberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT Home (Flutter)'),
//       ),
//       body: Container(
//         color: Colors.grey[200], // Set background color
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Topic',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 2 / 3,
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Message',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 2 / 3,
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                     ),
//                     maxLines: 10,
//                     cursorColor: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Status',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 2 / 3,
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                       ),
//                       readOnly: true,
//                       cursorColor: Colors.black,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle subscribe button press
//                   },
//                   child: Text('Subscribe'),
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(
//                         Colors.green), // Apply custom button color
//                     textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
//                         fontSize: 16,
//                         color:
//                             Colors.white)), // Apply custom font size and color
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle unsubscribe button press
//                   },
//                   child: Text('Unsubscribe'),
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(
//                         Colors.red), // Apply custom button color
//                     textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
//                         fontSize: 16,
//                         color:
//                             Colors.white)), // Apply custom font size and color
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
