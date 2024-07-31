import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
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
              'About App & Currencies',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20.0),
            Text(
              'This Currency Converter app provides real-time conversion between various currencies. Below are the details of the currencies supported by this app:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView(
                children: [
                  _buildCurrencyDetail(
                    context,
                    'USD',
                    'United States Dollar',
                    'The USD is the world\'s primary reserve currency and is widely used in international transactions.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'EUR',
                    'Euro',
                    'The EUR is the official currency of the Eurozone and is used by 19 of the 27 European Union member states.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'GBP',
                    'British Pound Sterling',
                    'The GBP is the currency of the United Kingdom and is known for its stability and historical significance.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'AUD',
                    'Australian Dollar',
                    'The AUD is the currency of Australia and is widely traded in global financial markets.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'CAD',
                    'Canadian Dollar',
                    'The CAD is the currency of Canada, known for its commodity-driven economy, particularly in oil and minerals.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'JPY',
                    'Japanese Yen',
                    'The JPY is the currency of Japan and is one of the most traded currencies in the world.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'PKR',
                    'Pakistani Rupee',
                    'The PKR is the currency of Pakistan and is used in domestic transactions across the country.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'INR',
                    'Indian Rupee',
                    'The INR is the currency of India, reflecting the country\'s diverse and growing economy.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'CNY',
                    'Chinese Yuan',
                    'The CNY is the currency of China and is increasingly used in global trade and finance.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'CHF',
                    'Swiss Franc',
                    'The CHF is the currency of Switzerland, known for its stability and as a safe-haven currency.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'NZD',
                    'New Zealand Dollar',
                    'The NZD is the currency of New Zealand and is heavily influenced by the country\'s commodity exports.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'SGD',
                    'Singapore Dollar',
                    'The SGD is the currency of Singapore, a global financial hub and trading center.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'HKD',
                    'Hong Kong Dollar',
                    'The HKD is the currency of Hong Kong and is known for its stability and use in international trade.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'KRW',
                    'South Korean Won',
                    'The KRW is the currency of South Korea, an advanced economy with a strong technology sector.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'MXN',
                    'Mexican Peso',
                    'The MXN is the currency of Mexico, and it is one of the most traded emerging market currencies.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'BRL',
                    'Brazilian Real',
                    'The BRL is the currency of Brazil, which has a large and diverse economy in South America.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'ZAR',
                    'South African Rand',
                    'The ZAR is the currency of South Africa, and it is the most traded currency in Africa.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'TRY',
                    'Turkish Lira',
                    'The TRY is the currency of Turkey and reflects the country\'s dynamic and growing economy.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'RUB',
                    'Russian Ruble',
                    'The RUB is the currency of Russia and is influenced by the country\'s energy exports.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'SEK',
                    'Swedish Krona',
                    'The SEK is the currency of Sweden, known for its strong economy and high quality of life.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'NOK',
                    'Norwegian Krone',
                    'The NOK is the currency of Norway and is influenced by the country\'s oil and gas resources.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'DKK',
                    'Danish Krone',
                    'The DKK is the currency of Denmark and is known for its stability and economic strength.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'ILS',
                    'Israeli New Shekel',
                    'The ILS is the currency of Israel and reflects the country\'s vibrant technology sector.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'PLN',
                    'Polish Zloty',
                    'The PLN is the currency of Poland and is influenced by the country\'s growing economy and EU membership.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'HUF',
                    'Hungarian Forint',
                    'The HUF is the currency of Hungary and is used in the Central European region.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'CZK',
                    'Czech Koruna',
                    'The CZK is the currency of the Czech Republic and reflects the country\'s stable economy.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'THB',
                    'Thai Baht',
                    'The THB is the currency of Thailand and is a significant currency in Southeast Asia.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'MYR',
                    'Malaysian Ringgit',
                    'The MYR is the currency of Malaysia and is influenced by the country\'s oil and palm oil exports.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'IDR',
                    'Indonesian Rupiah',
                    'The IDR is the currency of Indonesia and is used across the Southeast Asian archipelago.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'SAR',
                    'Saudi Riyal',
                    'The SAR is the currency of Saudi Arabia, a major player in global oil markets.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'AED',
                    'United Arab Emirates Dirham',
                    'The AED is the currency of the UAE and reflects the country\'s strong financial sector and tourism industry.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'KWD',
                    'Kuwaiti Dinar',
                    'The KWD is the currency of Kuwait and is known for its high value relative to other currencies.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'BHD',
                    'Bahraini Dinar',
                    'The BHD is the currency of Bahrain and is used in a country with a growing financial sector.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'OMR',
                    'Omani Rial',
                    'The OMR is the currency of Oman, a country known for its oil exports and economic stability.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'JOD',
                    'Jordanian Dinar',
                    'The JOD is the currency of Jordan and is used in a region with a diverse economic landscape.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'LBP',
                    'Lebanese Pound',
                    'The LBP is the currency of Lebanon and is influenced by the country\'s complex economic conditions.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'DZD',
                    'Algerian Dinar',
                    'The DZD is the currency of Algeria, which has a significant energy sector impacting its currency.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'MAD',
                    'Moroccan Dirham',
                    'The MAD is the currency of Morocco and is used in a country with a diverse economy and tourism sector.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'TND',
                    'Tunisian Dinar',
                    'The TND is the currency of Tunisia, reflecting the country\'s economic activities and tourism.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'MDL',
                    'Moldovan Leu',
                    'The MDL is the currency of Moldova and is used in a country with a growing economy in Eastern Europe.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'PEN',
                    'Peruvian Nuevo Sol',
                    'The PEN is the currency of Peru and is influenced by the country\'s mining and agriculture sectors.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'GTQ',
                    'Guatemalan Quetzal',
                    'The GTQ is the currency of Guatemala and reflects the country\'s economic and trade conditions.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'COP',
                    'Colombian Peso',
                    'The COP is the currency of Colombia, known for its coffee and oil exports.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'PAB',
                    'Panamanian Balboa',
                    'The PAB is the currency of Panama, which uses the USD for many transactions alongside the Balboa.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'NIO',
                    'Nicaraguan Córdoba',
                    'The NIO is the currency of Nicaragua, used in a country with a diverse economy and tourism sector.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'CRC',
                    'Costa Rican Colón',
                    'The CRC is the currency of Costa Rica, known for its eco-tourism and growing economy.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'PYG',
                    'Paraguayan Guarani',
                    'The PYG is the currency of Paraguay and is influenced by the country\'s agricultural sector.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'UYU',
                    'Uruguayan Peso',
                    'The UYU is the currency of Uruguay, reflecting the country\'s stable economy and high standard of living.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'VEF',
                    'Venezuelan Bolívar',
                    'The VEF is the currency of Venezuela, which has experienced significant economic challenges in recent years.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'BWP',
                    'Botswana Pula',
                    'The BWP is the currency of Botswana, known for its stability and diamond mining industry.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'MZN',
                    'Mozambican Metical',
                    'The MZN is the currency of Mozambique, a country with a growing economy and significant natural resources.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'NAD',
                    'Namibian Dollar',
                    'The NAD is the currency of Namibia, and it is pegged to the South African Rand.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'ETB',
                    'Ethiopian Birr',
                    'The ETB is the currency of Ethiopia, a country with a rapidly developing economy and diverse culture.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'RWF',
                    'Rwandan Franc',
                    'The RWF is the currency of Rwanda, known for its progress in economic development and conservation efforts.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'UGX',
                    'Ugandan Shilling',
                    'The UGX is the currency of Uganda, reflecting the country\'s agricultural and economic activities.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'TZS',
                    'Tanzanian Shilling',
                    'The TZS is the currency of Tanzania, a country with a growing tourism industry and agricultural base.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'MWK',
                    'Malawian Kwacha',
                    'The MWK is the currency of Malawi, known for its agriculture and efforts towards economic growth.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'ZWL',
                    'Zimbabwean Dollar',
                    'The ZWL is the currency of Zimbabwe, which has experienced significant economic fluctuations and challenges.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'CUP',
                    'Cuban Peso',
                    'The CUP is the currency of Cuba, used alongside the CUC for domestic transactions and reflecting the country\'s economy.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'CUC',
                    'Cuban Convertible Peso',
                    'The CUC is used in Cuba for transactions by foreigners and reflects the country\'s dual-currency system.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'SYP',
                    'Syrian Pound',
                    'The SYP is the currency of Syria, reflecting the country\'s economic situation amidst ongoing challenges.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'AFN',
                    'Afghan Afghani',
                    'The AFN is the currency of Afghanistan, used in a country with significant economic and developmental challenges.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'TMT',
                    'Turkmenistani Manat',
                    'The TMT is the currency of Turkmenistan, influenced by the country\'s energy resources and economy.'
                  ),
                  _buildCurrencyDetail(
                    context,
                    'GHS',
                    'Ghanaian Cedi',
                    'The GHS is the currency of Ghana, reflecting the country\'s growing economy and efforts in various sectors.'
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencyDetail(BuildContext context, String code, String name, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$code - $name',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 4.0),
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 14.0,
                ),
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
