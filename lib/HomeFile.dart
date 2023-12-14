import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'fileOfData.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {

  @override
  Widget build(BuildContext context)
  {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: DefaultTabController(
         initialIndex: 1,
         length: 3,
         child: Scaffold(
           backgroundColor: const Color.fromRGBO(35, 35, 45, 1),
           appBar: AppBar(
             backgroundColor: const Color.fromRGBO(35, 35, 45, 1),
             centerTitle: true,
             title: const Text(
               "Найди шпиона",
               style: TextStyle(
                 color: Color.fromRGBO(254, 212, 126, 1),
                 fontWeight: FontWeight.w600,
               ),
             ),
             bottom: const TabBar(
               labelColor: Color.fromRGBO(200, 146, 84, 1),
               dividerColor: Color.fromRGBO(33, 34, 36, 0.2),
               indicatorColor: Color.fromRGBO(254, 212, 126, 1),
               unselectedLabelColor: Colors.white60,
               tabs: [
                 Tab(
                   icon: Icon(Icons.announcement),
                   text: "Подсказки",
                 ),
                 Tab(
                   icon: Icon(Icons.gamepad),
                   text: "Игра",
                 ),
                 Tab(
                   icon: Icon(Icons.question_mark_rounded),
                   text: "Правила",
                 )
               ],
             ),
           ),
           body: TabBarView(
             children: [
               ListView.builder(
                   itemCount: listOfHints.length,
                   itemBuilder: (context, index){
                     return Card(
                       color: const Color.fromRGBO(33, 34, 36, 0.7),
                       margin: const EdgeInsets.only(top: 10),
                       child: ListTile(
                         title: Text(
                             listOfHints[index],
                             style: const TextStyle(
                                 color: Colors.white70
                             ),
                         ),
                       ),
                     );
                   }
               ),
               Center(
                 child: MaterialButton(
                   color: const Color.fromRGBO(254, 212, 126, 1),
                   height: 80,
                   minWidth: 250,
                   onPressed: (){Navigator.of(context).pushNamed('/SettingsPage');},
                   child: const Text(
                     "Начать",
                     style: TextStyle(
                         fontSize: 24,
                         color: Color.fromRGBO(30, 31, 36, 1)
                     ),
                   ),
                 ),
               ),
               CarouselSlider.builder(
                   itemCount: listOfTitlesRule.length,
                   itemBuilder: (context, index, pageViewIndex){
                     return Card(
                       color: const Color.fromRGBO(254, 212, 126, 1),
                       child: Center(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Text(
                               listOfTitlesRule[index],
                               style: const TextStyle(
                                 fontSize: 28,
                                 fontWeight: FontWeight.bold,
                                 color: Color.fromRGBO(30, 31, 36, 1),
                               ),
                             ),
                             Text(
                               listOfContentsRule[index],
                               textAlign: TextAlign.center,
                               style: const TextStyle(
                                 fontSize: 18,
                                 color: Color.fromRGBO(30, 31, 36, 1),
                               ),
                             ),
                           ],
                         ),
                       ),
                     );
                   },
                   options: CarouselOptions(
                     enableInfiniteScroll: false,
                     autoPlay: false,
                     enlargeCenterPage: true,
                     scrollDirection: Axis.vertical,
                   )
               ),
             ],
           ),
         )
     ),
   );
  }
}