import 'package:flutter/material.dart';
//import 'package:flutter_geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';

class ConvertLatLangToAddress extends StatefulWidget {
  const ConvertLatLangToAddress({Key? key}) : super(key: key);

  @override
  _ConvertLatLangToAddressState createState() =>
      _ConvertLatLangToAddressState();
}

class _ConvertLatLangToAddressState extends State<ConvertLatLangToAddress> {

  String stAddress ='',stadd='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(stAddress),
        Text(stadd),
        GestureDetector(
          onTap: () async {
            List<Location> locations = await locationFromAddress("Gronausestraat 710, Enschede");
            List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);
// From a query
            // final query = "1600 Amphiteatre Parkway, Mountain View";
            // var addresses = await Geocoder.local.findAddressesFromQuery(query);
            // var first1 = addresses.first;
            // print(
            //   "${first1.featureName} : ${first1.coordinates}",  //to coordinates
            // );
            // final coordinates = Coordinates(33.6992, 72.9744);
            // var address =
            //     await Geocoder.local.findAddressesFromCoordinates(coordinates);
            // var first = address.first;
            // //Text("Address"+ first.featureName.toString()+first.addressLine.toString());
            // print("Address" +
            //     first.featureName.toString() +
            //     first.addressLine.toString()); //print address
                setState(() {
                  //stAddress=first.addressLine.toString();
                  stadd=placemarks.reversed.last.country.toString() + placemarks.reversed.last.locality.toString();
                  stAddress="${locations.last.latitude}${locations.last.longitude}";
                });
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: const Center(
                child: Text('Convert'),
              ),
            ),
          ),
        ),
      ],
    )
        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       Column(
        //         children: <Widget>[
        //            Text('latitude: 37.597576, longitude: 55.771899'),
        //        //   Text(address),
        //         ],
        //       ),
        //       const SizedBox(height: 40),
        //       Column(
        //         children: <Widget>[
        //           const Text('address: Москва, 4-я Тверская-Ямская улица, 7'),
        //           //Text(latLong),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {

        //     // From coordinates
        //     final coordinates = new Coordinates(33.6992, 72.9744);
        //     final addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
        //     final first = addresses.first;
        //     print("${first.featureName} : ${first.addressLine}");

        //     // From a query
        //     final query = "1600 Amphiteatre Parkway, Mountain View";
        //     var add = await Geocoder.local.findAddressesFromQuery(query);
        //     var second = add.first;
        //     print("${second.featureName} : ${second.coordinates}");
        //     // setState(() {});
        //   },
        //   child: const Icon(Icons.search),
        // ),
        );
  }
}
