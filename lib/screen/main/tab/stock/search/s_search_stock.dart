import 'package:fast_app_base/screen/main/tab/stock/search/w_popular_search_stock_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_search_history_stock_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_stock_search_app_bar.dart';
import 'package:flutter/material.dart';

class SearchStockScreen extends StatefulWidget {
  const SearchStockScreen({super.key});

  @override
  State<SearchStockScreen> createState() => _SearchStockScreenState();
}

class _SearchStockScreenState extends State<SearchStockScreen> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StockSearchAppBar(controller: controller,),
      body: ListView(
        children: [
          SearchHistoryStockList(),
          PopularSearchStockList(),
        ],
      ),
    );
  }
}
