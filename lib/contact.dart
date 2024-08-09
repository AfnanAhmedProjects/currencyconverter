import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  final List<Map<String, String>> developers = [
    {
      'name': 'John Doe',
      'contact': '+1-800-123-4567',
      'image': 'assets/john_doe.png', // Replace with your image asset path
      'linkedin':
          'https://www.linkedin.com/in/johndoe/', // LinkedIn profile URL
    },
    {
      'name': 'Jane Smith',
      'contact': '+1-800-987-6543',
      'image': 'assets/jane_smith.png', // Replace with your image asset path
      'linkedin':
          'https://www.linkedin.com/in/janesmith/', // LinkedIn profile URL
    },
    {
      'name': 'Mike Johnson',
      'contact': '+1-800-555-1212',
      'image': 'assets/mike_johnson.png', // Replace with your image asset path
      'linkedin':
          'https://www.linkedin.com/in/mikejohnson/', // LinkedIn profile URL
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Predictions'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.home_rounded),
            tooltip: 'Home',
            onPressed: () => Navigator.pushNamed(context, '/home'),
          ),
          IconButton(
            icon: const Icon(Icons.info_rounded),
            tooltip: 'About',
            onPressed: () => Navigator.pushNamed(context, '/about'),
          ),
          IconButton(
            icon: const Icon(Icons.email_rounded),
            tooltip: 'Contact',
            onPressed: () => Navigator.pushNamed(context, '/contact'),
          ),
          IconButton(
            icon: const Icon(Icons.analytics_rounded),
            tooltip: 'Predictions',
            onPressed: () => Navigator.pushNamed(context, '/predictions'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Get in Touch',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 20.0),
            Text(
              'We are here to help you with any questions or issues you may have. Our team of dedicated developers is ready to assist you. Below are the contact details for our team members:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 20.0),
            ...developers
                .map((developer) => _buildDeveloperCard(context, developer))
                .toList(),
            SizedBox(height: 20.0),
            // _buildSectionHeader('Contact Information'),
            SizedBox(height: 10.0),
            _buildContactDetail(
              context,
              Icons.email,
              'Email',
              'For any general inquiries, feel free to send us an email. We usually respond within 24 hours.',
              'support@currencyconverter.com',
            ),
            _buildContactDetail(
              context,
              Icons.phone,
              'Phone',
              'For immediate assistance, you can reach us on our customer support hotline.',
              '+1-800-123-4567',
            ),
            _buildContactDetail(
              context,
              Icons.location_on,
              'Address',
              'Visit us at our office for face-to-face consultations. We are open from Monday to Friday, 9 AM to 5 PM.',
              '123 Currency St, Karachi City, FC 12345',
            ),
            SizedBox(height: 20.0),
            // _buildSectionHeader('Additional Support'),
            SizedBox(height: 10.0),
            Text(
              'In addition to the above contact methods, you can also reach out to us through our social media channels. We are active on the following platforms:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSocialIcon(FontAwesomeIcons.facebook, 'Facebook'),
                _buildSocialIcon(FontAwesomeIcons.twitter, 'Twitter'),
                _buildSocialIcon(FontAwesomeIcons.linkedin, 'LinkedIn'),
                _buildSocialIcon(FontAwesomeIcons.instagram, 'Instagram'),
              ],
            ),
            SizedBox(height: 20.0),
                        ElevatedButton.icon(
              icon: Icon(Icons.chat),
              label: Text('Contact Us Now'),
              onPressed: _launchWhatsApp, // Call the method to launch WhatsApp link
            ),

          ],
        ),
      ),
    );
  }

  void _launchWhatsApp() async {
    const url = 'https://wa.link/bnode3';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  Widget _buildDeveloperCard(
      BuildContext context, Map<String, String> developer) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      elevation: 2.0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(developer['image']!),
          radius: 30.0,
        ),
        title: Text(
          developer['name']!,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        subtitle: Text(developer['contact']!),
        trailing: IconButton(
          icon: Icon(FontAwesomeIcons.linkedin),
          onPressed: () {
            // Handle LinkedIn link navigation
          },
          tooltip: 'LinkedIn',
        ),
      ),
    );
  }

  Widget _buildContactDetail(BuildContext context, IconData icon, String type,
      String description, String detail) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 24.0),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: 5.0),
                  Text(description),
                  SizedBox(height: 10.0),
                  Text(
                    detail,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
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

  // Widget _buildSectionHeader(String title) {
  //   return Text(
  //     title,
  //     style: Theme.of(context).textTheme.headlineSmall?.copyWith(
  //           fontWeight: FontWeight.bold,
  //           color: Theme.of(context).primaryColor,
  //         ),
  //   );
  // }

  Widget _buildSocialIcon(IconData icon, String tooltip) {
    return IconButton(
      icon: Icon(icon, size: 36.0),
      tooltip: tooltip,
      onPressed: () {
        // Handle social media link
      },
    );
  }
}
