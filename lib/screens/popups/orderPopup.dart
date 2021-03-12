import 'package:flutter/material.dart';

import '../../appTheme.dart';

class OrderPopupView extends StatefulWidget {
   final Function(OrderType) onChange;
   final OrderType orderType;

  const OrderPopupView({Key key, this.onChange, this.orderType})
      : super(key: key);

  @override
  _OrderPopupViewState createState() => _OrderPopupViewState();
}

enum OrderType { noOrder, priceCre, priceDec, avgRating, popCamp }

class _OrderPopupViewState extends State<OrderPopupView> with TickerProviderStateMixin{
  OrderType _orderType;
  AnimationController animationController;

  @override
  void initState() {
    _orderType = widget.orderType;
    animationController = AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget child) {
            return AnimatedOpacity(
              duration: Duration(milliseconds: 100),
              opacity: animationController.value,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {},
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.getTheme().backgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(color:AppTheme.getTheme().dividerColor, offset: Offset(4, 4), blurRadius: 8.0),
                        ],
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding( padding: EdgeInsets.only(left: 8), child: getOrderType(OrderType.noOrder)),
                            Padding( padding: EdgeInsets.only(left: 8), child: getOrderType(OrderType.priceCre)),
                            Padding( padding: EdgeInsets.only(left: 8), child: getOrderType(OrderType.priceDec)),
                            Padding( padding: EdgeInsets.only(left: 8), child: getOrderType(OrderType.avgRating)),
                            Padding( padding: EdgeInsets.only(left: 8), child: getOrderType(OrderType.popCamp)),
                              Padding(
                              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppTheme.getTheme().primaryColor,
                                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color:AppTheme.getTheme().dividerColor,
                                      blurRadius: 8,
                                      offset: Offset(4, 4),
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      try {
                                        widget.onChange(_orderType);
                                        Navigator.pop(context);
                                      } catch (e) {}
                                    },
                                    child: Center(
                                      child: Text(
                                        "Applica",
                                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget getOrderType(OrderType order) {
    Text ordertxt;
    switch (order) {
      case OrderType.avgRating:
        ordertxt = const Text("Media Recensioni Clienti");
        break;
      case OrderType.popCamp:
        ordertxt = const Text("Popolarità");
        break;
      case OrderType.priceCre:
        ordertxt = const Text("Prezzo Crescente");
        break;
      case OrderType.priceDec:
        ordertxt = const Text("Prezzo Decrescente");
        break;
      case OrderType.noOrder:
        ordertxt = const Text("Nessun Ordinamento");
        break;
      default:
        ordertxt = const Text("Nessun Ordinamento");
        break;
    }
    return RadioListTile<OrderType>(
      controlAffinity: ListTileControlAffinity.trailing,
      activeColor: AppTheme.getTheme().primaryColor,
      title: ordertxt,
      value: order,
      groupValue: _orderType,
      onChanged: (value) {
        setState(() {
          _orderType = value;
        });
      },
    );
  }
}
