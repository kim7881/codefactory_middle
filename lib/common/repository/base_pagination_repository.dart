import 'package:codefactory/common/model/cursor_pagination_model.dart';
import 'package:codefactory/common/model/pagination_params.dart';

abstract class IBasePaginationRepository<T>{
  Future<CursorPagination<T>> paginate({
    // 쿼리문
    PaginationParams? paginationParams = const PaginationParams(),
  });
}