import 'package:flutter/material.dart';
import 'package:flutter_marketplace/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartProvider myProvider;

  @override
  Widget build(BuildContext context) {
    myProvider = Provider.of<CartProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Color.fromRGBO(242,243,245, 1),
            child: Text("Корзина", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: true
                            ? Icon(
                          Icons.check,
                          size: 15.0,
                          color: Colors.white,
                        )
                            : Icon(
                          Icons.check_box_outline_blank,
                          size: 20.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("Выбрать все"),
                  ],
                ),
                Text("Удалить выбранные", style: TextStyle(color: Colors.red),)
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),// child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  color: Color.fromRGBO(242,243,245, 1),
                  child: Column(
                    children: [
                   Padding(
                     padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                     child: InkWell(
                       onTap: (){
                         myProvider.openSearchScreen(context);
                       },
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               SizedBox(height: 8.0),
                               Text("Населенний пункт", style: TextStyle(color: Colors.black45, fontSize: 12.0),),
                               Text("Москва", style: TextStyle(color: Colors.black, fontSize: 18.0),),
                               SizedBox(height: 4.0),
                             ],
                           ),
                           Icon(Icons.arrow_drop_down_sharp),
                         ],
                       ),
                     ),
                   ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Divider(height: 1.0,),
                      ),
                      SizedBox(height: 30.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              "Доставка Ozon",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Container(
                          child: Row(
                            children: [
                              Icon(Icons.car_rental, color: Colors.black,),
                              Text("Курьром"),
                              SizedBox(width: 10),
                              Icon(Icons.location_on_outlined, color: Colors.black,),
                              Text("Курьром"),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 12.0),
                    ],
                  ),
                ),
                ListView.separated(
                  physics:  NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  separatorBuilder: (BuildContext context, int index) =>
                      Container(color: Color.fromRGBO(242,243,245, 1), height: 8.0,),
                  itemBuilder: (context, index) => itemView(),
                ),
               Padding(
                 padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                 child: Container(
                   child: Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Ваша корзина", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                           Text("3-товая *773", style: TextStyle(color: Colors.black45),)
                         ],
                       ),
                       SizedBox(height: 8.0,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Товары (3)", style: TextStyle(color: Colors.black45)),
                           Text("29 079 p", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
                         ],
                       ),
                       SizedBox(height: 4.0,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Скидка", style: TextStyle(color: Colors.black45)),
                           Text("-11 321 P", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                         ],
                       ),
                       SizedBox(height: 4.0,),
                       Align(
                         alignment: Alignment.centerLeft,
                           child: Container(
                             width: double.infinity,
                             child: Text(
                               "Подробнее",
                               style: TextStyle(color: Colors.blue),
                             ),
                           ),
                       ),
                       SizedBox(height: 20.0,),
                       Divider(height: 1.0),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Общая стоимость", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                           Text("23 748 P", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
                         ],
                       ),
                       SizedBox(height: 20.0,),
                       SizedBox(
                           width:  double.infinity,
                           height: 50.0,
                           child: FlatButton(
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(8.0),
                               ),
                               color: Colors.blue,
                               onPressed:() => null, child:
                           Text("O'ZBEKCHA",
                             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                         ),
                     ],
                   ),
                 ),
               )

              ],
            ),
            //   ),
          ),
        ),

      ],
    );
  }

  Padding itemView() => Padding(
    padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
    child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: true
                              ? Icon(
                            Icons.check,
                            size: 15.0,
                            color: Colors.white,
                          )
                              : Icon(
                            Icons.check_box_outline_blank,
                            size: 20.0,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Image.asset("assets/banner.jpg", height: 100.0, width: 100,),
                    ],
                  ),
                  Container(
                      color: Color.fromRGBO(247,207,33,  1),
                      child: Text("Частями по 32 руб.мес")),
                ],
              ),

              Column(
                children: [
                  Row(
                    children: [
                      Text("599 P", style: TextStyle(color: Colors.red),),
                      Text("199 P")
                    ],
                  ),
                  Text("Набор кухонных\nNabora")
                ],
              )
            ],
          ),
          SizedBox(height: 8.0),
          Divider(height: 1.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.star_outline),
                  SizedBox(width: 8.0,),
                  Text("Удалить")
                ],
              ),
              Row(
                children: [
                  Icon(Icons.delete_outline),
                  SizedBox(width: 8.0,),
                  Text("Удалить")
                ],
              ),
              Row(
                children: [
                  Text("1 шт"),
                  SizedBox(width: 8.0,),
                  Icon(Icons.arrow_drop_down_outlined)
                ],
              )

            ],
          )
        ],
    ),
  );
}
