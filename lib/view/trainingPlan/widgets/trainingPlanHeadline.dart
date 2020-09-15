import 'package:attt/utils/size_config.dart';
import 'package:attt/view/history/widgets/settingIcon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:attt/view/trainingPlan/widgets/userImage.dart';
import 'package:attt/view/trainingPlan/widgets/userName.dart';

Widget trainingPlanHeadline(
  DocumentSnapshot userDocument,
  DocumentSnapshot userTrainerDocument,
  BuildContext context,
  String userUID,
) {
  String name = userDocument.data()['display_name'];
  List<String> nameSurname = name.split(' ');
  String justName = nameSurname[0];
  String image = userDocument.data()['image'];
  return ListTile(
    contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
    leading: userImage(image),
    title: Center(child: userName(justName, context)),
    trailing: settingsIcon(userDocument, userUID, context),
  );

  // Row(
  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //   // mainAxisAlignment: MainAxisAlignment.center,

  //   crossAxisAlignment: CrossAxisAlignment.center,
  //   children: <Widget>[
  //     userImage(image),
  //     // SizedBox(
  //     //   width: MediaQuery.of(context).orientation == Orientation.portrait
  //     //       ? SizeConfig.blockSizeHorizontal * 14.3
  //     //       : SizeConfig.blockSizeHorizontal * 13.5,
  //     // ),
  //     Center(child: userName(justName, context)),
  //     // Spacer(),
  //     settingsIcon(userDocument, userUID, context)
  //   ],
  // );
}
