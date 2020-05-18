import 'package:http/http.dart' as http;
import 'dart:convert';

class AddressInfoData {
  Future<dynamic> getDistrictData() async {
    http.Response response =
        await http.get('https://api.covid19india.org/state_district_wise.json');
    var addressData = jsonDecode(response.body);
    return addressData;
  }

  Future<dynamic> getStateData() async {
    http.Response response = await http.get(
        'https://api.apify.com/v2/key-value-stores/toDWvRj1JpTXiM8FF/records/LATEST?disableRedirect=true');
    var stateData = jsonDecode(response.body);
    return stateData;
  }
}
