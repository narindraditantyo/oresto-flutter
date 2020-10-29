import 'package:flutter/material.dart';
import 'package:oresto/data/api/api_service.dart';
import 'package:oresto/data/model/restaurant_detail.dart';

class DetailPage extends StatefulWidget {
  final String restoId;

  const DetailPage({ @required this.restoId });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Future<RestaurantDetail> _restoDetail;

  @override
  void initState() {
    _restoDetail = ApiServices().getRestaurantDetail(widget.restoId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _restoDetail,
        builder: (context, AsyncSnapshot<RestaurantDetail> snapshot) {
          var state = snapshot.connectionState;

          if(state != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if(snapshot.hasData) {
              return NestedScrollView(
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
                              tag: snapshot.data.restaurant.pictureId,
                              child: Image.network(
                                "https://restaurant-api.dicoding.dev/images/medium/${snapshot.data.restaurant.pictureId}",
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
                          snapshot.data.restaurant.name
                        ),
                        centerTitle: true,
                      ),
                    )
                  ];
                },
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 16.0,
                          left: 16.0,
                          right: 16.0
                        ),
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
                                  snapshot.data.restaurant.city,
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
                              snapshot.data.restaurant.description,
                              style: Theme.of(context).textTheme.bodyText2,
                              textAlign: TextAlign.justify
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Foods",
                          style: Theme.of(context).textTheme.headline6
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        height: 40.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: snapshot.data.restaurant.menus.foods.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: index == 0 ? EdgeInsets.symmetric(horizontal: 16.0) : EdgeInsets.only(right: 16.0),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xffFCBF49),
                                borderRadius: BorderRadius.circular(8.0)
                              ),
                              child: Text(
                                snapshot.data.restaurant.menus.foods[index].name,
                                style: Theme.of(context).textTheme.bodyText1
                              ),
                            );
                          }
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Drinks",
                          style: Theme.of(context).textTheme.headline6
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        height: 40.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: snapshot.data.restaurant.menus.drinks.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: index == 0 ? EdgeInsets.symmetric(horizontal: 16.0) : EdgeInsets.only(right: 16.0),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xffEAE2B7),
                                borderRadius: BorderRadius.circular(8.0)
                              ),
                              child: Text(
                                snapshot.data.restaurant.menus.drinks[index].name,
                                style: Theme.of(context).textTheme.bodyText1
                              ),
                            );
                          }
                        ),
                      )
                    ],
                  ),
                )
              );
            } else {
              return Center(
                child: Text(
                  "Restaurant detail not available. Try again later.",
                  style: Theme.of(context).textTheme.bodyText1
                ),
              );
            }
          }
        }
      )
    );
  }
}