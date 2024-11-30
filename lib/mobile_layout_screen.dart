import 'package:bullets/colors.dart';

import 'package:flutter/material.dart';

import 'features/conversation/screen/conversation_screen.dart';
import 'features/subject/screen/subject_screen.dart';

class MobileLayoutScreen extends StatefulWidget {
  const MobileLayoutScreen({super.key});

  @override
  State<MobileLayoutScreen> createState() => _MobileLayoutScreenState();
}

class _MobileLayoutScreenState extends State<MobileLayoutScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 1, // Set default tab to 1
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: const [
          SubjectScreen(),
          ConversationScreen(),
          Center(child: Text('Categories')),
          Center(child: Text('more')),
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 10,
        shadowColor: Colors.black, // Customize shadow colour
        child: Container(
          decoration: const BoxDecoration(color: backgroundColor),
          child: TabBar(
            controller: tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            indicatorColor: Colors.black, // Add indicator color
            tabs: const [
              Tab(icon: Icon(Icons.book)),
              Tab(icon: Icon(Icons.list_alt)),
              Tab(icon: Icon(Icons.add_box)),
              Tab(icon: Icon(Icons.more_horiz)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}