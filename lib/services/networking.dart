import 'package:covid19stats/services/location.dart';
import 'package:geocoder/geocoder.dart';

class Network {
  Future<Address> getCurrentLocationAddress() async {
    Location location = Location();
    await location.getCurrentLocation();
    final coordinates = new Coordinates(location.latitude, location.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var addressInfo = addresses.first;
//    print(addressInfo.subAdminArea);
//    print(addressInfo.adminArea);
//    print(addressInfo.countryName);
    return addressInfo;
  }
}
