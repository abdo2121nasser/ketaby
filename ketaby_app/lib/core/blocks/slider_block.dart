import 'dart:async';


import 'package:flutter/material.dart';

import '../cubits/prodect_cubit/product_cubit.dart';

class SliderBlock extends StatefulWidget {
  @override
  _SliderBlockState createState() => _SliderBlockState();
}

class _SliderBlockState extends State<SliderBlock> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < ProductCubit.get(context)!.sliderModel!.data!.sliders!.length - 1) {
        // If not at the last slide, increment current page and animate to it with a slower duration
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(seconds: 2), // Increase duration for slower movement
          curve: Curves.bounceInOut,
        );
      } else {
        // If at the last slide, scroll to the first slide without animation
        _currentPage = 0;
        _pageController.jumpToPage(_currentPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: SizedBox(
        height: 190,
        child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          controller: _pageController,
          itemCount: ProductCubit.get(context)!.sliderModel!.data!.sliders!.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: 300,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  ProductCubit.get(context)!.sliderModel!.data!.sliders![index]!.image!,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress != null) {
                      // While the image is loading, show a CircularProgressIndicator
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );
                    } else {
                      // Once the image is loaded, show the image
                      return child;
                    }
                  },
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
