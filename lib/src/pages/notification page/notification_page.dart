import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/date_format.dart';
import 'package:jatri_app/src/configs/loader.dart';
import 'package:jatri_app/src/controllers/notification%20controller/notification_controller.dart';
import 'package:jatri_app/src/widgets/appbar/customAppbar.dart';
import 'package:jatri_app/src/widgets/notification_card.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final NotificationController _controller = Get.put(NotificationController());

  @override
  void initState() {
    super.initState();
    _controller.getNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: 'Notifications',
        isActionEnable: true,
        onTap: () {
          _showSuccessPopup(context);
        },
      ),
      body: Obx(() {
        return RefreshIndicator(
          onRefresh: _refreshNotifications,
          child: _buildNotificationList(),
        );
      }),
    );
  }

  Widget _buildNotificationList() {
    if (_controller.isLoading.value) {
      return Center(child: loader());
    } else {
      if (_controller.notificationData.isEmpty) {
        return Center(child: Text('No notifications found'.tr));
      } else {
        return Obx(
          ()=> ListView.builder(
            itemCount: _controller.notificationData.length,
            itemBuilder: (context, index) {
              final notification = _controller.notificationData[index];

              return Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: NotificationCard(
                  title: notification.title.toString(),
                  subTitle: notification.body.toString(),
                  date: formatDateTime(notification.createdAt.toString()),
                ),
              );
            },
          ),
        );
      }
    }
  }

  Future<void> _refreshNotifications() async {
    _controller.getNotification();
  }

  void _showSuccessPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete'),
          content: Text('Are you sure you want to delete all notifications?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {

                _controller.getNotificationClean();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
