import 'package:campus_cart/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Categories'),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          Divider(),
          ListTile(
            title: Text('Type of Anouncement'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Photos',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Expanded(
              child: GridView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  primary: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: AppColors.seconderyColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.add,
                          size: 120,
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
