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

  Map<String, Map<String, dynamic>> exchangeRates = {
    'USD': {'rate': 1.0, 'icon': Icons.attach_money},
    'EUR': {'rate': 0.85, 'icon': Icons.euro},
    'GBP': {'rate': 0.73, 'icon': Icons.currency_pound},
    'AUD': {'rate': 1.34, 'icon': Icons.currency_exchange},
    'CAD': {'rate': 1.25, 'icon': Icons.currency_exchange},
    'JPY': {'rate': 110.0, 'icon': Icons.currency_yen},
    'PKR': {'rate': 280.0, 'icon': Icons.currency_exchange},
    'INR': {'rate': 83.0, 'icon': Icons.currency_rupee},
    'CNY': {'rate': 7.05, 'icon': Icons.currency_yuan},
    'CHF': {'rate': 0.92, 'icon': Icons.currency_exchange},
    'NZD': {'rate': 1.40, 'icon': Icons.currency_exchange},
    'SGD': {'rate': 1.35, 'icon': Icons.currency_exchange},
    'HKD': {'rate': 7.85, 'icon': Icons.currency_exchange},
    'KRW': {'rate': 1320.0, 'icon': Icons.currency_exchange},
    'MXN': {'rate': 18.50, 'icon': Icons.currency_exchange},
    'BRL': {'rate': 5.35, 'icon': Icons.currency_exchange},
    'ZAR': {'rate': 19.50, 'icon': Icons.currency_exchange},
    'TRY': {'rate': 26.85, 'icon': Icons.currency_exchange},
    'RUB': {'rate': 94.50, 'icon': Icons.currency_exchange},
    'SEK': {'rate': 10.05, 'icon': Icons.currency_exchange},
    'NOK': {'rate': 10.95, 'icon': Icons.currency_exchange},
    'DKK': {'rate': 6.35, 'icon': Icons.currency_exchange},
    'ILS': {'rate': 3.45, 'icon': Icons.currency_exchange},
    'PLN': {'rate': 4.00, 'icon': Icons.currency_exchange},
    'HUF': {'rate': 380.0, 'icon': Icons.currency_exchange},
    'CZK': {'rate': 22.0, 'icon': Icons.currency_exchange},
    'THB': {'rate': 34.0, 'icon': Icons.currency_exchange},
    'MYR': {'rate': 4.60, 'icon': Icons.currency_exchange},
    'IDR': {'rate': 15000.0, 'icon': Icons.currency_exchange},
    'SAR': {'rate': 3.75, 'icon': Icons.currency_exchange},
    'AED': {'rate': 3.67, 'icon': Icons.currency_exchange},
    'KWD': {'rate': 0.31, 'icon': Icons.currency_exchange},
    'BHD': {'rate': 0.38, 'icon': Icons.currency_exchange},
    'OMR': {'rate': 0.39, 'icon': Icons.currency_exchange},
    'JOD': {'rate': 0.71, 'icon': Icons.currency_exchange},
    'LBP': {'rate': 1510.0, 'icon': Icons.currency_exchange},
    'DZD': {'rate': 135.0, 'icon': Icons.currency_exchange},
    'MAD': {'rate': 10.40, 'icon': Icons.currency_exchange},
    'TND': {'rate': 3.09, 'icon': Icons.currency_exchange},
    'MDL': {'rate': 18.75, 'icon': Icons.currency_exchange},
    'PEN': {'rate': 3.75, 'icon': Icons.currency_exchange},
    'GTQ': {'rate': 7.85, 'icon': Icons.currency_exchange},
    'COP': {'rate': 4250.0, 'icon': Icons.currency_exchange},
    'PAB': {'rate': 1.0, 'icon': Icons.currency_exchange},
    'NIO': {'rate': 36.0, 'icon': Icons.currency_exchange},
    'CRC': {'rate': 660.0, 'icon': Icons.currency_exchange},
    'PYG': {'rate': 7350.0, 'icon': Icons.currency_exchange},
    'UYU': {'rate': 39.5, 'icon': Icons.currency_exchange},
    'VEF': {'rate': 0.25, 'icon': Icons.currency_exchange},
    'BWP': {'rate': 12.45, 'icon': Icons.currency_exchange},
    'MZN': {'rate': 63.5, 'icon': Icons.currency_exchange},
    'NAD': {'rate': 19.50, 'icon': Icons.currency_exchange},
    'ETB': {'rate': 55.0, 'icon': Icons.currency_exchange},
    'RWF': {'rate': 1100.0, 'icon': Icons.currency_exchange},
    'UGX': {'rate': 3710.0, 'icon': Icons.currency_exchange},
    'TZS': {'rate': 2350.0, 'icon': Icons.currency_exchange},
    'MWK': {'rate': 850.0, 'icon': Icons.currency_exchange},
    'ZWL': {'rate': 0.01, 'icon': Icons.currency_exchange},
    'CUP': {'rate': 24.0, 'icon': Icons.currency_exchange},
    'CUC': {'rate': 1.0, 'icon': Icons.currency_exchange},
    'SYP': {'rate': 2500.0, 'icon': Icons.currency_exchange},
    'AFN': {'rate': 87.0, 'icon': Icons.currency_exchange},
    'TMT': {'rate': 3.5, 'icon': Icons.currency_exchange},
    'GHS': {'rate': 13.6, 'icon': Icons.currency_exchange},
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
      double rate = exchangeRates[targetCurrency]!['rate'] /
          exchangeRates[baseCurrency]!['rate'];
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
        title: Row(
          children: const [
            Icon(Icons.home_rounded),
            SizedBox(width: 10),
            Text('Home'),
          ],
        ),
        centerTitle: false,
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
                      prefixIcon: Icon(Icons.currency_exchange),
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
                    items: exchangeRates.keys.map((currency) {
                      return DropdownMenuItem(
                        value: currency,
                        child: Row(
                          children: <Widget>[
                            Icon(exchangeRates[currency]!['icon']),
                            SizedBox(width: 8.0),
                            Text(currency),
                          ],
                        ),
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
                  DropdownButtonFormField<String>(
                    value: targetCurrency,
                    onChanged: (value) {
                      setState(() {
                        targetCurrency = value!;
                        convertCurrency();
                      });
                    },
                    items: exchangeRates.keys.map((currency) {
                      return DropdownMenuItem(
                        value: currency,
                        child: Row(
                          children: <Widget>[
                            Icon(exchangeRates[currency]!['icon']),
                            SizedBox(width: 8.0),
                            Text(currency),
                          ],
                        ),
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
                  ElevatedButton.icon(
                    onPressed: showConversionDialog,
                    icon: Icon(Icons.calculate),
                    label: Text('Convert'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Colors.grey),
                      color: Colors.teal.shade50,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'Conversion Result:',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '$amount $baseCurrency = ${result.toStringAsFixed(2)} $targetCurrency',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
