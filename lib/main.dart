import 'package:flutter/material.dart';
import 'package:portofolio/left.dart';
import 'package:portofolio/provider.dart';
import 'package:portofolio/right.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juniel Djossou',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => AppProvider(),
        child: Row(
          children: [
            // Left Column
            const LeftColumn(),
            //Vertical Line Separator
            Container(
              width: 1, // Width of the line
              color: Colors.grey, // Color of the line
              height:
                  double.infinity, // Make the line take full height of the column
            ),
            // Right Column
            const RightColumn(),
          ],
        ),
      ),
    );
  }
}

