import 'package:flutter/material.dart';
import 'package:oresto/restaurant_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("oResto"),
        backgroundColor: Color(0xff003049),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurant = parseRestaurant(snapshot.data);
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Recommended Restaurant",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        "Several restaurants we recommend just for you.",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: restaurant.length,
                  itemBuilder: (context, index) {
                    return _restaurantCard(context, restaurant[index]);
                  },
                ),
              ],
            ),
          );
        }
      )
    );
  }

  Widget _restaurantCard(BuildContext context, Restaurant restaurant) {
    return InkWell(
      onTap: () {
        // print(restaurant.foods);
        Navigator.pushNamed(context, '/detailPage', arguments: restaurant);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffF5F6F8),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Color(0xff121212).withOpacity(0.25),
              offset: Offset(4.0, 4.0),
              blurRadius: 4.0
            )
          ]
        ),
        margin: EdgeInsets.only(
          left: 16.0,
          bottom: 8.0,
          right: 16.0
        ),
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Hero(
              tag: restaurant.pictureId,
              child: Image.network(
                restaurant.pictureId,
                width: 160,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16.0,
                      ),
                      SizedBox(width: 2.0),
                      Text(
                        restaurant.city,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 14.0,
                      ),
                      SizedBox(width: 2.0),
                      Text(
                        restaurant.rating.toString(),
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
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