import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(''),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 8, bottom: 15),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: GoogleFonts.inter(
                        fontSize: 42,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      "to our shop",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Colors.black,
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelColor: Colors.grey.withOpacity(0.5),
                      tabs: const [
                        Tab(
                          text: "Sneakers",
                        ),
                        Tab(
                          text: "Shoes",
                        ),
                        Tab(
                          text: "Collections",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.200,
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 12),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              itemCount: 6,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Colors.grey,
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width * 0.6,
                                  ),
                                );
                              }),
                        ),

                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12,20,12,20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Latest Sneakers",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "View all",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Icon(
                                        Ionicons.caret_forward_outline,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.13,
                          child: ListView.builder(
                              itemCount: 6,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(16)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black38,
                                          spreadRadius: 0.1,
                                          blurRadius: 0.8,
                                          offset: Offset(0, 1)
                                        )
                                      ]
                                    ),
                                    height: MediaQuery.of(context).size.height * 0.12,
                                    width: MediaQuery.of(context).size.width * 0.28,
                                    child: CachedNetworkImage(
                                      imageUrl: "https://static.nike.com/a/images/t_default/f8dfa191-60b3-44c1-b730-b25e0a908c35/air-force-1-07-easyon-shoes-LKXPhZ.png"
                                      ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
