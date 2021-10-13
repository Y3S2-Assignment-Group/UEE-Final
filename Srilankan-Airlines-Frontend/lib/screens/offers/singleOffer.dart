import 'package:flutter/material.dart';
import 'package:srilankan_airline/modules/BottomNavigation.dart';
import 'package:srilankan_airline/provider/offers_provider.dart';
import 'package:srilankan_airline/screens/offers/FoodAndBeverageList.dart';
import 'package:srilankan_airline/widgets/appbar.dart';
import 'package:provider/provider.dart';

class SingleOffer extends StatefulWidget {
  const SingleOffer({Key? key}) : super(key: key);

  @override
  _SingleOfferState createState() => _SingleOfferState();
}

class _SingleOfferState extends State<SingleOffer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(
        selIndex: 1,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              appbar(),
              Container(
                padding: EdgeInsets.only(top: 50, bottom: 10, right: 20),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/singleoffer');
                      },
                      child: Row(
                        children: [
                          Container(
                            child: Center(
                              child: Text(
                                context.read<OfferProvider>().getPercentages(),
                                style: TextStyle(
                                    color: Color(0xFF434343),
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            height: 75,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          Expanded(child: Container()),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "From",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                  context
                                      .read<OfferProvider>()
                                      .getDestination(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700))
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 175,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            context.read<OfferProvider>().getDestinationImg()),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "From",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            context.read<OfferProvider>().getDestination(),
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "To",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Colombo",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Discount",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "50%",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Other Benifits",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Discount on food & beverages",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                child: FoodAndBeverageList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
