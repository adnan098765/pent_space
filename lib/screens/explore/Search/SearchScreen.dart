import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:sizer/sizer.dart';

import '../../../core/const/colors.dart';
import '../../../models/EnquiryModel.dart';
import '../answers/answers_widget.dart';
import '../explore_screen.dart';

class Searchscreen extends StatefulWidget {
  Searchscreen({Key? key}) : super(key: key);

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  bool isShowUsers = false;

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: AppPallet.textColor,
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.8.w),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      AppUtils.goBack();
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white)),
                Container(
                  width: 80.w,
                  padding: EdgeInsets.symmetric(
                    vertical: 2.w,
                    horizontal: 4.w,
                  ),
                  decoration: BoxDecoration(
                      color: AppPallet.whiteBackground,
                      borderRadius: BorderRadius.circular(1.w)),
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      // prefixIcon: Icon(Icons.arrow_back),
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Search for Questions or keywords',
                      hintStyle: TextStyle(
                        color: AppPallet.greyTextColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (_) {
                      setState(() {
                        isShowUsers = true;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        isShowUsers
            ? Expanded(
                child: FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('enquiries')
                      .where(
                        'content',
                        isGreaterThanOrEqualTo: searchController.text,
                      )
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }

                    var docs = (snapshot.data! as QuerySnapshot).docs;

                    return ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        EnquiryModel question = EnquiryModel.fromJson(
                            (docs[index]).data() as Map<String, dynamic>);
                        return QuestionWidget();
                      },
                    );
                  },
                ),
              )
            : Container(),
      ],
    ));
  }
}
