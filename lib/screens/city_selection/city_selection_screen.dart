import 'package:flutter/material.dart';
import '../../repository/city_data/data/models/city_model.dart';
import 'widgets/city_card_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/city_card_widget.dart';

class CitySelectionScreen extends StatelessWidget {
  const CitySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CityModel> cities = [
      CityModel(name: "Dallas, Texas, USA", imageUrl: "assets/cities/texas.png"),
      CityModel(name: "San Antonio, Texas, USA", imageUrl: "assets/cities/texas1.png"),
      CityModel(name: "Houston, Texas, USA", imageUrl: "assets/cities/texas2.png"),
      CityModel(name: "Houston, Texas, USA", imageUrl: "assets/cities/texas3.png"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("City Selection"),
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        // backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose your city",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),

            // FIXED: wrap ListView in Expanded
            Expanded(
              child: ListView.separated(
                itemCount: cities.length,
                separatorBuilder: (_, __) => const SizedBox(height: 32),
                itemBuilder: (context, index) {
                  return CityCardWidget(
                    imageUrl: cities[index].imageUrl,
                    cityLabel: cities[index].name,
                    currentPage: 1,
                    totalPages: 4,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
