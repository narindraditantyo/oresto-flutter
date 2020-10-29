import 'package:flutter/material.dart';
import 'package:oresto/data/api/api_service.dart';
import 'package:oresto/data/model/restaurant_list.dart';
import 'package:oresto/widgets/resto_list_card.dart';

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
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Color(0xffF5F6F8),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/searchPage');
            }
          )
        ],
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
                        return RestaurantCard(restoData: restoData);
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
}