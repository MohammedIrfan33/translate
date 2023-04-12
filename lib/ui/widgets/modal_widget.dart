import 'package:flutter/material.dart';

import '../../models/language_code_model.dart';
import '../../utils/helper/helper.dart';

class ModalSheet extends StatefulWidget {
  const ModalSheet({
    Key? key,
    required this.itemsList,
  }) : super(key: key);

  final List<LanguageCodeModel>? itemsList;

  @override
  State<ModalSheet> createState() => _ModalSheetState();
}

class _ModalSheetState extends State<ModalSheet> {
  String searchQuery = '';

  int selectedIndex = -1;

 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,
              ),
            ),
            child: Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.search),
                ),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                    onChanged: (query) {
                      setState(() {
                        searchQuery = query;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: widget.itemsList!.length,
              itemBuilder: (context, index) {
                final item = widget.itemsList![index].language!.toLowerCase();
                if (searchQuery.isNotEmpty &&
                    !item.contains(searchQuery.toLowerCase())) {
                  return const SizedBox.shrink();
                }
                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? const  Color(0xfff26609)
                        : Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                      title: Text(getLanguageName(widget.itemsList![index].language!)),
                      onTap: () {
                        selectedIndex = index;

                        Navigator.of(context)
                            .pop(widget.itemsList![index].language!);
                        setState(() {});
                      }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
