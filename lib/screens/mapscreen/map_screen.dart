import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final LatLng? initialLocation;
  const MapScreen({key, this.initialLocation});
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? selectedLocation;
  Set<Circle> circles = {}; // Store circles for different radii
  TextEditingController searchController = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
    // Initialize selectedLocation with the initialLocation provided
    selectedLocation = widget.initialLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              if (selectedLocation != null) {
                Navigator.pop(context, selectedLocation);
                print(selectedLocation);
              } else {
                // Handle the case when no location is selected
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) {
              print("Map created: $controller");
              _controller.complete(controller);
              // controller.setMapStyle(
              //     '[{"featureType":"all","elementType":"labels.text.fill","stylers":[{"color":"#7C93A3"}]},{"featureType":"all","elementType":"labels.text.stroke","stylers":[{"color":"#000000"},{"lightness":13}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#000000"}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#144B53"},{"lightness":14},{"weight":1.4}]},{"featureType":"landscape","elementType":"all","stylers":[{"color":"#08304B"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#0C4152"},{"lightness":5}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#000000"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#0B434F"},{"lightness":25}]},{"featureType":"road.arterial","elementType":"geometry.fill","stylers":[{"color":"#000000"}]},{"featureType":"road.arterial","elementType":"geometry.stroke","stylers":[{"color":"#0B3D51"},{"lightness":16}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#000000"}]},{"featureType":"transit","elementType":"all","stylers":[{"color":"#146474"}]},{"featureType":"water","elementType":"all","stylers":[{"color":"#021019"}]}]');
            },
            trafficEnabled: true,
            initialCameraPosition: CameraPosition(
              target: widget.initialLocation ?? LatLng(0.0, 0.0),
              zoom: 5,
            ),
            onTap: (latLng) {
              setState(() {
                selectedLocation = latLng;
                updateCircles(selectedLocation!);
              });
            },
            markers: Set<Marker>.from([
              if (selectedLocation != null)
                Marker(
                  markerId: MarkerId('selected_location'),
                  position: selectedLocation!,
                ),
            ]),
            circles: circles,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
          ),
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search for a location',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      searchLocation();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void searchLocation() async {
    String searchTerm = searchController.text;
    if (searchTerm.isEmpty) return;
    try {
      List<Location> locations = await locationFromAddress(searchTerm);
      if (locations.isNotEmpty) {
        Location firstLocation = locations.first;
        LatLng newLatLng =
            LatLng(firstLocation.latitude, firstLocation.longitude);
        // Move the camera to the new location
        final GoogleMapController? controller = await _controller.future;
        if (controller != null) {
          controller.animateCamera(CameraUpdate.newLatLngZoom(newLatLng, 12));
        }
        setState(() {
          selectedLocation = newLatLng;
          updateCircles(selectedLocation!);
        });
      }
    } catch (e) {
      print('Error searching for location: $e');
    }
  }

  // Method to update circles for different radii
  void updateCircles(LatLng location) {
    setState(() {
      // Clear existing circles
      circles.clear();
      // Add circles with different radii
      circles.add(
        Circle(
          circleId: CircleId('1_mile_radius'),
          center: location,
          radius: 1609.34, // 1 mile in meters
          fillColor: Color(0x220000FF), // Set fill color with opacity
          strokeWidth: 0,
        ),
      );
      circles.add(
        Circle(
          circleId: CircleId('2_miles_radius'),
          center: location,
          radius: 3218.69, // 2 miles in meters
          fillColor: Color(0x2200FF00),
          strokeWidth: 0,
        ),
      );
      circles.add(
        Circle(
          circleId: CircleId('3_miles_radius'),
          center: location,
          radius: 4828.03, // 3 miles in meters
          fillColor: Color(0x22FF0000),
          strokeWidth: 0,
        ),
      );
      // Add more circles as needed for different radii
    });
  }
}
