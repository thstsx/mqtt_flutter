import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'dart:async';
import 'package:mqtt_flutter/service/mqtt_service.dart';
import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:mqtt_flutter/views/subscriber.dart';
import 'package:provider/provider.dart';

// // THE PUBLISHER WIDGET
class PublisherPage extends StatefulWidget {
  @override
  _PublisherPageState createState() => _PublisherPageState();
}

// // THE STATE MANAGER ==================================================================
class _PublisherPageState extends State<PublisherPage> {
  // // ==============================================================================
  // // LOGIC ------------------------------------------------------------------------
  // // ==============================================================================
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  // MQTT Connection
  //final MqttConnection _mqttConnection = MqttConnection();
  //late MqttConnection _mqttConnection;
  //MqttConnection _mqttConnection = MqttConnection();

  MqttService mqttServicePub = MqttService();

  //bool _isConnected = false;
  //bool _isConnecting = false;

  // // ==============================================================================
  // // INITIALIZATION ---------------------------------------------------------------
  // // ==============================================================================
  @override
  void initState() {
    super.initState();
    // _connectToBroker();
    //mqttServicePub.connect();
    mqttServicePub = MqttService();
    mqttServicePub.connect('client_pub');
    //mqttServicePub.connect('client_pub', context);
  }
  // // ==============================================================================
  // // INITIALIZATION ENDED ---------------------------------------------------------
  // // ==============================================================================

  // Future<void> connect() async {
  //   var _client = MqttBrowserClient.withPort(
  //       'ws://192.168.0.108', 'flutter_client', 9001);
  //   // Initialize _client here
  //   _client = MqttBrowserClient.withPort(
  //     'ws://192.168.0.108',
  //     'flutter_client',
  //     9001,
  //   );

  //   // Other connection setup code...
  // }

  // Future<void> _connectToBroker() async {
  //   var _client = MqttBrowserClient.withPort(
  //       'ws://192.168.0.108', 'flutter_client', 9001);
  //   try {
  //     await _client!.connect();
  //     setState(() {
  //       //_isConnected = true;
  //       _client!.connectionStatus!.state == MqttConnectionState.connected;
  //     });
  //   } catch (error) {
  //     print('Failed to connect to MQTT broker: $error');
  //   }
  // }

  // Future<void> _connectToBroker() async {
  //   try {
  //     await _mqttConnection.connect();
  //     setState(() {
  //       _isConnected = true;
  //     });
  //   } catch (error) {
  //     print('Failed to connect to MQTT broker: $error');
  //   }
  // }

  // Future<void> _connectToBroker() async {
  //   try {
  //     setState(() {
  //       _isConnecting = true;
  //     });
  //     print('Connecting to MQTT broker(2)...');
  //     await Future.any([
  //       _mqttConnection.connect(),
  //       Future.delayed(
  //           Duration(seconds: 10)), // Adjust timeout duration as needed
  //     ]);
  //     setState(() {
  //       _isConnected = true; // Update connection status
  //       _isConnecting = false;
  //     });
  //     print('Connected to MQTT broker(2)');
  //   } catch (e) {
  //     print('Failed to connect to MQTT broker: $e');
  //     setState(() {
  //       _isConnected = false; // Update connection status
  //       _isConnecting = false;
  //     });
  //   }
  // }

  // void _publishMessage() {
  //   final topic = _topicController.text.trim();
  //   final message = _messageController.text.trim();

  //   print('------------');
  //   print('topic : $topic');
  //   print('---');
  //   print('message : $message');
  //   print('-----------------------');

  //   // final builder = MqttClientPayloadBuilder();
  //   // builder.addString(message);
  //   if (topic.isNotEmpty && _isConnected) {
  //     try {
  //       _mqttConnection.publishMessage(topic, MqttQos.atLeastOnce, message);
  //       print('Sending Topic: $topic, Message: $message');
  //     } catch (e) {
  //       // Handle the exception here
  //       print('Failed to publish: $e');
  //     }
  //   } else if (_isConnecting) {
  //     print('Connection attempt is still in progress...');
  //   } else {
  //     print('Failed to publish.');
  //   }
  // }

  // void publishMessage(String pubTopic, MqttQos qos, String message) {
  //   var MqttPayloadBuilder;
  //   var _client = MqttBrowserClient.withPort(
  //       'ws://192.168.0.108', 'flutter_client', 9001);
  //   // Ensure _client is initialized before publishing
  //   if (_client.connectionStatus!.state == MqttConnectionState.connected) {
  //     // Publish message using _client
  //     _client.publishMessage(
  //       pubTopic,
  //       qos,
  //       MqttPayloadBuilder.fromUtf8String(message).payload!,
  //     );
  //     print('Message published to topic: $pubTopic');
  //   } else {
  //     print('Failed to publish message: Client is not connected');
  //   }
  // }

  // void _publishMessage() {
  //   final topic = _topicController.text.trim();
  //   final message = _messageController.text.trim();
  //   var _client = MqttBrowserClient.withPort(
  //       'ws://192.168.0.108', 'flutter_client', 9001);
  //   var MqttPayloadBuilder;
  //   if (_isConnected) {
  //     try {
  //       _client.publishMessage(
  //         topic,
  //         MqttQos.atLeastOnce,
  //         MqttPayloadBuilder.fromUtf8String(message).payload!,
  //       );
  //       print('Message published to topic: $topic');
  //     } catch (e) {
  //       print('Failed to publish message: $e');
  //     }
  //   } else {
  //     print('Failed to publish message: Client is not connected');
  //   }
  // }

  // void _publishMessage() {
  //   final topic = _topicController.text.trim();
  //   final message = _messageController.text.trim();

  //   var _client = MqttBrowserClient.withPort(
  //       'ws://192.168.0.108', 'flutter_client', 9001);
  //   var MqttPayloadBuilder;
  //   if (_client != null &&
  //       _client.connectionStatus!.state == MqttConnectionState.connected) {
  //     try {
  //       _client.publishMessage(
  //           topic,
  //           MqttQos.atLeastOnce,
  //           MqttPayloadBuilder.fromUtf8String(message)
  //               .payload!); // Call the publishMessage function
  //       print('Sending Topic: $topic, Message: $message');
  //     } catch (e) {
  //       // Handle the exception here
  //       print('Failed to publish: $e');
  //     }
  //   } else {
  //     print('Failed to publish message: Client is not connected');
  //   }
  // }

  // void _publishMessage() {
  //   final topic = _topicController.text.trim();
  //   final message = _messageController.text.trim();

  //   var _client = MqttBrowserClient.withPort(
  //       'ws://192.168.0.108', 'flutter_client', 9001);

  //   var MqttPayloadBuilder;
  //   if (_client != null &&
  //       _client!.connectionStatus!.state == MqttConnectionState.connected) {
  //     try {
  //       _client!.publishMessage(
  //         topic,
  //         MqttQos.atLeastOnce,
  //         MqttPayloadBuilder.fromUtf8String(message).payload!,
  //       );
  //       print('Sending Topic: $topic, Message: $message');
  //     } catch (e) {
  //       print('Failed to publish: $e');
  //     }
  //   } else {
  //     print('Failed to publish message: Client is not connected');
  //   }
  // }

  // void _publishMessage(MqttConnection mqttConnection) {
  //   final pubTopic = _topicController.text.trim();
  //   final pubMessage = _messageController.text.trim();

  //   // var _client = MqttBrowserClient.withPort(
  //   //     'ws://192.168.0.108', 'flutter_client', 9001);

  //   //const pubTopic = 'topic/test';
  //   final builder = MqttClientPayloadBuilder();
  //   //builder.addString('Hello MQTT');
  //   builder.addString(pubMessage);

  //   if (pubTopic.isNotEmpty && _isConnected) {
  //     final payloadString = utf8.decode(builder.payload!);
  //     mqttConnection.publishMessage(
  //         pubTopic, MqttQos.atLeastOnce, payloadString);
  //   } else if (_isConnecting) {
  //     print('Connection attempt is still in progress...');
  //   } else {
  //     print('Failed to publish.');
  //   }
  // }

  void _publishMessage(mqttServicePub) {
    final pubTopic = _topicController.text.trim();
    final pubMessage = _messageController.text.trim();
    print('pub topic2 : $pubTopic');
    print('pub message2 : $pubMessage');

    if (pubTopic.isNotEmpty) {
      mqttServicePub.publishMessage(pubTopic, pubMessage);

      // Update message value in subscriber
      // var subscriberPageState =
      //     context.findAncestorStateOfType<_SubscriberPageState>();
      // Provide the callback function to SubscriberPage
      // SubscriberPage subscriberPage =
      //     Provider.of<SubscriberPage>(context, listen: false);
      // subscriberPage.onUpdateMessage(pubMessage);
    } else {
      print('Failed to publish.');
    }
  }

  // Future<void> _connectToBroker() async {
  //   try {
  //     setState(() {
  //       _isConnecting = true;
  //     });
  //     print('Connecting to MQTT broker(1)...');
  //     await Future.any([
  //       _mqttConnection.connect(),
  //       Future.delayed(
  //           const Duration(seconds: 10)), // Adjust timeout duration as needed
  //     ]);
  //     setState(() {
  //       _isConnected = true; // Update connection status
  //       _isConnecting = false;
  //     });
  //     print('Connected to MQTT broker(1)');
  //   } catch (e) {
  //     print('Failed to connect to MQTT broker: $e');
  //     setState(() {
  //       _isConnected = false; // Update connection status
  //       _isConnecting = false;
  //     });
  //   }
  // }

  // void _connectToBroker() {
  //   //_mqttConnection = MqttConnection();
  //   try {
  //     _mqttConnection.connect().then((_) {
  //       setState(() {
  //         _isConnected = true;
  //       });
  //     }).catchError((error) {
  //       print('Failed to connect to MQTT broker: $error');
  //     });
  //   } catch (e) {
  //     print('Failed to connect to MQTT broker: $e');
  //   }
  // }
  // // ==============================================================================
  // // LOGIC ENDED ==================================================================
  // // ==============================================================================

  // // ==============================================================================
  // // INTERFACE ====================================================================
  // // ==============================================================================
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double boxWidth = (2 / 3) * screenWidth;

    return Scaffold(
      appBar: AppBar(
        title: const Text('MQTT Home (Flutter)'),
      ),
      body: Container(
        color: Colors.white,
        //color: Colors.grey[200],
        padding: const EdgeInsets.all(16.0),
        //padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'MQTT Flutter',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Publisher',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            // --- TOPIC -----------------------------------------------
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[200], // Set background color to gray
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text(
                          'Topic',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
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
                            controller: _topicController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // --- MESSAGE -------------------------------------------------------------
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
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
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: boxWidth,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(8.0), // Add border radius
                          ),
                          child: TextField(
                            controller: _messageController,
                            textAlign: TextAlign.left,
                            maxLines: 10,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // --- PUBLISH BUTTON -------------------------------------------------------------
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        //onPressed: () {},
                        //onPressed: _publishMessage(_mqttConnection),
                        onPressed: () => _publishMessage(mqttServicePub),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Background color
                        ),
                        child: const Text(
                          'Publish',
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
  // // ==============================================================================
  // // INTERFACE ENDED ==============================================================
  // // ==============================================================================
}
