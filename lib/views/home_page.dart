import 'package:flutter/material.dart';
import 'package:oresto/data/api/api_service.dart';
import 'package:oresto/data/model/restaurant_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<RestaurantList> _restoList;

  @override
  void initState() {
    _restoList = ApiServices().getRestaurantList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("oResto"),
        backgroundColor: Color(0xff003049),
      ),
      body: FutureBuilder(
        future: _restoList,
        builder: (context, AsyncSnapshot<RestaurantList> snapshot) {
          var state = snapshot.connectionState;

          if(state != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator()
            );
          } else {
            if(snapshot.hasData) {
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
                      itemCount: snapshot.data.restaurants.length,
                      itemBuilder: (context, index) {
                        var restoData = snapshot.data.restaurants[index];
                        return _restaurantCard(context, restoData);
                      },
                    ),
                  ],
                ),
              );
            } else if(snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  style: Theme.of(context).textTheme.bodyText1
                ),
              );
            } else {
              return Center(
                child: Text(
                  "No restaurant available",
                  style: Theme.of(context).textTheme.bodyText1
                ),
              );
            }
          }
        }
      )
    );
  }

  Widget _restaurantCard(BuildContext context, Restaurant restaurant) {
    return InkWell(
      onTap: () {
        // print(restaurant.foods);
        Navigator.pushNamed(context, '/detailPage', arguments: restaurant.id);
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