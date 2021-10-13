import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:srilankan_airline/model/offer_model.dart';
import 'package:srilankan_airline/provider/offers_provider.dart';
import 'package:provider/provider.dart';

class Offerlist extends StatefulWidget {
  const Offerlist({Key? key}) : super(key: key);

  @override
  _OfferlistState createState() => _OfferlistState();
}

class _OfferlistState extends State<Offerlist> {
  late Future<List<Offer>> offers;

  @override
  void initState() {
    super.initState();
    offers = context.read<OfferProvider>().getOfferList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<List<Offer>>(
        future: offers,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SizedBox(
                height: size.height,
                child: Center(
                  child: Lottie.asset('assets/images/appbarlottie.json',
                      repeat: true, width: 80),
                ));
          } else {
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(top: 50, bottom: 10, right: 20),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            context
                                .read<OfferProvider>()
                                .setSingleOfferId(snapshot.data![index].id);
                            context.read<OfferProvider>().setDestination(
                                snapshot.data![index].destination);
                            context.read<OfferProvider>().setDestinationImg(
                                snapshot.data![index].destinationImg);
                            context.read<OfferProvider>().setPercentages(
                                snapshot.data![index].percentages);
                            context.read<OfferProvider>().setFlightRefFlight(
                                snapshot.data![index].flightRefFlight);
                            context.read<OfferProvider>().setTicketPrice(
                                snapshot.data![index].ticketPrice);
                            Navigator.pushNamed(context, '/singleoffer');
                          },
                          child: Row(
                            children: [
                              Container(
                                child: Center(
                                  child: Text(
                                    snapshot.data![index].percentages,
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
                                  Text(snapshot.data![index].destination,
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
                                snapshot.data![index].destinationImg),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                  );
                });
          }
        },
      ),
    );
  }
}
