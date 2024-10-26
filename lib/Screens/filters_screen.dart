import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Provider/favorite_provider.dart';
import 'package:meals/Provider/filter_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avtiveFilter = ref.watch(filterprovider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: avtiveFilter[Filters.isGlutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterprovider.notifier)
                  .filter(Filters.isGlutenFree, isChecked);
            },
            activeColor: Colors.red,
            title: const Text('GlutenFree'),
            subtitle: const Text('GlutenFree Food'),
          ),
          SwitchListTile(
            value: avtiveFilter[Filters.isVegitarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filterprovider.notifier)
                  .filter(Filters.isVegitarian, isChecked);
            },
            activeColor: Colors.red,
            title: const Text('Vegetarian'),
            subtitle: const Text('Vegetarian Food'),
          ),
          SwitchListTile(
            value: avtiveFilter[Filters.isVegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filterprovider.notifier)
                  .filter(Filters.isVegan, isChecked);
            },
            activeColor: Colors.red,
            title: const Text('Vegan'),
            subtitle: const Text('Vegan Food'),
          ),
          SwitchListTile(
            value: avtiveFilter[Filters.isLactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterprovider.notifier)
                  .filter(Filters.isLactoseFree, isChecked);
            },
            activeColor: Colors.red,
            title: const Text('Lactose Free'),
            subtitle: const Text('Food with no Lactose'),
          ),
        ],
      ),
    );
  }
}
