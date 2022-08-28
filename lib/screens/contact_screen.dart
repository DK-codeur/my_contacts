import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_contacts/models/user.dart';

import '../utils/methods.dart';
import '../utils/my_colors.dart';

class ContactScreen extends StatefulWidget {
  final User? user;
  const ContactScreen({Key? key, this.user}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            pinned: true,
            expandedHeight: 180,
            leadingWidth: 40,
            actions: [
              IconButton(
                iconSize: 16,
                padding: const EdgeInsets.all(1),
                icon: const CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                ),
                onPressed: () => Methods.customToast("soon")
              ),

              IconButton(
                iconSize: 16,
                padding: const EdgeInsets.all(1),
                icon: const CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: Icon(
                    Icons.email_outlined,
                    color: Colors.white,
                  ),
                ),
                onPressed: () => Methods.customToast("soon")
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${widget.user?.name?.title} ${widget.user?.name?.first} ${widget.user?.name?.last}",
                    style: const TextStyle(
                      fontSize: 15, 
                    ),
                  ),
                ],
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
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
                  
                  ),
                  // Container(
                  //   color: MyColors.primary.withOpacity(0.6),
                  // ),
                  Stack(
                    fit: StackFit.loose,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 90,
                        decoration: BoxDecoration(
                            color: const Color(0xFFc31432),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "${widget.user?.picture?.large}"
                            )
                          ),
                            borderRadius: const BorderRadius.all(Radius.circular(15))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate(
              [
                buildListTile(Icons.email, widget.user?.email, "Email"),
                buildListTile(Icons.calendar_month, DateFormat("dd/mm/yyyy").format( widget.user!.dob!.date! ) , "Birthday"),
                buildListTile(Icons.map, "${widget.user?.location?.country}, ${widget.user?.location?.city}", "Location"),

              ]
            )
          )
        ],
      ),
    );
  }

   Widget buildListTile(IconData icon, String? title, String? subtitle) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: MyColors.white, child: Icon(icon, color: Color(0xFF240b36),)),
        title: Text(
          "$title",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        subtitle: Text("$subtitle"),
      ),
    );
  }
}
