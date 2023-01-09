import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_expense/add_page.dart';

import 'daily_expense_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const AddExpense(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Future<void> handleRefresh() async {
    Navigator.of(context).push(_createRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
                // better use `SliverChildBuilderDelegate`
                delegate: SliverChildListDelegate([
              // you can put regular container here
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.search,
                          size: 32,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.grey[400], shape: BoxShape.circle),
                          child: const Icon(
                            Icons.add,
                            size: 28,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  const Text(
                    "Spent this week",
                    style: TextStyle(fontSize: 32),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "₹",
                        style: TextStyle(
                          fontSize: 40,
                          fontFeatures: [FontFeature.superscripts()],
                        ),
                      ),
                      Text(
                        "5,400",
                        style: TextStyle(fontSize: 75),
                      ),
                      Text(
                        "00",
                        style: TextStyle(
                            fontSize: 40,
                            fontFeatures: [FontFeature.superscripts()]),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: const [
                        SizedBox(
                          height: 20,
                          width: 42,
                        ),
                        Text(
                          'Today',
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          height: 20,
                          width: 160,
                        ),
                        Text(
                          '₹5,400.90',
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ])),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const ExpenseWidget();
                },
                childCount: 5, // 1000 list items
              ),
            ),
          ],
        ),
      ),
    );
  }
}
