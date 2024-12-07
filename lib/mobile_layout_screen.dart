import 'package:bullets/colors.dart';
import 'package:flutter/material.dart';

import 'features/conversation/screen/conversation_screen.dart';
import 'features/subject/screen/subject_screen.dart';

class MobileLayoutScreen extends StatefulWidget {
  const MobileLayoutScreen({Key? key}) : super(key: key);

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
      initialIndex: 0, // Default tab index
      length: 4, // Total number of tabs
      vsync: this, // For animation synchronization
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body section displays content of the selected tab
      body: TabBarView(
        controller: tabController,
        children: const [
          SubjectScreen(), // Tab 0 content
          ConversationScreen(), // Tab 1 content
          Center(child: Text('Categories')), // Tab 2 content
          Center(child: Text('More')), // Tab 3 content
        ],
      ),

      // Bottom navigation bar with TabBar
      bottomNavigationBar: Material(
        elevation: 10, // Elevation for shadow effect
        shadowColor: Colors.black, // Shadow color
        child: Container(
          decoration: const BoxDecoration(
            color: backgroundColor, // Custom background color
          ),
          child: TabBar(
            controller: tabController,
            labelColor: Colors.black, // Active tab text/icon color
            unselectedLabelColor: Colors.grey, // Inactive tab text/icon color
            labelStyle: const TextStyle(fontWeight: FontWeight.bold), // Active tab text style
            indicatorColor: Colors.black, // Indicator line color
            tabs: const [
              Tab(icon: Icon(Icons.book)), // Tab 0 icon
              Tab(icon: Icon(Icons.list_alt)), // Tab 1 icon
              Tab(icon: Icon(Icons.add_box)), // Tab 2 icon
              Tab(icon: Icon(Icons.more_horiz)), // Tab 3 icon
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
