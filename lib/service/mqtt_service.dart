import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_browser_client.dart'; // Use this import for web apps
//import 'package:mqtt_client/mqtt_io_client.dart'; // Use this import for mobile/desktop apps
import 'dart:math';
import 'dart:async';
import 'dart:html';

// ======================================================================================================
// class MqttService {
//   MqttClient? _mqttClient;

//   void connectToBroker() {
//     final clientId =
//         'client' + DateTime.now().millisecondsSinceEpoch.toString();

//     // Adjust host based on your configuration
//     final host = 'ws://192.168.0.108:9001';

//     final options = MqttConnectOptions(
//       keepAliveInterval: 60,
//       clientId: clientId,
//       protocolName: 'MQTT',
//       protocolVersion: 4,
//       cleanSession: true,
//       autoReconnect: true,
//       onBadCertificate: (dynamic exception) {
//         // Handle bad certificate if needed
//       },
//     );

//     _mqttClient = MqttClient(host, '');
//     _mqttClient!.logging(on: true);
//     _mqttClient!.onConnected = _onConnected;
//     _mqttClient!.onDisconnected = _onDisconnected;
//     _mqttClient!.onSubscribed = _onSubscribed;
//     _mqttClient!.onUnsubscribed = _onUnsubscribed;
//     _mqttClient!.onError = _onError;

//     try {
//       _mqttClient!.connect(options);
//     } catch (e) {
//       print('Error connecting to MQTT broker: $e');
//     }
//   }

//   void _onConnected() {
//     print('Connected to MQTT broker');
//     // Add any additional handling here
//   }

//   void _onDisconnected() {
//     print('Disconnected from MQTT broker');
//     // Add any additional handling here
//   }

//   void _onSubscribed(String? topic) {
//     print('Subscribed to topic: $topic');
//     // Add any additional handling here
//   }

//   void _onUnsubscribed(String? topic) {
//     print('Unsubscribed from topic: $topic');
//     // Add any additional handling here
//   }

//   void _onError(dynamic error) {
//     print('MQTT error: $error');
//     // Add any error handling here
//   }

//   void disconnect() {
//     _mqttClient?.disconnect();
//   }

//   void subscribeToTopic(String topic) {
//     if (_mqttClient != null &&
//         _mqttClient!.connectionStatus.state == MqttConnectionState.connected) {
//       _mqttClient!.subscribe(topic, MqttQos.atLeastOnce);
//     } else {
//       print('Cannot subscribe: MQTT client is not connected.');
//     }
//   }

//   void unsubscribeFromTopic(String topic) {
//     if (_mqttClient != null &&
//         _mqttClient!.connectionStatus.state == MqttConnectionState.connected) {
//       _mqttClient!.unsubscribe(topic);
//     } else {
//       print('Cannot unsubscribe: MQTT client is not connected.');
//     }
//   }
// }

class MqttService {
  late MqttClient _mqttClient;
  //MqttClient? _mqttClient;
  late void Function() _onConnectedCallback;
  late void Function() _onDisconnectedCallback;
  late void Function() _onSubscribedCallback;
  late void Function() _onUnsubscribedCallback;
  late void Function() _onAutoReconnectCallback;

  // MqttConnectionState? get connectionStatus =>
  //     _mqttClient.connectionStatus?.state;

// option 1
  MqttConnectionState? get connectionState {
    if (_mqttClient.connectionStatus != null) {
      return _mqttClient.connectionStatus!.state;
    } else {
      return null; // or any default state you want to return when connectionStatus is null
    }
  }

// option 2
// void subscribe(String topic, MqttQos qos) {
//   if (_mqttService.connectionStatus?.state == MqttConnectionState.connected) {
//     _mqttService.subscribe(topic, qos);
//   } else {
//     print('Cannot subscribe: MQTT client is not connected.');
//     // You can add additional handling here, such as attempting to reconnect.
//   }
// }

  // Config
  //final String mqttHost = "localhost";
  // the company
  final String mqttHost = "192.168.0.108";
  // home
  //final String mqttHost = "192.168.0.102";
  //final String protocol = "mqtt";
  final int port = 9001;
  late final hostURL = 'ws://$mqttHost:$port/mqtt';

  final clientId = () async {
    final chars = String.fromCharCodes(
        List.generate(36, (index) => index < 26 ? index + 97 : index + 22));
    final random = Random();
    return 'client_' +
        List.generate(10, (_) => chars[random.nextInt(chars.length)]).join('');
  }();

  MqttService(String clientId) {
    //_mqttClient = MqttClient(clientId, '');
    _mqttClient = MqttBrowserClient(hostURL, '');

    // Initialize other properties and methods...
  }

  // Future<MqttConnectOptions> _createConnectOptions() async {
  //   final String clientId = await this.clientId;

  //   return MqttConnectOptions()
  //     ..keepAliveInterval = 60
  //     ..cleanSession = true
  //     ..autoReconnect = true
  //     ..clientIdentifier = clientId
  //     ..protocolVersion = MqttClientConstants.mqttV311;
  // }

  Future<void> connectToBroker() async {
    //final String serverUri = 'ws://192.168.0.108:9001';
    //final String clientId = 'flutter_client';
    final String clientId = await this.clientId;

    //_mqttClient = MqttClient(hostURL, '');
    _mqttClient = MqttBrowserClient(hostURL, '');

    _mqttClient.logging(on: true);

    _mqttClient.autoReconnect = true;

    _mqttClient.onConnected = _onConnected;
    _mqttClient.onDisconnected = _onDisconnected;
    _mqttClient.onSubscribed = _onSubscribed;
    _mqttClient.onUnsubscribed = _onUnsubscribed;
    _mqttClient.onAutoReconnect = _onAutoReconnect;

    //late void Function() _onConnectedCallback;

    final MqttConnectMessage connMess = MqttConnectMessage()
        .withClientIdentifier(clientId)
        .withWillTopic('willtopic')
        .withWillMessage('My will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);

    _mqttClient.keepAlivePeriod = 60;

    try {
      await _mqttClient.connect();
      _mqttClient.connectionMessage = connMess;
    } catch (e) {
      print('Error connecting to MQTT broker: $e');
    }
  }

  // -------------------------------------------------------------
  // void subscribe(String topic, MqttQos qos) {
  //   if (_mqttClient.connectionStatus.state == MqttConnectionState.connected) {
  //     _mqttClient.subscribe(topic, qos);
  //   } else {
  //     print('Cannot subscribe: MQTT client is not connected.');
  //     // Add additional error handling or attempt to reconnect.
  //   }
  // }

  void subscribe(String topic, MqttQos qos) {
    if (_mqttClient.connectionStatus?.state == MqttConnectionState.connected) {
      _mqttClient.subscribe(topic, qos);
    } else {
      print('Cannot subscribe: MQTT client is not connected.');
      // Add additional error handling or attempt to reconnect.
    }
  }

  void unsubscribe(String topic) {
    if (_mqttClient.connectionStatus?.state == MqttConnectionState.connected) {
      _mqttClient.unsubscribe(topic);
    } else {
      print('Cannot unsubscribe: MQTT client is not connected.');
      // Add additional error handling or attempt to reconnect.
    }
  }

  // -------------------------------------------------------------
  void setOnConnectedCallback(void Function() onConnected) {
    _onConnectedCallback = onConnected;
  }

  void setOnDisconnectedCallback(void Function() onDisconnected) {
    _onDisconnectedCallback = onDisconnected;
  }

  void setOnSubscribedCallback() {
    //_onSubscribedCallback = onSubscribed;
    print('Subscribed to topic');
  }

  void setOnUnsubscribedCallback() {
    //_onUnsubscribedCallback = onUnsubscribed;
    print('Unsubscribed from topic');
  }

  void setOnAutoReconnectCallback(void Function() onAutoReconnect) {
    _onAutoReconnectCallback = onAutoReconnect;
  }

  // ------------------------------------------------------------
  void _onConnected() {
    print('Connected to MQTT broker');
    // Add any additional handling here
    if (_onConnectedCallback != null) {
      _onConnectedCallback!();
    }
  }

  void _onDisconnected() {
    print('Disconnected from MQTT broker');
    // Add any additional handling here
  }

  void _onSubscribed(String? topic) {
    print('Subscribed to topic: $topic');
    // Add any additional handling here
  }

  void _onUnsubscribed(String? topic) {
    print('Unsubscribed from topic: $topic');
    // Add any additional handling here
  }

  void _onAutoReconnect() {
    print('Auto reconnecting to MQTT broker');
    // Add any additional handling here
  }

  // Implement other MQTT operations like subscribe, unsubscribe, publish, etc.
}


// ================================================================================
// ================================================================================