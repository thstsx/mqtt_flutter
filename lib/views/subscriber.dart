//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'dart:async';
//import 'package:mqtt_flutter/service/mqtt_service.dart';
import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:mqtt_flutter/service/mqtt_service.dart';
import 'package:provider/provider.dart';
import 'package:mqtt_flutter/service/notification_service.dart';

// class MyStateManager {
//   final myListNotifier = ListNotifier();

//   void send(String text) {
//     myListNotifier.add(text);
//   }
// }

// class ListNotifier extends ValueNotifier<List<String>> {
//   ListNotifier() : super([]);

//   void add(String listItem) {
//     value.add(listItem);
//     notifyListeners(); // here
//   }
// }

// class ListNotifier extends ValueNotifier<List<String>> {
//   ListNotifier() : super([]);

//   void add(String listItem) {
//     value.add(listItem);
//     notifyListeners(); // Notify listeners after adding the item
//   }
// }

// // THE SUBSCRIBER WIDGET
class SubscriberPage extends StatefulWidget {
  //final MqttService mqttServiceSub;
  //SubscriberPage(this.mqttServiceSub);
  // --------------------------------------------------------------------------
  // final ValueNotifier<String> _messageValueNotifier;
  // SubscriberPage({required ValueNotifier<String> messageValueNotifier})
  //     : _messageValueNotifier = messageValueNotifier;
  // --------------------------------------------------------------------------
  // final ValueNotifier<String> messageValueNotifier;

  // SubscriberPage({required this.messageValueNotifier});
  // ----------------------------------------------------
  const SubscriberPage({super.key});

  // -------------------------------------------------------------------------------
  // const SubscriberPage({Key? key, required this.onStateReady})
  //     : super(key: key);
  // const SubscriberPage({Key? key}) : super(key: key);
  // // Define a callback function
  // //final void Function(_SubscriberPageState) onStateReady;
  // static final GlobalKey<_SubscriberPageState> subscriberPageKey =
  //     GlobalKey<_SubscriberPageState>();
  // final void Function(String) onUpdateMessage;

  // const SubscriberPage({Key? key, required this.onUpdateMessage})
  //     : super(key: key);
  // ---------------------------------------------------------------------

  @override
  _SubscriberPageState createState() => _SubscriberPageState();
}

// // THE STATE MANAGER ==================================================================
class _SubscriberPageState extends State<SubscriberPage> {
  // ---------------------------------------

  //late final ValueNotifier<String> messageValueNotifier;

  ValueNotifier<String> messageValueNotifier = ValueNotifier<String>('');

  //final MyStateManager _myStateManager = MyStateManager();
  //final ListNotifier myListNotifier = ListNotifier();
  // Call the callback function with the state object
  // widget.onStateReady(this);
  // Method to update messageValueNotifier with the received message
  // void updateMessage(String message) {
  //   setState(() {
  //     messageValueNotifier.value = message;
  //   });
  // }

  //List<String> messages = [];

  // void updateMessages(String message) {
  //   setState(() {
  //     messages.add(message);
  //     // widget.messageValueNotifier.value =
  //     //     message; // Update messageValueNotifier
  //   });
  //   widget.messageValueNotifier.value = message; // Update messageValueNotifier
  // }
  // -----------------------------------------------------------------------------------
  //final NotificationService notificationService;

  // --------------------------------------------------------------------------------
  @override
  void dispose() {
    messageValueNotifier.dispose();
    super.dispose();
  }
  // -------------------------------------------

  _SubscriberPageState();
  //_SubscriberPageState(this.notificationService);
  // // ==============================================================================
  // // LOGIC ========================================================================
  // // ==============================================================================
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  TextEditingController _messageController = TextEditingController();
  //late final TextEditingController _messageController;
  //TextEditingController _messageController = TextEditingController();

  // ValueNotifier<String> _messageValueNotifier =
  //     // to be modified
  //     ValueNotifier<String>('Initial value');
  // ValueNotifier<String> messageValueNotifier =
  //     ValueNotifier<String>('f you lololol');
  // SubscriberPage subscriberPage =
  //     SubscriberPage(messageValueNotifier: messageValueNotifier);

//TextEditingController _messageController = TextEditingController();

// Inside initState or wherever you initialize your state:
// _messageController.addListener(() {
//   _messageValueNotifier.value = _messageController.text;
// });
  // final TextEditingController _messageController =
  //     TextEditingController(); // Initialize the TextEditingController
// _messageController.addListener(() {
//   _messageValueNotifier.value = _messageController.text;
// });

  // MQTT Connection
  //MqttBrowserClient get client => _client;
  MqttService mqttServiceSub = MqttService();
  //MqttService mqttServiceSub = MqttService();
  //late final MqttService mqttServiceSub;
  //_SubscriberPageState(this.mqttServiceSub);
  //MqttConnection _mqttConnection = MqttConnection();
  //final CustomMqttClient _mqttConnCustom = CustomMqttClient();
  //bool _isConnected = false;
  //bool _isConnecting = false;
  //String receivedMessage = '';

  // Define a ValueNotifier<String>
  // ValueNotifier<String> messageValueNotifier =
  //     ValueNotifier<String>('initial value');

  //ValueNotifier<String> messageValueNotifier
// ------------------------------------------------------------
  //final myListNotifier = ValueNotifier<List<String>>([]);
  //final newList = myListNotifier.value.toList();
// Listen for updates from the publisher and update the ValueNotifier
// mqttServiceSub.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
//   final recMess = c![0].payload as MqttPublishMessage;
//   final pt = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

//   // Update the ValueNotifier with the received message
//   messageValueNotifier.value = pt;
// });

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
    // Obtain the BuildContext
    //BuildContext context = context;
    //mqttServiceSub.connect('client_sub', context);
    //_messageController = TextEditingController();
    // _messageController = TextEditingController(text: '');
    //_messageController.addListener(_handleMessageChange as VoidCallback);
    // _messageController.addListener(() {
    //   _messageValueNotifier.value = _messageController.text;
    // });
    //mqttServiceSub.data.addListener(updatePt);
    // -------------------------------------------
    //messageValueNotifier = ValueNotifier<String>('Initial value (!)');
    //SubscriberPage.subscriberPageKey.currentState = this;
    //notificationService.initialize();
  }

  // // ==============================================================================
  // // INITIALIZATION ENDED ---------------------------------------------------------
  // // ==============================================================================
  // @override
  // void dispose() {
  //   // Dispose the controller when the widget is disposed
  //   _messageController.dispose();
  //   super.dispose();
  // }
  // Dispose the TextEditingController and ValueNotifier to avoid memory leaks
  // @override
  // void dispose() {
  //   _messageController.dispose();
  //   //_messageValueNotifier.dispose();
  //   super.dispose();
  // }

  // void updatePt() {
  //   String pt = '';
  //   setState(() {
  //     pt = clientUpdate(mqttServiceSub);
  //   });
  // }

  // @override
  // void dispose() {
  //   mqttServiceSub.data.removeListener(updatePt);
  //   super.dispose();
  // }

  // Handle changes in the message controller
  // void _handleMessageChange() {
  //   String message = _messageController.text;
  //   // Process the received message here
  //   print('Received message (from publisher): $message');
  // }
  // void _handleMessageChange(message) {
  //   //String message = _messageController.text;
  //   // Process the received message here
  //   print('Received message (from UI): $message');
  //   // Update the text controller
  //   setState(() {
  //     _messageController.text = message;
  //     print('Message updated: $message'); // Print the updated message
  //   });
  // }
  // -------------------------------------------------------------------------------------

  List<String> messageList = [];

  void listMessages(String data2) {
    setState(() {
      // Assuming data2 is the latest message received
      messageList.add(data2);
      _messageController.text = data2;
    });
  }

  // ---------------------------------------------------
  void updateMessageValue(String message) {
    messageValueNotifier.value = message;

    //myListNotifier.value.add(message);
    //widget.onUpdateMessage(message);
    // setState(() {
    //   messageValueNotifier.value = message;
    // });
  }

  // ----------------------------------------------------
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

  // ------------------------------------------------------------------------
  // List<String> messageList = [];
  // void displayMessage(String message) {
  //   messageList.add(message);
  // }

  String combinedMessages = '';

  void displayMessage(String topic, String message) {
    String formattedMessage = 'Received Message: $message\nOn topic: $topic\n';
    combinedMessages = formattedMessage + combinedMessages;
  }

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
    ValueNotifier<String> data2Notifier =
        Provider.of<MqttService>(context).data;
    String? data2 = data2Notifier.value;
    bool isSnackbarDisplayed = false;
    // ---------------------------------------------------------------------------------------
    return Scaffold(
      appBar: AppBar(
        title: const Text('MQTT Home (Flutter)'),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
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
                            borderRadius: BorderRadius.circular(8.0),
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
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          // -----------------------------------------------
                          // child: TextField(
                          //   controller: _messageController,
                          //   textAlign: TextAlign.center,
                          //   maxLines: 10,
                          //   decoration: InputDecoration(
                          //     border: OutlineInputBorder(),
                          //   ),
                          // ),
                          // --- DISPLAY PUBLISHED MESSAGES ------------------------------------
                          child: ValueListenableBuilder<String>(
                            valueListenable: messageValueNotifier,
                            //valueListenable: myListNotifier,
                            //valueListenable: mqttServiceSub.data,
                            builder: (BuildContext context, String value,
                                Widget? child) {
                              if (data2 != null && data2.isNotEmpty) {
                                print('value (data2) : $data2');
                              }

                              // --------------------------------------------------------------
                              return TextField(
                                //controller: _messageController,
                                controller: TextEditingController(text: data2),
                                textAlign: TextAlign.center,
                                maxLines: 10,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                //readOnly: true,
                              );
                              // --------------------------------------------------------
                            },
                            // builder
                            // -----------------------------------------------------
                          ),
                          //valueListenable: mqttServiceSub.data,
                          // child 2
                        ),
                        // child 1
                      ),
                    ], // Children
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
                            borderRadius: BorderRadius.circular(8.0),
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
                          backgroundColor: Colors.green,
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
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          'Unsubscribe',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  // ----- NOTIFICATIONS(SNACK BAR) ----------------------------------------------------------------
                  // Snackbar Notifications
                  const SizedBox(height: 8),
                  Builder(
                    builder: (BuildContext context) {
                      String? data2 =
                          Provider.of<MqttService>(context).data.value;
                      // Show Snackbar with data2 value
                      // WidgetsBinding.instance!.addPostFrameCallback((_) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: Text('New meesage arrived : $data2'),
                      //       duration: Duration(seconds: 3),
                      //     ),
                      //   );
                      // });
                      // -------------------------------------------------------------------------
                      if (data2 != null &&
                          data2.isNotEmpty &&
                          !isSnackbarDisplayed) {
                        // Show Snackbar with data2 value
                        WidgetsBinding.instance!.addPostFrameCallback((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Notification : New Message '$data2' arrived."),
                              backgroundColor: Colors.blue,
                              duration: Duration(seconds: 3),
                            ),
                          );
                        });
                        isSnackbarDisplayed = true;
                      }
                      // Placeholder widget
                      return Container();
                    },
                  ),
                  // -----------------------------------------------------------------------------------------------
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
