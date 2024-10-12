import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[900], // AppBar color
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Global card radius
          ),
          elevation: 4, // Subtle shadow
          margin: const EdgeInsets.symmetric(vertical: 10.0),
        ),
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Container for User Information
              _buildUserInfoCard(),

              // Horizontal Cards for Offers, Cart, and Wishlist
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    _buildFeatureCard('Offers', Icons.percent, Colors.purple),
                    const SizedBox(width: 8),
                    _buildFeatureCard('Cart', Icons.shopping_cart, Colors.blue),
                    const SizedBox(width: 8),
                    _buildFeatureCard('Wishlist', Icons.favorite, Colors.red),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // General Section Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'General',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 120), // Spacing before menu cards

              // List of Menu Options using Custom Cards
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  children: [
                    _buildCustomMenuCard(Icons.home, 'Home'),
                    _buildCustomMenuCard(Icons.book, 'Courses'),
                    _buildCustomMenuCard(Icons.person, 'Profile'),
                    _buildCustomMenuCard(Icons.info, 'About CA219'),
                    _buildCustomMenuCard(Icons.help, 'FAQs'),
                    _buildCustomMenuCard(Icons.logout, 'Logout'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // User Information Card
  Widget _buildUserInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.greenAccent[400],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              'https://images.unsplash.com/photo-1580788404954-ae4e4bdc9061?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dG9tJTIwYW5kJTIwamVycnl8ZW58MHx8MHx8fDA%3D',
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 30),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: Tom and Jerry',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Role: Admin',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to build horizontal feature cards
  Widget _buildFeatureCard(String title, IconData icon, Color color) {
    return Card(
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.8), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 36),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16, //card icons size
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build custom menu cards
  Widget _buildCustomMenuCard(IconData icon, String title) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue[900], size: 28),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios,
                size: 18, color: Colors.grey), //icons arrowskoda
          ],
        ),
      ),
    );
  }
}
