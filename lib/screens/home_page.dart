import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pantophobi/screens/metadata.dart';
import 'package:pantophobi/services/firebase_services.dart';
import 'package:pantophobi/widgets/grid.dart';

import 'package:pantophobi/widgets/widgets.dart';

import '../constant.dart';

class HomePage extends StatefulWidget {
  final FirebaseAuth firebaseAuth;

  const HomePage({Key key, this.firebaseAuth}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _checkboxListTile = true;

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(19.0760, 72.8777),
    zoom: 11.5,
  );

  GoogleMapController _controller;
  Position position;
  Widget _child;

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId("Home"),
        position: LatLng(19.0760, 72.8777),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: "Home"),
      ),
    ].toSet();
  }

  final allowNotifications = NotificationSetting(title: 'Allow Notifications');

  final notifications = [
    NotificationSetting(title: 'All'),
    NotificationSetting(title: 'Danger'),
    NotificationSetting(title: 'Threats'),
    NotificationSetting(title: 'Conflicts'),
    NotificationSetting(title: 'Protests'),
    NotificationSetting(title: 'Military'),
    NotificationSetting(title: 'Police'),
    NotificationSetting(title: 'Fire'),
    NotificationSetting(title: 'Other Natural Disasters'),
    NotificationSetting(title: 'Power Outage'),
    NotificationSetting(title: 'Internet Outage'),
    NotificationSetting(title: 'Cell phone Outage'),
    NotificationSetting(title: 'Car wrecks'),
    NotificationSetting(title: 'Plane wrecks'),
    NotificationSetting(title: 'Storms'),
    NotificationSetting(title: 'Criminal activity'),
    NotificationSetting(title: 'Virus Outbreak'),
    NotificationSetting(title: 'Other'),
  ];

  // void initState() {
  //   _child = RippleIndicator("Getting Location");
  //   getCurrentLocation();
  //   super.initState();
  // }

  // void getCurrentLocation() async {
  //   Position res = await Geolocator().getCurrentPosition();
  // }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseServices _firebaseServices = FirebaseServices();

  PageController _tabsPageController;
  int _selectedTab = 0;

  get firebaseAuth => null;

  @override
  void initState() {
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Icon(Icons.location_on),
                  Text(
                    'My  Location :  Mumbai',
                    style: Constants.regularHeading,
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(top: 5),
                height: 60,
                child: Column(
                  children: [
                    Icon(Icons.volume_up_rounded),
                    Text(
                      'Report Event',
                      style: Constants.regularHeading,
                    ),
                  ],
                ),
              ),
              onTap: () {
                {
                  return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0))),
                          contentPadding: EdgeInsets.only(top: 0.0),
                          content: Container(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(top: 20),
                                        width: double.infinity,
                                        height: 65,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(32.0),
                                              topRight: Radius.circular(32.0)),
                                        ),
                                        child: Text(
                                          "Report",
                                          style: Constants.whiteHeading,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Grid(),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                    height: 4.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          ],
        ),
      ),
      body: GoogleMap(
        markers: _createMarker(),
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _controller = controller,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 65,
                width: 65,
                child: FittedBox(
                  child: FloatingActionButton(
                    backgroundColor: Colors.black,
                    heroTag: "btn",
                    onPressed: () {
                      {
                        return showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(32.0))),
                                contentPadding: EdgeInsets.only(top: 10.0),
                                content: Container(
                                  height: 800,
                                  width: 900,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              "Filter Events",
                                              style: Constants.boldHeading,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                          height: 4.0,
                                        ),
                                        ...notifications
                                            .map(buildSingleCheckbox)
                                            .toList(),
                                        InkWell(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                top: 20.0, bottom: 20.0),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(32.0),
                                                  bottomRight:
                                                      Radius.circular(32.0)),
                                            ),
                                            child: Text(
                                              "Done",
                                              style: Constants.whiteHeading,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    },
                    child: Icon(Icons.filter_alt_rounded),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 65,
                width: 65,
                child: FittedBox(
                  child: FloatingActionButton(
                    backgroundColor: Colors.black,
                    heroTag: "btn2",
                    onPressed: () {},
                    child: Icon(Icons.location_on),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signOut() async {
    await _auth.signOut();
  }

  Widget buildToggleCheckbox(NotificationSetting notification) => buildCheckbox(
      notification: notification,
      onClicked: () {
        final newValue = !notification.value;

        setState(() {
          allowNotifications.value = newValue;
          notifications.forEach((notification) {
            notification.value = newValue;
          });
        });
      });

  Widget buildSingleCheckbox(NotificationSetting notification) => buildCheckbox(
        notification: notification,
        onClicked: () {
          setState(() {
            final newValue = !notification.value;
            notification.value = newValue;

            if (!newValue) {
              allowNotifications.value = false;
            } else {
              final allow =
                  notifications.every((notification) => notification.value);
              allowNotifications.value = allow;
            }
          });
        },
      );

  Widget buildCheckbox({
    @required NotificationSetting notification,
    @required VoidCallback onClicked,
  }) =>
      ListTile(
        onTap: onClicked,
        leading: Checkbox(
          value: notification.value,
          onChanged: (value) => onClicked(),
        ),
        title: Text(
          notification.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
}
