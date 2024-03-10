// coin_data.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'DFE39F12-BCBA-4E4A-8B7B-2E7BA8C18783'; // Replace with your actual API key

class CoinData {
  Future<double> getCoinData(String selectedCurrency) async {
    String requestURL = '$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey';

    try {
      http.Response response = await http.get(Uri.parse(requestURL));

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var lastPrice = decodedData['rate'];
        return lastPrice.toDouble();
      } else {
        throw 'Problem with the get request';
      }
    } catch (e) {
      throw 'Error fetching data: $e';
    }
  }
}
