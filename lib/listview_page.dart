import 'package:flutter/material.dart';
import 'login_page.dart';

class ListviewPage extends StatelessWidget {
  const ListviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    var myItems = [
      {
        "img": "https://cdn-icons-png.flaticon.com/512/4320/4320337.png",
        "title": "BMI Chart"
      },
      {
        "img": "https://cdn-icons-png.flaticon.com/512/929/929426.png",
        "title": "Healthy Diet"
      },
      {
        "img": "https://cdn-icons-png.flaticon.com/512/2965/2965567.png",
        "title": "Workouts"
      },
      {
        "img": "https://cdn-icons-png.flaticon.com/512/3176/3176295.png",
        "title": "Hydration"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: myItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            elevation: 4,
            child: ListTile(
              leading: Image.network(
                myItems[index]['img']!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(
                myItems[index]['title']!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Clicked: ${myItems[index]['title']}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
