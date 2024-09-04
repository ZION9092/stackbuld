import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CarouselSliderWidgetState createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int activeIndex = 0;

  final List<String> imageList = [
    'assets/images/bag1.jpg',
    'assets/images/bag2.jpg',
    'assets/images/bag4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(24))
          ),
          //color: Colors.green,
          width: double.infinity,
          //height: 250,
        
          child: CarouselSlider(
            options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
            items: imageList.map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  item,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: 100,
                ),
              ),
            )).toList(),
          ),
        ),
        const SizedBox(height: 16),
        buildIndicator(),
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: imageList.length,
    effect: const ExpandingDotsEffect(
      dotHeight: 8,
      dotWidth: 8,
      activeDotColor: Color.fromARGB(255, 1, 186, 243),
      dotColor: Colors.white
    ),
  );
}
