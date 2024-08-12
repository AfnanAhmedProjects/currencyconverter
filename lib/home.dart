import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    'INR': 83.0,
    'CNY': 7.05,
    'CHF': 0.92,
    'NZD': 1.40,
    'SGD': 1.35,
    'HKD': 7.85,
    'KRW': 1320.0,
    'MXN': 18.50,
    'BRL': 5.35,
    'ZAR': 19.50,
    'TRY': 26.85,
    'RUB': 94.50,
    'SEK': 10.05,
    'NOK': 10.95,
    'DKK': 6.35,
    'ILS': 3.45,
    'PLN': 4.00,
    'HUF': 380.0,
    'CZK': 22.0,
    'THB': 34.0,
    'MYR': 4.60,
    'IDR': 15000.0,
    'SAR': 3.75,
    'AED': 3.67,
    'KWD': 0.31,
    'BHD': 0.38,
    'OMR': 0.39,
    'JOD': 0.71,
    'LBP': 1510.0,
    'DZD': 135.0,
    'MAD': 10.40,
    'TND': 3.09,
    'MDL': 18.75,
    'PEN': 3.75,
    'GTQ': 7.85,
    'COP': 4250.0,
    'PAB': 1.0,
    'NIO': 36.0,
    'CRC': 660.0,
    'PYG': 7350.0,
    'UYU': 39.5,
    'VEF': 0.25,
    'BWP': 12.45,
    'MZN': 63.5,
    'NAD': 19.50,
    'ETB': 55.0,
    'RWF': 1100.0,
    'UGX': 3710.0,
    'TZS': 2350.0,
    'KWD': 0.31,
    'MWK': 850.0,
    'ZWL': 0.01,
    'CUP': 24.0,
    'CUC': 1.0,
    'SYP': 2500.0,
    'AFN': 87.0,
    'TMT': 3.5,
    'GHS': 13.6,
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

  void showConversionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Conversion Result'),
          content: Text(
            '$amount $baseCurrency = ${result.toStringAsFixed(2)} $targetCurrency',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.home_rounded),
            tooltip: 'Home', // Tooltip for Home
            onPressed: () => Navigator.pushNamed(context, '/home'),
          ),
          IconButton(
            icon: const Icon(Icons.info_rounded),
            tooltip: 'About', // Tooltip for About
            onPressed: () => Navigator.pushNamed(context, '/about'),
          ),
          IconButton(
            icon: const Icon(Icons.email_rounded),
            tooltip: 'Contact', // Tooltip for Contact
            onPressed: () => Navigator.pushNamed(context, '/contact'),
          ),
          IconButton(
            icon: const Icon(Icons.analytics_rounded),
            tooltip: 'Predictions', // Tooltip for Predictions
            onPressed: () => Navigator.pushNamed(context, '/predictions'),
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: SpinKitDoubleBounce(
                color: Colors.teal,
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
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Amount',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      prefixIcon: Icon(Icons.monetization_on),
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      setState(() {
                        amount = double.tryParse(value) ?? 0.0;
                        convertCurrency();
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    '=',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                        ),
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      convertCurrency();
                      showConversionDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text('Convert',
                        style: Theme.of(context).textTheme.labelLarge),
                  ),
                ],
              ),
            ),
    );
  }
}
