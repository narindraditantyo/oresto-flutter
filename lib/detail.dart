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
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Image.network(
                      restaurant.pictureId,
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff121212), Color(0xff121212).withOpacity(0.1)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter
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
          child: Column(
            children: [
              Text(
                restaurant.city
              ),
              Text(
                restaurant.desc
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