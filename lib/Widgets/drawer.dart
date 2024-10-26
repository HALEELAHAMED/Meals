import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key,required this.onSelect});
  final void Function(String value) onSelect;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                const Icon(
                  Icons.fastfood_rounded,
                  size: 55,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text('Enjoy your fooood',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onSelect('meal');
            },
            leading: const Icon(Icons.fastfood),
            title: Text(
              'Food',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 25),
            ),
          ),

          ListTile(
            onTap: () {
              onSelect('filter');
            },
            leading: const Icon(Icons.settings),
            title: Text(
              'Sorting',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
