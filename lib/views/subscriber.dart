//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'dart:async';
//import 'package:mqtt_flutter/service/mqtt_service.dart';
import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:mqtt_flutter/service/mqtt_service.dart';
import 'package:provider/provider.dart';

// // THE SUBSCRIBER WIDGET
class SubscriberPage extends StatefulWidget {
  //final MqttService mqttServiceSub;
  //SubscriberPage(this.mqttServiceSub);

  const SubscriberPage({super.key});
  @override
  _SubscriberPageState createState() => _SubscriberPageState();
}

// // THE STATE MANAGER ==================================================================
class _SubscriberPageState extends State<SubscriberPage> {
  // // ==============================================================================
  // // LOGIC ========================================================================
  // // ==============================================================================
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  // MQTT Connection
  //MqttBrowserClient get client => _client;
  MqttService mqttServiceSub = MqttService();
  //MqttService mqttServiceSub = MqttService();
  //late final MqttService mqttServiceSub;
  //_SubscriberPageState(this.mqttServiceSub);
  //MqttConnection _mqttConnection = MqttConnection();
  //final CustomMqttClient _mqttConnCustom = CustomMqttClient();
  bool _isConnected = false;
  bool _isConnecting = false;

  // Status Colors for the Subscriber UI
  Color _getStatusColor() {
    switch (_statusController.text.toUpperCase()) {
      case 'SUBSCRIBED':
        return Colors.green;
      case 'UNSUBSCRIBED':
        return Colors.red;
      default:
        return Colors.orange; // Return black for any other status text
    }
  }

  // // ==============================================================================
  // // INITIALIZATION ---------------------------------------------------------------
  // // ==============================================================================
  @override
  void initState() {
    super.initState();
    //_mqttConnection = MqttConnection();
    // _mqttConnection = MqttConnection(); // Initialize _mqttConnection
    // //_client = _mqttConnection.client;
    // _connectToBroker();
    // -----------------------------
    //mqttServiceSub.connect();
    //mqttServiceSub = MqttService();
    mqttServiceSub.connect('client_sub');
  }
  // // ==============================================================================
  // // INITIALIZATION ENDED ---------------------------------------------------------
  // // ==============================================================================

  void _subscribeToTopic(mqttServiceSub) async {
    final topic = _topicController.text.trim();

    print('mqtt service sub : $mqttServiceSub');
    if (topic.isNotEmpty) {
      print('Subscribing to Topic: $topic');
      //_mqttConnection.subscribe(topic, MqttQos.atLeastOnce);
      //_statusController.text = 'SUBSCRIBED';
      print('mqtt qos : $MqttQos.atLeastOnce');

      try {
        // Ensure that the MQTT client is connected before subscribing
        await mqttServiceSub.connect('flutter_client');
      } catch (e) {
        print('Failed to connect to MQTT broker: $e');
        return;
      }

      // After connecting, subscribe to the topic
      mqttServiceSub.subscribe(topic, MqttQos.atLeastOnce);
      print('hoho?');
      setState(() {
        _statusController.text = 'SUBSCRIBED'; // Update status controller text
      });
      print('huhu?');
      print('Subscribed to Topic: $topic');
    } else {
      //_statusController.text = '';
      setState(() {
        _statusController.text = ''; // Update status controller text
      });
      print('Failed to subscribe: Topic is empty.');
    }
  }

// async added
  void _unsubscribeFromTopic(mqttServiceSub) async {
    final topic = _topicController.text.trim();
    if (topic.isNotEmpty) {
      // --------------------------------------------------------------------
      print('Unsubscribing from Topic: $topic');

      mqttServiceSub.unsubscribe(topic);

      setState(() {
        _statusController.text = 'UNSUBSCRIBED';
      });

      print('Unsubscribed from Topic: $topic');
      // -----------------------------------------------------------------------
    } else {
      //_statusController.text = '';
      setState(() {
        _statusController.text = ''; // Update status controller text
      });
      print('Failed to unsubscribe.');
    }
  }

//----------------------------------------------------
  // Future<void> _connectToBroker() async {
  //   _mqttConnection = MqttConnection();
  //   try {
  //     setState(() {
  //       _isConnecting = true;
  //     });
  //     print('Connecting to MQTT broker(1)...');

  //     // 0503
  //     //final connectionFuture = _mqttConnection.connect();

  //     await Future.any([
  //       // old one
  //       _mqttConnection.connect(),
  //       // 0503
  //       //connectionFuture,
  //       // 0503
  //       // Future.delayed(Duration(seconds: 10)).then((_) {
  //       //   // If _mqttConnection.connect() hasn't completed within 10 seconds, throw a TimeoutException
  //       //   throw TimeoutException('Connection timed out');
  //       // }),
  //       // old one
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
              'Subscriber',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            // ?
            //Divider(), // Add a divider
            // --- TOPIC ------------------------------------------------
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
                  // -- MESSAGE -------------------------------------------------
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
                            color: const Color.fromRGBO(239, 255, 243, 1),
                            borderRadius:
                                BorderRadius.circular(8.0), // Add border radius
                          ),
                          child: const TextField(
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
                  // ---STATUS-------------------------------------------------
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
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
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: boxWidth,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(223, 247, 255, 1),
                            borderRadius:
                                BorderRadius.circular(8.0), // Add border radius
                          ),
                          child: TextField(
                            controller: _statusController,
                            readOnly: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                //--------------------------
                                color: _getStatusColor(),
                                fontWeight: FontWeight.bold),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // --- SUBSCRIBE BUTTON ----------------------------------------------

                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        //onPressed: () {},
                        //onPressed: _subscribeToTopic,
                        //onPressed: () => _subscribeToTopic(mqttServiceSub),
                        onPressed: () {
                          var mqttServiceSub =
                              Provider.of<MqttService>(context, listen: false);
                          _subscribeToTopic(mqttServiceSub);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Background color
                        ),
                        child: const Text(
                          'Subscribe',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // --- UNSUBSCRIBE BUTTON -----------------------------------------------------------
                      const SizedBox(width: 16),
                      ElevatedButton(
                        //onPressed: () {},
                        //onPressed: _unsubscribeFromTopic,
                        //onPressed: () => _unsubscribeFromTopic(mqttServiceSub),
                        onPressed: () {
                          var mqttServiceSub =
                              Provider.of<MqttService>(context, listen: false);
                          _unsubscribeFromTopic(mqttServiceSub);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Background color
                        ),
                        child: const Text(
                          'Unsubscribe',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  //
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
