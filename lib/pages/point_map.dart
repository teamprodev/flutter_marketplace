import 'package:flutter/material.dart';

class PointMap extends StatefulWidget {
  @override
  _PointMapState createState() => _PointMapState();
}

class _PointMapState extends State<PointMap> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _settingModalBottomSheet(context);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
        title: Text("Пункты выдачи на карте", style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                child: Text("Выберите населенный пункт, чтобы узнать\nстоимость доставки")),
           SizedBox(height: 6),
            Container(
              width: double.infinity,
              color: Color.fromRGBO(242,243,245, 1),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6),
                  Text("Ваш населенный пункт", style: TextStyle(color: Colors.black38),),
                  SizedBox(height: 2),
                  Text("Ташкент", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                  SizedBox(height: 12),
                ],
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }

  void _settingModalBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (BuildContext bc){
      return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        child: IconButton(icon: Icon(Icons.close), onPressed: (){
                          Navigator.pop(context);
                        },),
                      ),
                    ),
                    TabBar(
                      // These are the widgets to put in each tab in the tab bar.
                      tabs: [
                       Text('ASHOP PREMIUM', style: TextStyle(color: Colors.black),),
                       Text('БЕЗ ASHOP PREMIUM', style: TextStyle(color: Colors.black),),
                      ]
                    ),
             SizedBox(
               height: 200,
               child: TabBarView(
                 children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                           Row(
                            children: [
                            Icon(Icons.home_outlined, color: Colors.black),
                            SizedBox(width: 20),
                            Text("Пункты выдачи и постаматы"),
                            ],
                            ),
                            SizedBox(height: 15),
                            Text("Для заказов с предоплатой и постоплатой", style: TextStyle(color: Color.fromRGBO(157,160,160, 1))),
                           SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(Icons.whatshot),
                                Text("стоимость доставки 0 P")
                              ],
                            ),
                            SizedBox(height: 40),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.archive),
                                  Text("Почта Узбекистана")
                                ],
                              ),
                            ),
                            SizedBox(height: 30),
                            Text("Для предоплаченных заказов", style: TextStyle(color: Color.fromRGBO(157,160,160, 1)))
                          ],
                        ),
                      ),
                    ),
                  ),
                   Icon(Icons.music_video),
                 ],
               ),
             ),
                  ],
                ),

              ),
            ),
          ],
        ),
      );
    }
    );
  }
}
