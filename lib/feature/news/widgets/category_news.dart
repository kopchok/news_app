import 'package:flutter/material.dart';
import 'package:news/core/enum/type_news.dart';

class CategoryNews extends StatelessWidget {
  const CategoryNews({super.key, required this.onTap});

  final Function(TypeNews type) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
          itemCount: TypeNews.values.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final type = TypeNews.values[index];
            return GestureDetector(
              onTap: () => onTap.call(type),
              child: Chip(
                visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                label: Text(type.name),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
        ),
      ),
    );
  }
}
