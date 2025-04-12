import 'package:campus_cart/ui/screens/widgets/cm_app_bar.dart';
import 'package:flutter/material.dart';

class SellerProfileScreen extends StatefulWidget {
  const SellerProfileScreen({super.key});

  @override
  State<SellerProfileScreen> createState() => _SellerProfileScreenState();
}

class _SellerProfileScreenState extends State<SellerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmAppBar(
          onPressed: _onTapBack,
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          isDivider: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Image.asset(
                    'assets/images/potato.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Md Jihanur Rahman',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                '+8801960690590',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            ListTile(
              leading: Icon(Icons.chat_outlined),
              title: Text(
                'nishak69@icloud.com',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Divider(),
            Text('4.6'),
            Text('Reviews'),
            Divider(),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Rate'))
          ],
        ),
      ),
    );
  }

  void _onTapBack() {
    Navigator.pop(context);
  }
}
