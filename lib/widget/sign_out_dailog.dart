import 'package:flutter/material.dart';
import 'package:loan_app/Dashboard/Dashboard.dart';

import '../../Helper/globle style.dart';
import '../../Helper/navigation_helper.dart';
import '../../Helper/shared_preferances.dart';
import '../config/choosen_lang.dart';

class SignOutConfirmationDialog extends StatefulWidget {
  const SignOutConfirmationDialog({Key? key}) : super(key: key);

  @override
  State<SignOutConfirmationDialog> createState() => _SignOutConfirmationDialogState();
}

class _SignOutConfirmationDialogState extends State<SignOutConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
            width: MediaQuery.of(context).size.width / 1.2,
            child:
            // Consumer<AuthenticationProvider>(
            //     builder: (context, auth, child) {
            //       return
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 14,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: textToTrans(
                              input:'Are you sure you want to sign out?',
                              style:KH7_SemiBold.copyWith(color: KSECONDARY_COLOR,  fontSize:14),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end, children: [
                            InkWell(
                              onTap: () async {
                                await SPManager.instance.logout();
                                pushAndRemoveUntil(context, Dashboard(),false);

                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 4, bottom: 4, left: 32, right: 32),
                                child: Center(
                                    child:
                                    textToTrans(
                                      input:'Yes',
                                        style: KH6.copyWith(color: kPrimaryColor,
                                            fontSize:16))
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                               Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 6, bottom: 6, left: 32, right: 16),
                                child: Center(
                                    child:
                                    textToTrans(
                                      input:'No',
                                        style: KH6.copyWith(color:kPrimaryColor,
                                            fontSize:16
                                        ))
                                ),
                              ),
                            ),
                          ])
                        ])
                // }),
          ),
        ]);
  }
}
