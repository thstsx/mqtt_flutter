//import 'dart:html';
import 'package:flutter/material.dart';
//import 'package:mqtt_client/mqtt_client.dart';
import 'dart:async';
//import 'package:mqtt_flutter/service/mqtt_service.dart';
//import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:mqtt_flutter/service/mqtt_connection.dart';

// =================================================================

class SubscriberPage extends StatefulWidget {
  @override
  _SubscriberPageState createState() => _SubscriberPageState();
}

class _SubscriberPageState extends State<SubscriberPage> {
  //late MqttConnection _mqttConnection;
  //String _subscribedTopic = '';

  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  //   TextEditingController _messageController = TextEditingController();

  final MqttConnection _mqttConnection = MqttConnection();
  bool _isConnected = false;
  bool _isConnecting = false;

  // @override
  // void initState() {
  //   super.initState();
  //   //_mqttConnection = MqttConnection();
  //   //_connectToBroker();
  //   try {
  //     print('Connecting to MQTT broker...1');
  //     _mqttConnection.connect(); //
  //     print('Connected to MQTT broker...1');
  //   } catch (e) {
  //     print('Failed to connect to MQTT broker: $e');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    //_mqttConnection = MqttConnection();
    //_connectToBroker();
    // print('Connecting to MQTT broker(1)...');
    // _mqttConnection.connect().catchError((e) {
    //   print('Failed to connect to MQTT broker(1): $e');
    // }).then((_) {
    //   print('MQTT broker(1)...');
    // });
    _connectToBroker();
  }

  // void _subscribeToTopic() {
  //   final topic = _topicController.text.trim();
  //   if (topic.isNotEmpty) {
  //     print('Subscribing to Topic: $topic');
  //     //_mqttConnection.subscribe(topic, MqttQos.atLeastOnce);
  //     _statusController.text = 'SUBSCRIBED';
  //     print('Subscribed to Topic: $topic');
  //   } else {
  //     _statusController.text = '';
  //   }
  // }
  // void _subscribeToTopic() {
  //   final topic = _topicController.text.trim();
  //   if (topic.isNotEmpty) {
  //     if (_mqttConnection.isConnected) {
  //       print('Subscribing to Topic: $topic');
  //       //_mqttConnection.subscribe(topic, MqttQos.atLeastOnce);
  //       _statusController.text = 'SUBSCRIBED';
  //       print('Subscribed to Topic: $topic');
  //     } else {
  //       print('Failed to subscribe: MQTT client is not connected.');
  //       // Optionally, you can show a message to the user indicating the connection status.
  //     }
  //   } else {
  //     _statusController.text = '';
  //   }
  // }

  // void _subscribeToTopic() {
  //   final topic = _topicController.text.trim();
  //   if (topic.isNotEmpty && _isConnected) {
  //     // Check connection status
  //     print('Subscribing to Topic: $topic');
  //     //_mqttConnection.subscribe(topic, MqttQos.atLeastOnce);
  //     _statusController.text = 'SUBSCRIBED';
  //     print('Subscribed to Topic: $topic');
  //   } else {
  //     _statusController.text = '';
  //     print('Failed to subscribe: MQTT client is not connected.');
  //     // Optionally, you can show a message to the user indicating the connection status.
  //   }
  // }

  void _subscribeToTopic() {
    final topic = _topicController.text.trim();
    if (topic.isNotEmpty && _isConnected) {
      print('Subscribing to Topic: $topic');
      //_mqttConnection.subscribe(topic, MqttQos.atLeastOnce);
      _statusController.text = 'SUBSCRIBED';
      print('Subscribed to Topic: $topic');
    } else if (_isConnecting) {
      print('Connection attempt is still in progress...');
    } else {
      _statusController.text = '';
      print('Failed to subscribe: MQTT client is not connected.');
    }
  }

  // Future<void> _connectToBroker() async {
  //   try {
  //     print('Connecting to MQTT broker(2)...');
  //     await _mqttConnection.connect();
  //     print('MQTT broker(2)...');
  //   } catch (e) {
  //     print('Failed to connect to MQTT broker(2): $e');
  //   }
  // }

  // Future<void> _connectToBroker() async {
  //   try {
  //     await _mqttConnection.connect();
  //     setState(() {
  //       _isConnected = true; // Update connection status
  //     });
  //   } catch (e) {
  //     print('Failed to connect to MQTT broker: $e');
  //     setState(() {
  //       _isConnected = false; // Update connection status
  //     });
  //   }
  // }

  // Future<void> _connectToBroker() async {
  //   try {
  //     print('Connecting to MQTT broker(1)...');
  //     await _mqttConnection.connect();
  //     setState(() {
  //       _isConnected = true; // Update connection status
  //     });
  //     print('Connected to MQTT broker(1)');
  //   } catch (e) {
  //     print('Failed to connect to MQTT broker: $e');
  //     setState(() {
  //       _isConnected = false; // Update connection status
  //     });
  //   }
  // }

  // Future<void> _connectToBroker() async {
  //   try {
  //     print('Connecting to MQTT broker(1)...');
  //     // Start the connection attempt
  //     final connectionFuture = _mqttConnection.connect();

  //     // Set a timeout for the connection attempt (e.g., 10 seconds)
  //     final timeout = Duration(seconds: 10);
  //     await Future.any([connectionFuture, Future.delayed(timeout)]);

  //     // Check if the connection attempt succeeded or timed out
  //     if (!_mqttConnection.isConnected) {
  //       throw TimeoutException('Connection attempt timed out');
  //     }

  //     setState(() {
  //       _isConnected = true; // Update connection status
  //     });
  //     print('Connected to MQTT broker(1)');
  //   } catch (e) {
  //     print('Failed to connect to MQTT broker: $e');
  //     setState(() {
  //       _isConnected = false; // Update connection status
  //     });
  //   }
  // }

  Future<void> _connectToBroker() async {
    try {
      setState(() {
        _isConnecting = true;
      });
      print('Connecting to MQTT broker(1)...');
      await Future.any([
        _mqttConnection.connect(),
        Future.delayed(
            Duration(seconds: 10)), // Adjust timeout duration as needed
      ]);
      setState(() {
        _isConnected = true; // Update connection status
        _isConnecting = false;
      });
      print('Connected to MQTT broker(1)');
    } catch (e) {
      print('Failed to connect to MQTT broker: $e');
      setState(() {
        _isConnected = false; // Update connection status
        _isConnecting = false;
      });
    }
  }

  // ==============================================================================
  // ==============================================================================
  // Design Part -----------------------------------------------------------------
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
              'Subscriber',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            // ?
            //Divider(), // Add a divider
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
                            controller: _topicController,
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
                            //controller: _messageController,
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
                            controller: _statusController,
                            readOnly: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
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
                        //onPressed: () {},
                        onPressed: _subscribeToTopic,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Background color
                        ),
                        child: Text(
                          'Subscribe',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {},
                        //onPressed: _unsubscribeFromTopic,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Background color
                        ),
                        child: Text(
                          'Unsubscribe',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
