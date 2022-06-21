import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/repos_result.dart';

class RepoContent extends StatelessWidget {
  final ReposResult item;
  const RepoContent({super.key, required this.item});

  String formatedDateTime(String date) {
    if (date == 'null') return '';
    DateTime dateParsed = DateTime.parse(date);
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    String formatted = formatter.format(dateParsed);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 500,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          margin: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${item.name}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              Text('${item.description}'),
              const Divider(),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${item.language}'),
                        Text('${item.defaultBranch}'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'last update ${formatedDateTime('${item.updatedAt}')}'
                              .toUpperCase(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'pushed ${formatedDateTime('${item.pushedAt}')}'
                              .toUpperCase(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'created ${formatedDateTime('${item.createdAt}')}'
                              .toUpperCase(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
