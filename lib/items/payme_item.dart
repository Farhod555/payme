import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/payme_model.dart';

Widget paymeItem(BuildContext context, PaymeModel item) {
  return Container(
    width: 500,
    height: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/Uzcard.png'),
      ),
    ),
  );
}
