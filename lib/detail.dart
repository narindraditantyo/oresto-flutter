import 'package:flutter/material.dart';
import 'package:oresto/restaurant_data.dart';

class RestaurantDetail extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantDetail({ @required this.restaurant });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }
              ),
              backgroundColor: Color(0xff003049),
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Hero(
                      tag: restaurant.pictureId,
                      child: Image.network(
                        restaurant.pictureId,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff121212), Color(0xff121212).withOpacity(0.1)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          
                        ),
                      ),
                    ),
                  ],
                ),
                title: Text(
                  restaurant.name
                ),
                centerTitle: true,
              ),
            )
          ];
        },
        body: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
              SizedBox(height: 16.0),
              Text(
                "Descriptions",
                style: Theme.of(context).textTheme.headline6
              ),
              SizedBox(height: 4.0),
              Text(
                restaurant.desc,
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.justify
              ),
            ],
          ),
        )
      ),
    );
  }
}