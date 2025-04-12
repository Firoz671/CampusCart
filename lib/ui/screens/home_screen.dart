import 'package:campus_cart/ui/screens/product_screen.dart';
import 'package:campus_cart/ui/screens/widgets/custom_text_form_field.dart';
import 'package:campus_cart/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTextFormField(
            controller: TextEditingController(),
            obscureText: false,
            suffixIcon: Icon(
              Icons.search,
              size: 40,
            ),
          ),
          Text(
            'All Products',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 10,
                shrinkWrap: true,
                primary: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: _onTapProduct,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(color: AppColors.whiteColor),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              'assets/images/potato.jpg',
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
                                '800 TK',
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
                }),
          )
        ],
      ),
    );
  }
  void  _onTapProduct(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen()));
  }
}
