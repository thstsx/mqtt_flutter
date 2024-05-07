import 'dart:io';
import 'dart:html';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:typed_data/typed_buffers.dart';
import 'package:mqtt_flutter/service/mqtt_service.dart';

// // ======================================================================================
// // MQTT CONNECTION SERVICE ==============================================================
// // ======================================================================================
class MqttService with ChangeNotifier {
  final ValueNotifier<String> data = ValueNotifier<String>("");
  //late MqttServerClient client;
  //late MqttBrowserClient client;
  //late MqttBrowserClient _client;
  late MqttClient client;

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

    // test // run successfully
    print('MQTT_LOGS::Subscribing to the test/lol topic');
    const topic = 'test/sample';
    client.subscribe(topic, MqttQos.atLeastOnce);
    print('test subscription done');
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      data.value = pt;
      print(
          'MQTT_LOGS:: New data arrived: topic is <${c[0].topic}>, payload is $pt');
      print('');
    });
    print('update and listen done');

    return client;
  }

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
    print('Initiating client auto reconnection sequence.');
  }

  void onAutoReconnected() {
    print('Client auto reconnection sequence completed successfully.');
  }
  // // ----------------------------------------------------------------------------------

  Subscription? subscribe(String topic, MqttQos qosLevel) {
    if (client.connectionStatus!.state != MqttConnectionState.connected) {
      throw Exception('MQTT client is not connected.');
    }
    return client.subscribe(topic, qosLevel);
  }
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
// IMqttConnectionHandler? connectionHandler;
// Map<int, MqttPublishMessage> publishedMessages = <int, MqttPublishMessage>{};

// bool handlePublishAcknowledgement(MqttMessage? msg) {
//   final ackMsg = msg as MqttPublishAckMessage;
//   // If we're expecting an ack for the message, remove it from the list of pubs awaiting ack.
//   final messageIdentifier = ackMsg.variableHeader.messageIdentifier;
//   MqttLogger.log(
//       'PublishingManager::handlePublishAcknowledgement for message id $messageIdentifier');
//   if (publishedMessages.keys.contains(messageIdentifier)) {
//     _notifyPublish(publishedMessages[messageIdentifier!]);
//     publishedMessages.remove(messageIdentifier);
//   }
//   return true;
// }
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
    print('pub topic : $pubTopic');
    print('pub message : $message');
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);

    if (client.connectionStatus?.state == MqttConnectionState.connected) {
      client.publishMessage(pubTopic, MqttQos.atLeastOnce, builder.payload!);
    }
  }
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