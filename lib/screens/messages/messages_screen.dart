import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/Services/core/app_urls.dart';
import 'package:sizer/sizer.dart';
import '../../core/const/app_const.dart';
import '../../core/const/colors.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:badges/badges.dart' as badges;
import '../../view_models/controller/getuserprofile/get_userprofile_view_model.dart';
import 'chat_screen.dart';
import 'package:pent_space/utils/helpers.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late IO.Socket socket;
  List _messages = [];
  bool isLoading = false;
  final getUserData = Get.put(GetUserDataController());

  @override
  void initState() {
    isLoading = true;
    super.initState();
    _connectToSocket();
    print('AuthToken  is ${authtoken}');
  }

  void _connectToSocket() {
    socket = IO.io(
      '${AppUrls.socketurl}',
      IO.OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          .build(),
    );

    socket.connect();
    sendOnlineAck();
    addChatListeners();
  }

  sendOnlineAck() {
    socket.emit("getAllChats", {
      "access_token": authtoken,
    });
  }

  addChatListeners() {
    log('Id  ${getUserData.userdata.data!.id}');
    socket.on('allChats-user_id-${getUserData.userdata.data!.id}', (data) {
      log("New Message recieved $data");

      chatsdata(data);
    });
  }

  chatsdata(data) {
    if (mounted) {
      setState(() {
        _messages = data;

        if (_messages.length > 0) {
          isLoading = false;
        } else if (_messages.isEmpty) {
          isLoading = false;
        }
      });
    }

    print('Message ${_messages}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppPallet.textColor,
          width: double.infinity,
          alignment: Alignment.center,
          child: SafeArea(
            bottom: false,
            child: ListTile(
              title: Center(
                child: Text(
                  'PentSpace',
                  style: TextStyle(
                    color: AppPallet.whiteTextColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Messages',
                style: TextStyle(
                  color: AppPallet.textColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return _messages[index]['last_message'] != null
                        ? ListTile(
                            leading: CircleAvatar(
                              radius: 27,
                              backgroundImage: NetworkImage(
                                cleanUrl('${_messages[index]['profile_picture']}'),
                              ),
                            ),
                            title: Text(
                              _messages[index]['business_name'] != null
                                  ? _messages[index]['business_name']
                                  : _messages[index]['user_name'],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  _messages[index]['last_message'],
                                  style: TextStyle(
                                      fontWeight: _messages[index]
                                                  ['unread_messages'] >
                                              0
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                                ),
                                Spacer(),
                                if (_messages[index]['unread_messages'] >
                                    0) ...[
                                  badges.Badge(
                                    badgeStyle: const badges.BadgeStyle(
                                        badgeColor: Color(0xFF262E3C)),
                                    badgeContent: Text(
                                      _messages[index]['unread_messages']
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 9.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ]
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                      recivername: _messages[index]
                                                  ['business_name'] !=
                                              null
                                          ? _messages[index]['business_name']
                                          : _messages[index]['user_name'],
                                      chatid: _messages[index]['chat_id'],
                                      reciverprofile: _messages[index]
                                          ['profile_picture'],
                                      user_id_one: _messages[index]
                                          ['user_one_id'],
                                      user_id_two: _messages[index]
                                          ['user_two_id'],
                                      isblocked: _messages[index]['is_blocked'],
                                      iamblocked: _messages[index]
                                          ['iam_blocked']
                                      //reciveruser: userData,
                                      ),
                                ),
                              );
                            },
                          )
                        : Container();
                  }),
        )
      ],
    );
  }
}

class MessageTile extends StatelessWidget {
  const MessageTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // AppUtils.go( ChatScreen());
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.8.w),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppPallet.inputBorderColor),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 12.w,
              height: 12.w,
              decoration: BoxDecoration(
                color: AppPallet.greyBackgroundColor,
                borderRadius: BorderRadius.circular(15.w),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0.3.w,
                    right: 0.3.w,
                    child: Container(
                      width: 3.w,
                      height: 3.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFF61CBBB),
                        borderRadius: BorderRadius.circular(1.5.w),
                        border: Border.all(
                          width: 0.4.w,
                          color: AppPallet.whiteBackground,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(right: 2.4.w)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 0.2.h)),
                  Text(
                    'Sarah Thompkins',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 0.3.h)),
                  Text(
                    'Hi Sarah, how you doing?',
                    style: TextStyle(
                      color: const Color(0xFF5F656F),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            Icon(
              Icons.done_all,
              color: const Color(0xFF5F656F),
              size: 9.sp,
            ),
            Padding(padding: EdgeInsets.only(right: 2.4.w)),
            Text(
              '14:32',
              style: TextStyle(
                color: const Color(0xFF5F656F),
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
