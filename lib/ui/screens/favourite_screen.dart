import 'package:campus_cart/data/app_data.dart';
import 'package:campus_cart/ui/screens/product_screen.dart';
import 'package:campus_cart/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GridView.builder(
              itemCount: favouriteItemIndex.length,
              shrinkWrap: true,
              primary: false,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _onTapProduct(index: index);
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(color: AppColors.whiteColor),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            products[favouriteItemIndex[index]]['image'],
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 60, vertical: 4),
                            color: Colors.grey,
                            child: Text(
                              '${products[favouriteItemIndex[index]]['price']} TK',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }

  void _onTapProduct({required int index}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductScreen(
                image: products[favouriteItemIndex[index]]['image'],
                price: products[favouriteItemIndex[index]]['price'],
                productIndex: index)));
  }
}
