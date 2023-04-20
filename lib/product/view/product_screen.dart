import 'package:codefactory/common/component/pagination_list_view.dart';
import 'package:codefactory/product/component/product_card.dart';
import 'package:codefactory/product/model/product_model.dart';
import 'package:codefactory/product/provider/product_provider.dart';
import 'package:codefactory/restaurant/view/restaurant_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ProductScreen extends ConsumerStatefulWidget {
//   const ProductScreen({Key? key}) : super(key: key);
//
//   @override
//   ConsumerState<ProductScreen> createState() => _ProductTabState();
// }

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(productProvider);

    return PaginationListView<ProductModel>(
      provider: productProvider,
      itemBuilder: <ProductModel>(_, index, model) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => RestaurantDetailScreen(
                  id: model.restaurant.id,
                ),
              ),
            );
          },
          child: ProductCard.fromProductModel(
            model: model,
          ),
        );
      },
    );
  }
}
