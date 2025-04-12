import 'package:campus_cart/ui/screens/contact_seller_screen.dart';
import 'package:campus_cart/ui/screens/widgets/cm_app_bar.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool _isFavourite = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CmAppBar(
        isDivider: false,
        onPressed: _onTapBack,
        icon: Icon(Icons.arrow_back_ios_new),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/potato.jpg'),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Potato title goes here'),
              IconButton(
                  onPressed: _onTapFavouriteIconButton,
                  icon: Icon(
                      _isFavourite ? Icons.favorite : Icons.favorite_border))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Divider(),
          Text(
            'Description',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            'Product Description Goes here...',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Md Jihanur Rahman',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40,
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('Total Price'), Text('800 TK')],
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width * 0.5, size.height * 0.06),
                      maximumSize: Size(size.width * 0.5, size.height * 0.06),
                      fixedSize: Size(size.width * 0.5, size.height * 0.06),
                    ),
                    onPressed: _onTapContactSellerButton,
                    child: Text('Contact Seller'))
              ],
            ),
          )
        ],
      ),
    );
  }

  void _onTapBack() {
    Navigator.pop(context);
  }

  void _onTapFavouriteIconButton() {
    _isFavourite = !_isFavourite;
    setState(() {});
  }

  void _onTapContactSellerButton() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ContactSellerScreen()));
  }
}
