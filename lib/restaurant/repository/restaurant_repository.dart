import 'package:codefactory/common/const/data.dart';
import 'package:codefactory/common/dio/dio.dart';
import 'package:codefactory/common/model/cursor_pagination_model.dart';
import 'package:codefactory/common/model/pagination_params.dart';
import 'package:codefactory/common/repository/base_pagination_repository.dart';
import 'package:codefactory/restaurant/model/restaurant_detail_model.dart';
import 'package:codefactory/restaurant/model/restaurant_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

part 'restaurant_repository.g.dart';

final restaurantRepositoryProvider = Provider<RestaurantRepository>((ref) {
  final dio = ref.watch(dioProvider);

  final repository = RestaurantRepository(dio, baseUrl: 'http://$ip/restaurant');

  return repository;
});

@RestApi()
abstract class RestaurantRepository implements IBasePaginationRepository<RestaurantModel>{
  // http://$ip/restaurant -> baseUrl
  factory RestaurantRepository(Dio dio, {String baseUrl})
  = _RestaurantRepository;

  // http://$ip/restaurant/
  @GET('/')
  @Headers({
    'accessToken': 'true',
  })
  Future<CursorPagination<RestaurantModel>> paginate({
    // 쿼리문
  @Queries() PaginationParams? paginationParams = const PaginationParams(),
});

  // http://$ip/restaurant/:id/
  @GET('/{id}')
  @Headers({
    'accessToken': 'true',
  })
  Future<RestaurantDetailModel> getRestaurantDetail({
  @Path() required String id,
});
}