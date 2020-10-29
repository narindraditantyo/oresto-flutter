import 'package:flutter/material.dart';
import 'package:oresto/data/model/restaurant_list.dart';

class RestaurantCard extends StatefulWidget {
  final RestaurantListInfo restoData;

  const RestaurantCard({ Key key, @required this.restoData }) : super(key: key);

  @override
  _RestaurantCardState createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/detailPage', arguments: widget.restoData.id);
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
              tag: widget.restoData.pictureId,
              child: Image.network(
                "https://restaurant-api.dicoding.dev/images/small/${widget.restoData.pictureId}",
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
                    widget.restoData.name,
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
                        widget.restoData.city,
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
                        widget.restoData.rating.toString(),
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