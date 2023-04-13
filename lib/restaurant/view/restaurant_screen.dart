import 'package:codefactory/common/dio/dio.dart';
import 'package:codefactory/common/model/cursor_pagination_model.dart';
import 'package:codefactory/restaurant/component/restaurant_card.dart';
import 'package:codefactory/restaurant/model/restaurant_model.dart';
import 'package:codefactory/restaurant/provider/restaurant_provider.dart';
import 'package:codefactory/restaurant/repository/restaurant_repository.dart';
import 'package:codefactory/restaurant/view/restaurant_detail_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/data.dart';

class RestaurantScreen extends ConsumerWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  // Future<List<RestaurantModel>> paginateRestaurant(WidgetRef ref) async {
  //   final dio = ref.watch(dioProvider);
  //
  //   final resp = await RestaurantRepository(dio, baseUrl: 'http://$ip/restaurant')
  //   .paginate();
  //
  //   // final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
  //   //
  //   // final resp = await dio.get(
  //   //   'http://$ip/restaurant',
  //   //   options: Options(
  //   //     headers: {
  //   //       'authorization': 'Bearer $accessToken',
  //   //     },
  //   //   ),
  //   // );
  //   //
  //   // return resp.data['data'];
  //   return resp.data;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(restaurantProvider);

    if(data is CursorPaginationLoading){
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    final cp = data as CursorPagination;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        itemCount: cp.data.length,
        itemBuilder: (_, index) {
          final pItem = cp.data[index];
          // final pItem = RestaurantModel.fromJson(item);

          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => RestaurantDetailScreen(
                    id: pItem.id,
                  ),
                ),
              );
            },
            child: RestaurantCard.fromModel(
              model: pItem,
            ),
          );
        },
        separatorBuilder: (_, index) {
          return SizedBox(height: 16.0);
        },
      ),
    );
  }
}
