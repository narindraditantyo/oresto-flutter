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
                onPressed: () {}
              ),
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  restaurant.pictureId,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  restaurant.name
                ),
                titlePadding: EdgeInsets.only(
                  left: 16.0,
                  bottom: 16.0
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                restaurant.name
              ),
              Text(
                restaurant.city
              ),
              Expanded(
                child: Text(
                  restaurant.desc
                )
              ),
              Text(
                "Foods"
              ),
              Text(
                "Drinks"
              )
            ],
          ),
        )
      ),
    );
  }
}