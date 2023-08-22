
import 'package:get/get.dart';
import 'package:quote_app/model/quote_res.dart';
import 'package:quote_app/services/quote_service.dart';

class QuotesController extends GetxController{

  List<QuoteRes>? todayquote;
  List<QuoteRes>? allquotes;
  bool allquotesload = false;
  bool todayquoteload = false; 

  gettodayquote()async{
    todayquoteload = true;
    update();
  await QuoteService().todayquote().then((value) {
    todayquote = value;
    update(); 
  });

  todayquoteload = false;
  update(); 
  }


  getallquote()async{
  allquotesload = true;
  update();
  await QuoteService().allquote().then((value) {
    allquotes = value;
    update();
  });
  allquotesload = false;
  update(); 
  }
  
}