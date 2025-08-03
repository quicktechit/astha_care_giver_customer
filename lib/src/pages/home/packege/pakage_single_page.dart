import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text/kText.dart';

class PakegeSinglePage extends StatefulWidget {
  final String price;
  const PakegeSinglePage({super.key, required this.price});

  @override
  State<PakegeSinglePage> createState() => _PakegeSinglePageState();
}

class _PakegeSinglePageState extends State<PakegeSinglePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.blue, Colors.black12],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                "Packages",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: Column(
                children: [
                  Center(
                      child: Text(
                        "Choose Your Plan !",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 600,
                      child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 300,
                                height: 400,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.purpleAccent,
                                      // Shadow color
                                      offset: Offset(-2, -2),
                                      // Shadow position (top left)
                                      blurRadius: 2,
                                      // Shadow blur radius
                                      spreadRadius: 1, // Shadow spread radius
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(
                                      12), // Optional: Rounded corners
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: KText(
                                        text: 'Car package',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.purpleAccent,
                                      ),
                                    ),
                                    Divider(
                                        color:  Colors.purpleAccent),
                                    SizedBox(
                                      height: 10,
                                    ),

                                    Center(child: Image.asset('assets/images/car3.png',height: 150,fit: BoxFit.cover,)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'BDT',
                                          style: TextStyle(
                                              color:
                                                   Colors.purpleAccent,
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold),
                                          // style: h1.copyWith(
                                          //     color: index == 0
                                          //         ? Colors.blue
                                          //         : index == 1
                                          //         ? Colors.greenAccent
                                          //         : Colors.purpleAccent),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '5000',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 40),
                                          // style: titleStyle.copyWith(
                                          //     color: Colors.white,
                                          //     fontSize: 44),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color:  Colors.purpleAccent,
                                              shape: BoxShape.circle),
                                          padding: EdgeInsets.all(2),
                                          child: Icon(
                                            Icons.done,
                                            size: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                            child: Text(
                                              'Contrary to popular belief, Lorem Ipsum is not ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 17),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color:Colors.purpleAccent,
                                              shape: BoxShape.circle),
                                          padding: EdgeInsets.all(2),
                                          child: Icon(
                                            Icons.done,
                                            size: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                            child: Text(
                                              'Contrary to popular belief, Lorem Ipsum is not ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 17),
                                              // style:
                                              //     h4.copyWith(color: Colors.white),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color:  Colors.purpleAccent,
                                              shape: BoxShape.circle),
                                          padding: EdgeInsets.all(2),
                                          child: Icon(
                                            Icons.done,
                                            size: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                            child: Text(
                                              'Contrary to popular belief, Lorem Ipsum is not ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 17),
                                              // style:
                                              //     h4.copyWith(color: Colors.white),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color:  Colors.purpleAccent,
                                              shape: BoxShape.circle),
                                          padding: EdgeInsets.all(2),
                                          child: Icon(
                                            Icons.done,
                                            size: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                            child: Text(
                                              'Contrary to popular belief, Lorem Ipsum is not ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 17),
                                              // style:
                                              //     h4.copyWith(color: Colors.white),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Container(
                                        height: 40,
                                        width: 250,
                                        decoration: BoxDecoration(
                                          color:  Colors.purpleAccent,
                                          borderRadius:
                                          BorderRadius.circular(12),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Purchase',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                            // style: h2.copyWith(
                                            //     color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )

                  ),
                ],
              ),
            )),
      ),
    );
  }
}
