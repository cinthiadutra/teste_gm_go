import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
  

    return Drawer(
      backgroundColor: Colors.grey[100],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
            gradient: LinearGradient(
              //colors: [Colors.red.shade600, Colors.pink.shade600],
              colors: [Colors.deepOrange.shade500, Colors.red.shade600],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'go fidelidade',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'acumule selinhos e troque por reservas grátis, vale em todos os motéis e horários!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          _buildMenuItem(Icons.login, 'login', () {
                  Navigator.pop(context); // Fechar o Drawer
                }),
                _buildMenuItem(Icons.help_outline, 'ajuda', () {
                  Navigator.pop(context); // Fechar o Drawer
                }),
                _buildMenuItem(Icons.settings, 'configurações', () {
                  Navigator.pop(context); // Fechar o Drawer
                }),
                _buildMenuItem(Icons.report_problem, 'comunicar problema', () {
                  Navigator.pop(context); // Fechar o Drawer
                }),
                _buildMenuItem(Icons.hotel, 'motel', () {
                  Navigator.pop(context); // Fechar o Drawer
                }),
        ],
      ),
    );
  }
}
