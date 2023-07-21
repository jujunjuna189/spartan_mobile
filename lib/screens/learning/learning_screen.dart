import 'package:flutter/material.dart';
import 'package:spartan_mobile/screens/learning/article/article_screen.dart';
import 'package:spartan_mobile/screens/learning/e_learning/e_learning_screen.dart';
import 'package:spartan_mobile/utils/colors.dart';
import 'package:spartan_mobile/widgets/painter/circle_tab_indicator.dart';

class LearningScreen extends StatefulWidget {
  const LearningScreen({Key? key}) : super(key: key);

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> with SingleTickerProviderStateMixin  {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: ColoredBox(
          color: bgPrimary,
          child: TabBar(
            controller: _controller,
            indicatorWeight: 3.0,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: const [
              Tab(text: "Artikel",),
              Tab(text: "E-Learning",),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          ArticleScreen(),
          ELearningScreen(),
        ],
      ),
    );
  }
}
