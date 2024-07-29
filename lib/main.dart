import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MaterialApp(
    title: 'Currency Converter',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: CurrencyConverter(),
  ));
}

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double amount = 1.0;
  String baseCurrency = 'USD';
  String targetCurrency = 'EUR';
  double result = 0.0;
  bool isLoading = false;
  Map<String, double> exchangeRates = {
    'USD': 1.0,
    'EUR': 0.85,
    'GBP': 0.73,
    'AUD': 1.34,
    'CAD': 1.25,
    'JPY': 110.0,
    'PKR': 280.0,
  };

  @override
  void initState() {
    super.initState();
    fetchExchangeRates();
  }

  void fetchExchangeRates() {
    setState(() {
      isLoading = true;
    });

    // Simulate delay to mimic API call (optional)
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  void convertCurrency() {
    if (exchangeRates.containsKey(targetCurrency) &&
        exchangeRates.containsKey(baseCurrency)) {
      double rate =
          exchangeRates[targetCurrency]! / exchangeRates[baseCurrency]!;
      setState(() {
        result = amount * rate;
      });
    } else {
      print(
          'Exchange rates not available for $baseCurrency or $targetCurrency');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(
              child: SpinKitDoubleBounce(
                color: Colors.blue,
                size: 50.0,
              ),
            )
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Currency Converter',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Amount',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.money_off),
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      setState(() {
                        amount = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  DropdownButtonFormField<String>(
                    value: baseCurrency,
                    onChanged: (value) {
                      setState(() {
                        baseCurrency = value!;
                        convertCurrency();
                      });
                    },
                    items: exchangeRates.keys
                        .toList()
                        .map<DropdownMenuItem<String>>((String currency) {
                      return DropdownMenuItem<String>(
                        value: currency,
                        child: Text(currency),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'Base Currency',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    '=',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  DropdownButtonFormField<String>(
                    value: targetCurrency,
                    onChanged: (value) {
                      setState(() {
                        targetCurrency = value!;
                        convertCurrency();
                      });
                    },
                    items: exchangeRates.keys
                        .toList()
                        .map<DropdownMenuItem<String>>((String currency) {
                      return DropdownMenuItem<String>(
                        value: currency,
                        child: Text(currency),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'Target Currency',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: convertCurrency,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    child: Text(
                      'Convert',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Result: ${result.toStringAsFixed(2)} $targetCurrency',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
    );
  }
}
