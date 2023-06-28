import 'package:flutter/material.dart';
import 'package:mini_ecom/models/sneaker_model.dart';
import 'package:mini_ecom/views/shared/grid_tile.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class ProductByCatWidget extends StatelessWidget {
  const ProductByCatWidget({
    super.key,
    required Future<List<SneakersModel>> male,
    required this.dSize,
  }) : _male = male;

  final Future<List<SneakersModel>> _male;
  final Size dSize;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _male,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Eroor is ${snapshot.error}");
        } else {
          final male = snapshot.data;
          return StaggeredGridView.countBuilder(
            padding: EdgeInsets.zero,
            crossAxisSpacing: 20,
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            itemCount: male!.length,
            scrollDirection: Axis.vertical,
            staggeredTileBuilder: (index) {
              return StaggeredTile.extent(
                  (index % 2 == 0) ? 1 : 1,
                  (index % 4 == 1 || index % 4 == 3)
                      ? dSize.height * 0.35
                      : dSize.height * 0.3);
            },
            itemBuilder: (context, index) {
              final shoe = snapshot.data![index];
              return CustomGridTiel(
                  imageUrl: shoe.imageUrl[1],
                  name: shoe.name,
                  price: shoe.price);
            },
          );
        }
      },
    );
  }
}
