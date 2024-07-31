import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.pushNamed(context, '/home'),
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () => Navigator.pushNamed(context, '/about'),
          ),
          IconButton(
            icon: Icon(Icons.contact_mail),
            onPressed: () => Navigator.pushNamed(context, '/contact'),
          ),
          IconButton(
            icon: Icon(Icons.show_chart),
            onPressed: () => Navigator.pushNamed(context, '/predictions'),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Contact Us',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20.0),
            Text(
              'For any inquiries or support, please reach out to us at:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 20.0),
            _buildContactDetail(
              context,
              Icons.email,
              'Email',
              'support@currencyconverter.com',
            ),
            _buildContactDetail(
              context,
              Icons.phone,
              'Phone',
              '+1-800-123-4567',
            ),
            _buildContactDetail(
              context,
              Icons.location_on,
              'Address',
              '123 Currency St, Karachi City, FC 12345',
            ),
            SizedBox(height: 20.0),
            Text(
              'We are here to assist you with any questions or issues you may have. Feel free to reach out to us through any of the above contact details.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactDetail(BuildContext context, IconData icon, String type, String detail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 24.0),
          SizedBox(width: 16.0),
          Expanded(
            child: Text(
              '$type: $detail',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16.0,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
