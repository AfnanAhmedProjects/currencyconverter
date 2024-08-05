import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PredictionsPage extends StatelessWidget {
  final Map<String, List<FlSpot>> currencyPredictions = const {
    'USD': [FlSpot(0, 1.0), FlSpot(1, 1.1), FlSpot(2, 1.2), FlSpot(3, 1.15)],
    'EUR': [FlSpot(0, 0.85), FlSpot(1, 0.86), FlSpot(2, 0.87), FlSpot(3, 0.86)],
    'GBP': [FlSpot(0, 0.73), FlSpot(1, 0.75), FlSpot(2, 0.74), FlSpot(3, 0.72)],
    'AUD': [FlSpot(0, 1.34), FlSpot(1, 1.32), FlSpot(2, 1.35), FlSpot(3, 1.33)],
    'CAD': [FlSpot(0, 1.25), FlSpot(1, 1.22), FlSpot(2, 1.24), FlSpot(3, 1.23)],
    'JPY': [
      FlSpot(0, 110.0),
      FlSpot(1, 112.0),
      FlSpot(2, 111.5),
      FlSpot(3, 110.5)
    ],
    'PKR': [
      FlSpot(0, 280.0),
      FlSpot(1, 275.0),
      FlSpot(2, 278.0),
      FlSpot(3, 277.0)
    ],
    'INR': [FlSpot(0, 83.0), FlSpot(1, 82.5), FlSpot(2, 84.0), FlSpot(3, 83.5)],
    'CNY': [FlSpot(0, 7.05), FlSpot(1, 7.10), FlSpot(2, 7.00), FlSpot(3, 7.08)],
    'CHF': [FlSpot(0, 0.92), FlSpot(1, 0.93), FlSpot(2, 0.91), FlSpot(3, 0.92)],
    // Add more predictions as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Predictions'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text(
              'Latest Currency Predictions',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20.0),
            ...currencyPredictions.entries
                .map(
                  (entry) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.key,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          height: 300.0,
                          child: LineChart(
                            LineChartData(
                              gridData: FlGridData(show: false),
                              titlesData: FlTitlesData(show: true),
                              borderData: FlBorderData(show: true),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: entry.value,
                                  isCurved: true,
                                  color: Colors.amber, // Use List<Color> here
                                  dotData: FlDotData(show: false),
                                  belowBarData: BarAreaData(show: false),
                                ),
                              ],
                              lineTouchData: LineTouchData(
                                touchTooltipData: LineTouchTooltipData(
                                  tooltipBorder: BorderSide(
                                    color: Colors.teal,
                                    width: 1,
                                  ),
                                ),
                                touchCallback: (FlTouchEvent event,
                                    LineTouchResponse? response) {
                                  // Handle touch events here if needed
                                },
                                handleBuiltInTouches: true,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
