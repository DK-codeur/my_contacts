import 'package:flutter/material.dart';
import 'package:my_contacts/screens/contact_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../models/user.dart';
import '../providers/data_provider.dart';
import '../utils/methods.dart';
import '../utils/my_colors.dart';
import '../widgets/contact_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<void> _refresh(BuildContext context) async {
    await Provider.of<DataProvider>(context, listen: false).fetchAndSetUsers();
  }

  Shimmer buildShimmer(double w, double h) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        color: Colors.grey,
        width: w,
        height: h,
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xFF240b36),
                    Color(0xFFc31432),
                  ]
                )
              ),
              child: Column(
                children: [
                  const SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        iconSize: 18,
                        padding: const EdgeInsets.all(1),
                        icon: const CircleAvatar(
                          backgroundColor: Colors.black38,
                          child: Icon(
                            Icons.sort,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () => Methods.customToast("soon")
                      ),

                      IconButton(
                        iconSize: 18,
                        padding: const EdgeInsets.all(1),
                        icon: const CircleAvatar(
                          backgroundColor: Colors.black38,
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () => Methods.customToast("soon")
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 25.0
                    ),
                    child: Text(
                        "My Contacts",
                        style: TextStyle(
                          color: MyColors.white,
                          fontSize: 22,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                  ),
                ],
              ),
            ),

            
          Expanded(
            child: FutureBuilder(
              future: Provider.of<DataProvider>(context, listen: false).fetchAndSetUsers(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return  ListView.builder(
                    itemBuilder: (BuildContext context, int i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: buildShimmer(50, 50),
                          ),
                          title: Row(
                            children: [
                              buildShimmer(180, 16),
                              const Expanded(child: SizedBox())
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              buildShimmer(90, 10),
                              const Expanded(child: SizedBox())
                            ],
                          ),
                        ),
                      );
                    }
                  );
                  

                } else if(snapshot.connectionState == ConnectionState.done) {
                  List<User> users = snapshot.data?? [];
                  return  RefreshIndicator(
                    onRefresh: () => _refresh(context),
                    child: users.isNotEmpty  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int i) {
                        return ContactItem(
                          id: users[i].id, picture: users[i].picture, name: users[i].name, gender: users[i].gender,
                          onTap: () => Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => ContactScreen(user: users[i],))
                          ),
                        );
                      }
                     ) : ConstrainedBox(
                       constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height-80),
                       child: GestureDetector(
                        onTap: () => setState(() { }),
                         child: const Center(
                          child: Chip(label: Text("Tap to refresh"))
                          ),
                       )
                     )
                  );

                } else {
                  return const Center(child: Text("Ooups! An error accur"));
                }
              }
            ),
          ),
        ],
      ),
    );
  }
}
