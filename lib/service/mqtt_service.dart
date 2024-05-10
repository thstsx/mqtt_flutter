import 'dart:io';
import 'dart:html' hide VoidCallback;
import 'dart:async';
import 'dart:js';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:provider/provider.dart';
import 'package:typed_data/typed_buffers.dart';
import 'package:mqtt_flutter/service/mqtt_service.dart';
//import 'dart:ui';

// // ======================================================================================
// // MQTT CONNECTION SERVICE ==============================================================
// // ======================================================================================
class MqttService with ChangeNotifier {
  final ValueNotifier<String> data = ValueNotifier<String>("");
  final ValueNotifier<String> messageValueNotifier = ValueNotifier<String>('');
  //late MqttServerClient client;
  //late MqttBrowserClient client;
  //late MqttBrowserClient _client;
  late MqttClient client;

  //bool _creationDispatched = false;
  // MqttConnection() {
  //   _client = MqttBrowserClient.withPort(
  //       'ws://192.168.0.108', 'flutter_client', 9001);
  // }

  //MqttBrowserClient? _client;
  //late MqttClient _client;
  final builder = MqttClientPayloadBuilder();

  // CONFIG
  final SERVER_URL = 'ws://192.168.0.108';
  final CLIENT_IDENTIFIER = 'flutter_client';
  final PORT_NUMBER = 9001;

  Future<Object> connect(String clientIdentifier) async {
    //client = MqttClient('mosquitto', '');
    //client = MqttClient.withPort('broker.emqx.io', 'flutter_client', 1883);
    // final  client = MqttBrowserClient.withPort(
    //     SERVER_URL, CLIENT_IDENTIFIER, PORT_NUMBER); // conn success
    // ------------------------------------------------------------------------------
    // client =
    //     MqttBrowserClient.withPort(SERVER_URL, CLIENT_IDENTIFIER, PORT_NUMBER);
    client =
        MqttBrowserClient.withPort(SERVER_URL, clientIdentifier, PORT_NUMBER);

    // ---------------------------------------------------------------------------------

    client.logging(on: true);
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onUnsubscribed = onUnsubscribed;
    client.onSubscribed = onSubscribed;
    client.onSubscribeFail = onSubscribeFail;
    client.pongCallback = pong;
    // -----------------------------
    client.keepAlivePeriod = 60;
    client.setProtocolV311();
    // ---------------------------------------
    client.autoReconnect = true;
    client.onAutoReconnect = onAutoReconnect;
    client.onAutoReconnected = onAutoReconnected;
    // -----------------------------------------
    // Provide SSL configuration
    // client.secure = true;
    // Set the security context
    // client.securityContext = SecurityContext.defaultContext;
    /// The connection timeout period can be set if needed, the default is 5 seconds.
    // client.connectTimeoutPeriod = 2000; // milliseconds

    //.withClientIdentifier('Mqtt_MyClientUniqueId')
    // final connMessage = MqttConnectMessage()
    //     .authenticateAs('username', 'password')
    //     .keepAliveFor(60)
    //     .withWillTopic('willtopic')
    //     .withWillMessage('Will message')
    //     .startClean()
    //     .withWillQos(MqttQos.atLeastOnce);

    final connMessage = MqttConnectMessage()
        .withWillTopic('willtopic')
        .withWillMessage('Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);

    print('MQTT_LOGS::MQTT Client connecting....');
    client.connectionMessage = connMessage;
    //_client.connectionMessage = connMessage;
    try {
      await client.connect();
    } catch (e) {
      print('Exception: $e');
      client.disconnect();
    }
    // try {
    //   await _client.connect();
    // } catch (e) {
    //   print('Exception: $e');
    //   _client.disconnect();
    // }

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('MQTT_LOGS::MQTT Client connected');
    } else {
      print(
          'MQTT_LOGS::ERROR MQTT Client connection failed - disconnecting, status is ${client.connectionStatus}');
      client.disconnect();
      return -1;
    }

    // Test Subscribing -----------------------------------------------------------------------
    print('MQTT_LOGS::Subscribing to the test/sample topic');
    const topic = 'test/sample';
    client.subscribe(topic, MqttQos.atLeastOnce);
    print('MQTT_LOGS:: test subscription done');
    // ---------------------------------------------------------------------------------------
    // client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
    //   final recMess = c![0].payload as MqttPublishMessage;
    //   final pt =
    //       MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

    //   data.value = pt;
    //   print(
    //       'MQTT_LOGS:: New data arrived: topic is <${c[0].topic}>, payload is $pt');
    //   print('');

    //   //handleMessage(pt);
    // });
    clientUpdate(client);

    // --------------------------------------------------------------------------------------------------
    // 'client_sub' in subscriber.dart
    // if (clientIdentifier == 'client_sub') {
    //   print('client : sub');
    // }
    //print('update and listen done');

    return client;
  }

  // ------------------------------------------------------------------------------

  // ---------------------------------------------------------------------------
  void clientUpdate(MqttClient client) {
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      data.value = pt;
      print(
          'MQTT_LOGS:: New data arrived: topic is <${c[0].topic}>, payload is $pt');
      print('');

      // Provider.of<MqttClient>(context as BuildContext, listen: false)
      //     .messageValueNotifier
      //     .value = pt;

      notifyListeners();

      // -----------------------------------------------------------
      // // Show Snackbar notification
      // ScaffoldMessenger.of(context as BuildContext).showSnackBar(
      //   SnackBar(
      //     content: Text('New Data Arrived: Topic: ${c[0].topic}, Payload: $pt'),
      //     duration: Duration(seconds: 3), // Duration for Snackbar to be visible
      //   ),
      // );

      // ---------------------------------------------------------------
    });
  }

  // void MessageUpdate(String message) {
  //   messageValueNotifier.value = message;
  // }

  // messageValueNotifier

  // // CALLBACKS ----------------------------------------------------------------------
  void onConnected() {
    print('MQTT_LOGS:: Connected');
  }

  void onDisconnected() {
    print('MQTT_LOGS:: Disconnected');
  }

  void onSubscribed(String topic) {
    print('MQTT_LOGS:: Subscribed topic: $topic');
  }

  void onSubscribeFail(String topic) {
    print('MQTT_LOGS:: Failed to subscribe $topic');
  }

  void onUnsubscribed(String? topic) {
    print('MQTT_LOGS:: Unsubscribed topic: $topic');
  }

  void pong() {
    print('MQTT_LOGS:: Ping response client callback invoked');
  }

  void onAutoReconnect() {
    print('MQTT_LOGS:: Initiating client auto reconnection sequence.');
  }

  void onAutoReconnected() {
    print(
        'MQTT_LOGS:: Client auto reconnection sequence completed successfully.');
  }
  // // ----------------------------------------------------------------------------------

  Subscription? subscribe(String topic, MqttQos qosLevel) {
    if (client.connectionStatus!.state != MqttConnectionState.connected) {
      throw Exception('MQTT_LOGS:: MQTT client is not connected.');
    }
    //return client.subscribe(topic, qosLevel);
    Subscription subscription =
        client.subscribe(topic, qosLevel) as Subscription;

    // Listen for updates on the subscription
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      data.value = pt;
    });
    return subscription;
    // return client.subscribe(topic, qosLevel)
  }

// ----------------------------------------------------------------
  //void resubscribe() => subscriptionsManager!.resubscribe();

  // --------------------------------------------------------
  // Subscription? _subscribe(String topic, MqttQos qos) {
  //   print('subscribe func inside mqtt_conn...');
  //   if (_client.connectionStatus!.state != MqttConnectionState.connected) {
  //     throw ConnectionException(_client.connectionStatus!.state);
  //   }
  //   return _client.subscriptionsManager!.registerSubscription(topic, qos);
  // }
  // void _subscribe(String topic, MqttQos qos) {
  //   print('subscribe func inside mqtt_conn...');
  //   _client.subscribe("topic/test", MqttQos.atLeastOnce);
  //   _client.subscribe(topic, qos);
  // }

  // void subscribe(String topic, MqttQos qos) {
  //   print('subscribe func inside mqtt_conn...');
  //   if (_client.connectionStatus!.state == MqttConnectionState.connected) {
  //     _client.subscribe(topic, qos);
  //     print('Subscription request sent for topic: $topic');
  //   } else {
  //     print('Failed to subscribe: Client is not connected');
  //   }
  // }

  // void subscribe(String topic, MqttQos qos) {
  //   //_mqttConnection.subscribe(topic, qos);

  //   _client.subscribe(topic, qos);
  // }

  // Subscription? subscribe(String topic, MqttQos qosLevel) {
  //   var connectionStatus = MqttClientConnectionStatus();
  //   @protected
  //   MqttConnectionHandlerBase? connectionHandler;
  //   @protected
  //   SubscriptionsManager? subscriptionsManager;
  //   if (connectionStatus!.state != MqttConnectionState.connected) {
  //     throw ConnectionException(connectionHandler?.connectionStatus.state);
  //   }
  //   return subscriptionsManager!.registerSubscription(topic, qosLevel);
  // }

  // void _subscribe(MqttClient client, String topic) {
  //   //client.subscribe(topic, MqttQos.atMostOnce);
  //   // client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
  //   //   final recMess = c![0].payload as MqttPublishMessage;
  //   //   final pt =
  //   //       MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
  //   //   data.value = pt;
  //   //   print(
  //   //       'MQTT_LOGS:: New data sent: topic is <${c[0].topic}>, payload is $pt');
  //   //   print('');
  //   // });
  //   client.subscribe(topic, MqttQos.atLeastOnce);
  //   // if (client != null) {
  //   //   client.subscribe(topic, MqttQos.atMostOnce);
  //   // } else {
  //   //   print('Error: MQTT client is null');
  //   // }
  // }
// =======================================================================================
// Improve unsubscribe later ? (examples from the dart official document)
  IMqttConnectionHandler? connectionHandler;
  Map<int, MqttPublishMessage> publishedMessages = <int, MqttPublishMessage>{};

  bool handlePublishAcknowledgement(MqttMessage? msg) {
    final ackMsg = msg as MqttPublishAckMessage;
    // If we're expecting an ack for the message, remove it from the list of pubs awaiting ack.
    final messageIdentifier = ackMsg.variableHeader.messageIdentifier;
    MqttLogger.log(
        'PublishingManager::handlePublishAcknowledgement for message id $messageIdentifier');
    if (publishedMessages.keys.contains(messageIdentifier)) {
      //notifyPublish(publishedMessages[messageIdentifier!]);
      publishedMessages.remove(messageIdentifier);
    }
    return true;
  }

  //String _receivedMessage = '';
  // Method to handle MQTT messages and update _receivedMessage
  handleMessage(String messages) {
    if (messages != null && messages.isNotEmpty) {
      // final recMess = messages[0].payload as MqttPublishMessage;
      // final receivedMessage =
      //     MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      // Update _receivedMessage
      //_receivedMessage = receivedMessage;

      //print('Received message (!) : $_receivedMessage');
      print('Received message (!) : $messages');
    }
    return messages;
  }

  // Getter to access the received message
  //String get receivedMessage => _receivedMessage;
//   PublishingManager(this.connectionHandler, this._clientEventBus) {
//   connectionHandler!.registerForMessage(
//       MqttMessageType.publishAck, handlePublishAcknowledgement);
//   connectionHandler!
//       .registerForMessage(MqttMessageType.publish, handlePublish);
//   connectionHandler!.registerForMessage(
//       MqttMessageType.publishComplete, handlePublishComplete);
//   connectionHandler!.registerForMessage(
//       MqttMessageType.publishRelease, handlePublishRelease);
//   connectionHandler!.registerForMessage(
//       MqttMessageType.publishReceived, handlePublishReceived);
// }
// @protected
// events.EventBus? clientEventBus;

  // PublishingManager(
  //     IMqttConnectionHandler? connectionHandler, EventBus? clientEventBus)

//   SubscriptionsManager(
//     this.connectionHandler, this.publishingManager, this._clientEventBus) {
//   connectionHandler!
//       .registerForMessage(MqttMessageType.subscribeAck, confirmSubscription);
//   connectionHandler!
//       .registerForMessage(MqttMessageType.unsubscribeAck, confirmUnsubscribe);
//   // Start listening for published messages and re subscribe events.
//   _clientEventBus!.on<MessageReceived>().listen(publishMessageReceived);
//   _clientEventBus!.on<Resubscribe>().listen(_resubscribe);
// }

//SubscriptionsManager(IMqttConnectionHandler? connectionHandler, PublishingManager? publishingManager, EventBus? _clientEventBus);

// PublishingManager(this.connectionHandler, this._clientEventBus) {
//   connectionHandler!.registerForMessage(
//       MqttMessageType.publishAck, handlePublishAcknowledgement);
//   connectionHandler!
//       .registerForMessage(MqttMessageType.publish, handlePublish);
//   connectionHandler!.registerForMessage(
//       MqttMessageType.publishComplete, handlePublishComplete);
//   connectionHandler!.registerForMessage(
//       MqttMessageType.publishRelease, handlePublishRelease);
//   connectionHandler!.registerForMessage(
//       MqttMessageType.publishReceived, handlePublishReceived);
// }

//   SubscriptionsManager(
//     this.connectionHandler, this.publishingManager, this._clientEventBus) {
//   connectionHandler!
//       .registerForMessage(MqttMessageType.subscribeAck, confirmSubscription);
//   connectionHandler!
//       .registerForMessage(MqttMessageType.unsubscribeAck, confirmUnsubscribe);
//   // Start listening for published messages and re subscribe events.
//   _clientEventBus!.on<MessageReceived>().listen(publishMessageReceived);
//   _clientEventBus!.on<Resubscribe>().listen(_resubscribe);
// }
  // ----------------------------------------------------------------
  // void unsubscribe(String topic, {expectAcknowledge = false}) {
  //   subscriptionsManager!
  //       .unsubscribe(topic, expectAcknowledge: expectAcknowledge);
  // }
  // ======================================================================

  void unsubscribe(String topic, {expectAcknowledge = false}) {
    client.unsubscribe(topic, expectAcknowledge: expectAcknowledge);
  }

// ---------------------------------------------------------------------------
  void publishMessage(String pubTopic, String message) {
    //const pubTopic = 'test/sample';
    print('pub topic1 : $pubTopic');
    print('pub message1 : $message');
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);

    if (client.connectionStatus?.state == MqttConnectionState.connected) {
      client.publishMessage(pubTopic, MqttQos.atLeastOnce, builder.payload!);
    }
  }

  // void handleIncomingMessage(String topic, String message) {
  //   print('Received message (from MQTT broker): $message on topic: $topic');
  //   // Update UI or perform any other actions with the received message
  //   client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
  //     final recMess = c![0].payload as MqttPublishMessage;
  //     final pt =
  //         MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
  //     data.value = pt;
  //   });
  // }

  // @protected
  // static void maybeDispatchObjectCreation(ChangeNotifier object) {
  //   // Tree shaker does not include this method and the class MemoryAllocations
  //   // if kFlutterMemoryAllocationsEnabled is false.
  //   if (kFlutterMemoryAllocationsEnabled && !object._creationDispatched) {
  //     FlutterMemoryAllocations.instance.dispatchObjectCreated(
  //       library: _flutterFoundationLibrary,
  //       className: '$ChangeNotifier',
  //       object: object,
  //     );
  //     object._creationDispatched = true;
  //   }
  // }

  // @override
  // void addListener(VoidCallback listener) {
  //   assert(ChangeNotifier.debugAssertNotDisposed(this));

  //   if (kFlutterMemoryAllocationsEnabled) {
  //     maybeDispatchObjectCreation(this);
  //   }

  //   if (_count == _listeners.length) {
  //     if (_count == 0) {
  //       _listeners = List<VoidCallback?>.filled(1, null);
  //     } else {
  //       final List<VoidCallback?> newListeners =
  //           List<VoidCallback?>.filled(_listeners.length * 2, null);
  //       for (int i = 0; i < _count; i++) {
  //         newListeners[i] = _listeners[i];
  //       }
  //       _listeners = newListeners;
  //     }
  //   }
  //   _listeners[_count++] = listener;
  // }
  // void publishMessage(String pubTopic, MqttQos qos, String message) {
  //   // final builder = MqttClientPayloadBuilder();
  //   // builder.addString('Hello MQTT');
  //   // Uint8List data = Uint8List.fromList("testmessage".codeUnits);
  //   // Uint8Buffer dataBuffer = Uint8Buffer();
  //   // dataBuffer.addAll(data);
  //   // _client.publishMessage(pubTopic, MqttQos.atLeastOnce, dataBuffer);
  //   // String tst_str = new Text(builder.payload.toString()) as String;
  //   // _client.publishMessage(
  //   //     pubTopic, MqttQos.atLeastOnce, builder.payload as Uint8Buffer);
  //   _client.publishMessage(
  //       pubTopic, MqttQos.atLeastOnce, message as Uint8Buffer);
  // }

  // void publishMessage(String pubTopic, MqttQos qos, String message) {
  //   if (_client.connectionStatus!.state == MqttConnectionState.connected) {
  //     var MqttPayloadBuilder;
  //     _client.publishMessage(
  //         pubTopic, qos, MqttPayloadBuilder.fromUtf8String(message).payload!);
  //     print('Message published to topic: $pubTopic');
  //   } else {
  //     print('Failed to publish message: Client is not connected');
  //   }
  // }

  // void disconnect() {
  //   _client.disconnect();
  // }
  // // --------------------------------------------------------------------------------------
}
// // CLASS Mqtt Service ENDED ===============================================================