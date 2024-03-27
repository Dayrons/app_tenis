import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
class ItemBody extends StatelessWidget {
  ItemBody({Key ?key}) : super(key: key);
  final  faker =  Faker();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, bottom: 20),
      padding: const EdgeInsets.all( 10),
      width: double.infinity,
      // height: 80,
      decoration:  BoxDecoration(
        color: Colors.white ,
        borderRadius: BorderRadius.all(Radius.circular(10) ) ,
     
      ),
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(right: 10), 
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
                image: DecorationImage(image: NetworkImage(faker.image.image()), fit: BoxFit.cover)
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  "Dayrons Tovar",
                  style: TextStyle(
                    fontSize: 16.00,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Cancha bello monte",
                  style: TextStyle(
                    fontSize: 14.00,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),

        Container(
          child: const Text(
            "12:00 PM",
            style: TextStyle(
              fontSize: 16.00,
              fontWeight: FontWeight.bold,
            ),
          )
        )

      ])
    );
  }
}
      
          
