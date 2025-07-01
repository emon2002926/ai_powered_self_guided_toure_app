import 'package:ai_powered_self_guided_toure_app/widget/text/app_text.dart';
import 'package:flutter/material.dart';

import '../../util/sample_data/city_list.dart';
class LandmarkBrief extends StatefulWidget {
  const LandmarkBrief({super.key});

  @override
  State<LandmarkBrief> createState() => _LandmarkBriefState();
}

class _LandmarkBriefState extends State<LandmarkBrief> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < cities.length - 1) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: AppText(data: 'Brief',
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500

        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Fixed height image carousel
          imageCarousel(),
          SizedBox(height: 20,),
          pageIndicators(),

          progressBar(),

          SizedBox(height: 16,),
          controls(),

        ],
      ),
    );
  }


  Widget imageCarousel(){
    return SizedBox(
      height: 400,
      child: PageView.builder(
        controller: _pageController,
        itemCount: cities.length,
        onPageChanged: (index) => setState(() => _currentPage = index),
        itemBuilder: (context, index) {
          final city = cities[index];
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                city.imageUrl,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black87],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getTitle(city.name),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _getSubtitle(city.name),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );

  }

  Widget progressBar(){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: LinearProgressIndicator(
          value: (_currentPage + 1) / cities.length,
          minHeight: 8,
          backgroundColor: Colors.grey.shade300,
          color: Colors.green,
        ),
      ),
    );
  }



  Widget controls (){
   return Padding(
     padding: const EdgeInsets.only(bottom: 16, top: 8),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         IconButton(
           icon: const Icon(Icons.arrow_left, size: 32),
           onPressed: _previousPage,
         ),
         const CircleAvatar(
           radius: 24,
           backgroundColor: Colors.black,
           child: Icon(Icons.pause, color: Colors.white),
         ),
         IconButton(
           icon: const Icon(Icons.arrow_right, size: 32),
           onPressed: _nextPage,
         ),
       ],
     ),
   );

  }

  Widget pageIndicators (){
    return    Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(cities.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: _currentPage == index ? 20 : 8,
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.black : Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      );
  }

  String _getTitle(String name) {
    final parts = name.split(',');
    return parts.first.trim();
  }

  String _getSubtitle(String name) {
    final parts = name.split(',');
    return parts.length > 1 ? parts.sublist(1).join(',').trim() : '';
  }
}