// import 'dart:async';
// import 'package:mqtt_client/mqtt_client.dart';
// import 'package:mqtt_client/mqtt_server_client.dart';

// class MqttConnection {
//   //late MqttServerClient _client;

//   Future<void> connect() async {
//     MqttServerClient _client =
//         MqttServerClient.withPort('mosquitto', 'flutter_client', 1883);
//     _client.logging(on: true);
//     _client.onConnected = _onConnected;
//     _client.onDisconnected = _onDisconnected;
//     _client.onUnsubscribed = _onUnsubscribed;
//     _client.onSubscribed = _onSubscribed;
//     _client.onSubscribeFail = _onSubscribeFail;
//     _client.pongCallback = _pong;

//     final connMessage = MqttConnectMessage()
//         .authenticateAs('username', 'password')
//         .keepAliveFor(60)
//         .withWillTopic('willtopic')
//         .withWillMessage('Will message')
//         .startClean()
//         .withWillQos(MqttQos.atLeastOnce);
//     _client.connectionMessage = connMessage;

//     try {
//       await _client.connect();
//     } catch (e) {
//       print('Exception: $e');
//       _client.disconnect();
//     }

//     _client.updates?.listen((List<MqttReceivedMessage<MqttMessage>> c) {
//       final MqttPublishMessage message = c[0].payload as MqttPublishMessage;
//       final payload =
//           MqttPublishPayload.bytesToStringAsString(message.payload.message);

//       print('Received message:$payload from topic: ${c[0].topic}>');
//     });

//     //return _client;
//   }

//   void _onConnected() {
//     print('Connected');
//   }

//   void _onDisconnected() {
//     print('Disconnected');
//   }

//   void _onSubscribed(String topic) {
//     print('Subscribed to topic: $topic');
//   }

//   void _onSubscribeFail(String topic) {
//     print('Failed to subscribe to topic: $topic');
//   }

//   void _onUnsubscribed(String? topic) {
//     print('Unsubscribed from topic: $topic');
//   }

//   void _pong() {
//     print('Ping response client callback invoked');
//   }

//   // void subscribe(String topic, MqttQos qos) {
//   //   _client.subscribe(topic, qos);
//   // }

//   // void disconnect() {
//   //   _client.disconnect();
//   // }
// }

// ===================================================
// import 'dart:async';
// import 'package:mqtt_client/mqtt_client.dart';
// import 'package:mqtt_client/mqtt_server_client.dart';
// // import 'package:mqtt_browser_client/mqtt_browser_client.dart';

// class MqttConnection {
//   static MqttServerClient? _client;

//   static MqttServerClient _getClient() {
//     if (_client == null) {
//       _client = MqttServerClient.withPort('mosquitto', 'flutter_client', 1883);
//       _client!.logging(on: true);
//       _client!.onConnected = _onConnected;
//       _client!.onDisconnected = _onDisconnected;
//       _client!.onUnsubscribed = _onUnsubscribed;
//       _client!.onSubscribed = _onSubscribed;
//       _client!.onSubscribeFail = _onSubscribeFail;
//       _client!.pongCallback = _pong;
//     }
//     return _client!;
//   }

//   Future<void> connect() async {
//     final client = _getClient();

//     final connMessage = MqttConnectMessage()
//         .authenticateAs('username', 'password')
//         .keepAliveFor(60)
//         .withWillTopic('willtopic')
//         .withWillMessage('Will message')
//         .startClean()
//         .withWillQos(MqttQos.atLeastOnce);
//     client.connectionMessage = connMessage;

//     try {
//       await client.connect();
//     } catch (e) {
//       print('Exception: $e');
//       client.disconnect();
//     }

//     client.updates?.listen((List<MqttReceivedMessage<MqttMessage>> c) {
//       final MqttPublishMessage message = c[0].payload as MqttPublishMessage;
//       final payload =
//           MqttPublishPayload.bytesToStringAsString(message.payload.message);

//       print('Received message:$payload from topic: ${c[0].topic}>');
//     });
//   }

//   static void _onConnected() {
//     print('Connected');
//   }

//   static void _onDisconnected() {
//     print('Disconnected');
//   }

//   static void _onSubscribed(String topic) {
//     print('Subscribed to topic: $topic');
//   }

//   static void _onSubscribeFail(String topic) {
//     print('Failed to subscribe to topic: $topic');
//   }

//   static void _onUnsubscribed(String? topic) {
//     print('Unsubscribed from topic: $topic');
//   }

//   static void _pong() {
//     print('Ping response client callback invoked');
//   }
// }

// ===========================================================
//import 'dart:io';
import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:mqtt_client/mqtt_client.dart';
//import 'package:mqtt_client/mqtt_server_client.dart';

class MqttConnection {
  //late MqttServerClient _client;
  late MqttBrowserClient _client;

  Future<void> connect() async {
    //_client = MqttClient('mosquitto', '');
    //_client = MqttClient('test.mosquitto.org', '');
    //_client = MqttClient.withPort('broker.emqx.io', 'flutter_client', 1883);
    //final _client = MqttClient('mqtt://localhost:1883', '');
    //final _client = MqttServerClient('ws://127.0.0.1', ''); // conn failure
    //final _client = MqttServerClient.withPort('ws://192.168.0.108', 'flutter_client', 1883); // conn failure
    //final _client = MqttServerClient.withPort('ws://192.168.0.108', 'flutter_client', 9001); // conn failure
    // final _client = MqttBrowserClient.withPort(
    //     'ws://192.168.0.108', 'flutter_client', 9001); // conn success
    final _client = MqttBrowserClient.withPort(
        'ws://192.168.0.108', 'flutter_client', 9001); // conn success
    // cf. const mqttService = new MQTTService('ws://192.168.0.108:9001');
    // Provide SSL configuration
    //_client.secure = true;
    // Set the security context
    //_client.securityContext = SecurityContext.defaultContext;
    _client.logging(on: true);
    _client.onConnected = _onConnected;
    _client.onDisconnected = _onDisconnected;
    _client.onUnsubscribed = _onUnsubscribed;
    _client.onSubscribed = _onSubscribed;
    _client.onSubscribeFail = _onSubscribeFail;
    _client.pongCallback = _pong;

    final connMessage = MqttConnectMessage()
        .authenticateAs('username', 'password')
        .keepAliveFor(60)
        .withWillTopic('willtopic')
        .withWillMessage('Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    _client.connectionMessage = connMessage;

    try {
      await _client.connect();
    } catch (e) {
      print('Exception: $e');
      _client.disconnect();
    }

    _client.updates?.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage message = c[0].payload as MqttPublishMessage;
      final payload =
          MqttPublishPayload.bytesToStringAsString(message.payload.message);

      print('Received message:$payload from topic: ${c[0].topic}>');
    });
  }

  void _onConnected() {
    print('Connected');
  }

  void _onDisconnected() {
    print('Disconnected');
  }

  void _onSubscribed(String topic) {
    print('Subscribed to topic: $topic');
  }

  void _onSubscribeFail(String topic) {
    print('Failed to subscribe to topic: $topic');
  }

  void _onUnsubscribed(String? topic) {
    print('Unsubscribed from topic: $topic');
  }

  void _pong() {
    print('Ping response client callback invoked');
  }

  void subscribe(String topic, MqttQos qos) {
    _client.subscribe(topic, qos);
  }

  void disconnect() {
    _client.disconnect();
  }
}

// =============================================================

// import 'package:mqtt_client/mqtt_client.dart';

// class MqttConnection {
//   late MqttServerClient _client;

//   Future<void> connect() async {
//     _client = MqttServerClient('mosquitto', '');
//     _client.logging(on: true);
//     _client.onConnected = _onConnected;
//     _client.onDisconnected = _onDisconnected;
//     _client.onUnsubscribed = _onUnsubscribed;
//     _client.onSubscribed = _onSubscribed;
//     _client.onSubscribeFail = _onSubscribeFail;
//     _client.pongCallback = _pong;

//     final connMessage = MqttConnectMessage()
//         .authenticateAs('username', 'password')
//         .keepAliveFor(60)
//         .withWillTopic('willtopic')
//         .withWillMessage('Will message')
//         .startClean()
//         .withWillQos(MqttQos.atLeastOnce);
//     _client.connectionMessage = connMessage;

//     try {
//       await _client.connect();
//     } catch (e) {
//       print('Exception: $e');
//       _client.disconnect();
//     }

//     _client.updates?.listen((List<MqttReceivedMessage<MqttMessage>> c) {
//       final MqttPublishMessage message = c[0].payload as MqttPublishMessage;
//       final payload =
//           MqttPublishPayload.bytesToStringAsString(message.payload.message);

//       print('Received message:$payload from topic: ${c[0].topic}>');
//     });
//   }

//   void _onConnected() {
//     print('Connected');
//   }

//   void _onDisconnected() {
//     print('Disconnected');
//   }

//   void _onSubscribed(String topic) {
//     print('Subscribed to topic: $topic');
//   }

//   void _onSubscribeFail(String topic) {
//     print('Failed to subscribe to topic: $topic');
//   }

//   void _onUnsubscribed(String? topic) {
//     print('Unsubscribed from topic: $topic');
//   }

//   void _pong() {
//     print('Ping response client callback invoked');
//   }

//   void subscribe(String topic, MqttQos qos) {
//     _client.subscribe(topic, qos);
//   }

//   void disconnect() {
//     _client.disconnect();
//   }
// }
