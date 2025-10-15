import 'package:flutter/material.dart';

class ChefNotification extends StatefulWidget {
  const ChefNotification({super.key});

  @override
  State<ChefNotification> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<ChefNotification>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.redAccent,
          labelColor: Colors.redAccent,
          unselectedLabelColor: Colors.grey,
          labelStyle: const TextStyle(fontWeight: FontWeight.w600),
          tabs: const [
            Tab(text: 'Notifications'),
            Tab(text: 'Messages (3)'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildNotificationsTab(),
          _buildMessagesTab(),
        ],
      ),

    );
  }

  Widget _buildNotificationsTab() {
    final List<Map<String, String>> notifications = [
      {
        'name': 'Tanbir Ahmed',
        'action': 'Placed a new order',
        'time': '20 min ago',
        'avatar': 'images/boy.jpg',
        'image': 'images/pizza1.png',
      },
      {
        'name': 'Salim Smith',
        'action': 'left a 5 star review',
        'time': '20 min ago',
        'avatar': 'images/boy.jpg',
        'image': 'images/pizza3.png',
      },
      {
        'name': 'Royal Bengol',
        'action': 'agreed to cancel',
        'time': '20 min ago',
        'avatar': 'images/boy.jpg',
        'image': 'images/burger2.png',
      },
      {
        'name': 'Pabel Vuiya',
        'action': 'Placed a new order',
        'time': '20 min ago',
        'avatar': 'images/boy.jpg',
        'image': 'images/burger1.png',
      },
    ];

    return ListView.separated(
      itemCount: notifications.length,
      separatorBuilder: (context, index) => const Divider(thickness: 0.5),
      itemBuilder: (context, index) {
        final item = notifications[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(item['avatar']!),
            radius: 25,
          ),
          title: RichText(
            text: TextSpan(
              text: item['name'],
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
              children: [
                TextSpan(
                  text: ' ${item['action']}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          subtitle: Text(item['time']!, style: const TextStyle(color: Colors.grey)),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              item['image']!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget _buildMessagesTab() {
    final List<Map<String, dynamic>> messages = [
      {
        'name': 'Royal Parvej',
        'message': 'Sounds awesome!',
        'time': '19:37',
        'avatar':'images/boy.jpg',
        'unread': 1,
      },
      {
        'name': 'Cameron Williamson',
        'message': 'Ok, just hurry up little bit...😊',
        'time': '19:37',
        'avatar': 'images/boy.jpg',
        'unread': 2,
      },
      {
        'name': 'Ralph Edwards',
        'message': 'Thanks dude.',
        'time': '19:37',
        'avatar': 'images/boy.jpg',
        'unread': 0,
      },
      {
        'name': 'Cody Fisher',
        'message': 'How is going...?',
        'time': '19:37',
        'avatar': 'images/boy.jpg',
        'unread': 0,
      },
      {
        'name': 'Eleanor Pena',
        'message': 'Thanks for the awesome food man...!',
        'time': '19:37',
        'avatar':'images/boy.jpg',
        'unread': 0,
      },
    ];

    return ListView.separated(
      itemCount: messages.length,
      separatorBuilder: (context, index) => const Divider(thickness: 0.5),
      itemBuilder: (context, index) {
        final msg = messages[index];
        return ListTile(
          leading: Stack(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(msg['avatar']),
                radius: 25,
              ),
              if (msg['unread'] > 0)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          title: Text(
            msg['name'],
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            msg['message'],
            style: const TextStyle(color: Colors.grey),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                msg['time'],
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              if (msg['unread'] > 0)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${msg['unread']}',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
