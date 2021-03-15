import 'package:flutter/material.dart';

class ProfilePageMenu extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onTap;
  ProfilePageMenu({required this.title, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        //color: Colors.red,
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Icon(icon),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(title),
                      ),
                      Container(
                          child: Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                      ))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Divider(
                      thickness: 0.8,
                    ),
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
