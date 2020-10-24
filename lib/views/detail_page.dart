import 'package:flutter/material.dart';
import 'package:oresto/data/api/api_service.dart';
import 'package:oresto/data/model/restaurant_detail.dart';
import 'package:oresto/data/model/restaurant_list.dart';

class DetailPage extends StatefulWidget {
  final RestaurantList restoData;

  const DetailPage({ @required this.restoData });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Future<RestaurantDetail> _restoDetail;

  @override
  void initState() {
    _restoDetail = ApiServices().getRestaurantDetail(restoData.id);
    super.initState();
  }

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
                      tag: widget.restaurant.pictureId,
                      child: Image.network(
                        widget.restaurant.pictureId,
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
                  widget.restaurant.name
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
                    widget.restaurant.city,
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
                widget.restaurant.desc,
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