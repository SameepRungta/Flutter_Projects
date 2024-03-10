import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String bitcoinValueInUSD = '?';

  Widget getDropdownButton() {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: getCurrenciesDropdownItems(),
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
          getData(); // Refresh data when currency changes
        });
      },
      style: TextStyle(color: Colors.white),
      dropdownColor: Colors.amber, // Golden color
      icon: Icon(Icons.arrow_drop_down, color: Colors.white),
    );
  }

  List<DropdownMenuItem<String>> getCurrenciesDropdownItems() {
    return currenciesList.map((currency) {
      return DropdownMenuItem(
        child: Text(
          currency,
          style: TextStyle(color: Colors.black),
        ),
        value: currency,
      );
    }).toList();
  }

  CupertinoPicker getiOSPicker() {
    List<Text> pickerItems = currenciesList.map((currency) {
      return Text(
        currency,
        style: TextStyle(color: Colors.black),
      );
    }).toList();

    return CupertinoPicker(
      backgroundColor: Colors.amber, // Golden color
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getData(); // Refresh data when currency changes
        });
      },
      children: pickerItems,
    );
  }

  void getData() async {
    try {
      double data = await CoinData().getCoinData(selectedCurrency);
      setState(() {
        bitcoinValueInUSD = data.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
      // Show a Snackbar or update UI to inform the user about the error.
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🪙 BitCoin Tracker '),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black, // Background color
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(20.0),
              color: Colors.black, // Card background color
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  '1 BTC = $bitcoinValueInUSD $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.amber, // Golden color
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Platform.isIOS ? getiOSPicker() : getDropdownButton(),
            ),
          ],
        ),
      ),
    );
  }
}
