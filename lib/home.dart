import 'package:flutter/material.dart';
import 'package:oresto/restaurant_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("oResto"),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurant = parseRestaurant(snapshot.data);
          return ListView.builder(
            itemCount: restaurant.length,
            itemBuilder: (context, index) {
              return _restaurantCard(context, restaurant[index], restaurant.length, index);
            }
          );
        }
      )
    );
  }

  Widget _restaurantCard(BuildContext context, Restaurant restaurant, int length, int currentIndex) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(8.0)
        ),
        margin: EdgeInsets.only(
          left: 16.0,
          bottom: 8.0,
          right: 16.0
        ),
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              restaurant.pictureId,
              width: 160,
              height: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    restaurant.name
                  ),
                  Text(
                    restaurant.city
                  ),
                  Text(
                    restaurant.rating.toString()
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}