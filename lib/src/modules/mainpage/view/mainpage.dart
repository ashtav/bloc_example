import 'package:bloc_example/src/routes/paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lazyui/lazyui.dart' hide LzContextExtension;

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Examples'),
      ),
      body: LzListView(children: [
        Column(
          children:
              ['Counter', 'Users (Static)', 'Todos (API)'].generate((item, i) {
            return InkTouch(
              onTap: () {
                switch (i) {
                  case 0:
                    context.push(Paths.counter);
                    break;

                  case 1:
                    context.push(Paths.users);
                    break;

                  case 2:
                    context.push(Paths.todos);
                    break;
                  default:
                }
              },
              padding: Ei.all(20),
              color: Colors.white,
              border: Br.only(['t'], except: i == 0),
              child: Row(
                mainAxisAlignment: Maa.spaceBetween,
                children: [
                  Text(item),
                  const Icon(Ti.chevronRight, color: Colors.black45)
                ],
              ),
            );
          }),
        ).clip(all: 7).border(Br.all(), radius: Br.radius(7))
      ]),
    );
  }
}
