import 'package:flutter/material.dart';
import 'package:my_contacts/models/id.dart';
import 'package:my_contacts/models/name.dart';
import 'package:my_contacts/models/picture.dart';


class ContactItem extends StatelessWidget {
  final Id? id;
  final Picture? picture;
  final Name? name;
  final String? gender;
  final VoidCallback onTap;
  const ContactItem({
    Key? key, required this.picture, required this.name, required this.gender, required this.onTap, required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            onTap: onTap,
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 24,
              child: CircleAvatar(
                // child: Icon(Icons.person),
                radius: 23,
                backgroundImage: NetworkImage("${picture?.medium}")
              ),
            ),
            title: Text(
              "${name?.title} ${name?.first} ${name?.last}",
                style: const TextStyle(
                fontWeight: FontWeight.bold
              )
            ),
            subtitle: Text("$gender"),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 15,),
          ),
          const Divider()

          ],
      ),
    );
  }
}


