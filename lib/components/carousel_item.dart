import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  // final String title;
  final ImageProvider imageProvider;

  const CarouselItem({Key? key, required this.imageProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFCCCCCC),
              blurRadius: 8.0,
              spreadRadius: 2.5,
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: imageProvider,
          ),
        ),
      ),
    );
  }
}
