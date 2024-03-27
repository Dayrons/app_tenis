import 'package:app_tenis/pages/home_page/widgets/item_body.dart';
import 'package:flutter/material.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: size.width,
        height: (size.height * 80) / 100,
        decoration:  BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      
              child: ListView(
                scrollDirection: Axis.vertical,
                children:  [
                  ItemBody(),
                  ItemBody(),
                  ItemBody(),
                  ItemBody(),
                  ItemBody(),
                  ItemBody(),
                  ItemBody(),
                  ItemBody(),
                  ItemBody(),
                  ItemBody(),
                  ItemBody(),
                  ItemBody(),
                  ItemBody(),
                  ItemBody(),
                ],
              ),
            ),
      ),
    );
  }
}
