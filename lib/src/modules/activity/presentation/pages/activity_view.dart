import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazyui/lazyui.dart';

import '../bloc/activity_bloc.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
      ),
      body: BlocBuilder<ActivityBloc, ActivityState>(
        builder: (context, state) {
          if (state is ActivityLoading) {
            return LzLoader.bar(message: 'Loading...');
          } else if (state is ActivityLoaded) {
            final activities = state.activities;

            if (activities.isEmpty) {
              return const LzNoData(message: 'No data found');
            }

            return Refreshtor(
              onRefresh: () async =>
                  context.read<ActivityBloc>().add(LoadActivities()),
              child: LzListView(
                padding: Ei.zero,
                children: activities.generate((item, i) {
                  bool isCompleted = item.completed ?? false;

                  return InkTouch(
                    onTap: () {},
                    padding: Ei.all(20),
                    border: Br.only(['t'], except: i == 0),
                    child: Row(
                      mainAxisAlignment: Maa.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: isCompleted
                                    ? Colors.green
                                    : Colors.transparent,
                                border: isCompleted ? null : Border.all(),
                                borderRadius: Br.radius(15),
                              ),
                              margin: Ei.only(r: 20),
                            ),
                            Text('${item.todo}').flexible(),
                          ],
                        ).flexible(),
                        Iconr(Ti.x,
                                padding: Ei.all(13),
                                color: Colors.black45,
                                margin: Ei.only(l: 20))
                            .onTap(() {
                          LzConfirm(
                                  title: 'Delete Todo',
                                  message:
                                      'Are you sure want to delete this todo?',
                                  onConfirm: () {})
                              .show(context);
                        })
                      ],
                    ),
                  );
                }),
              ),
            );
          } else if (state is ActivityError) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else {
            // State lain yang mungkin ingin Anda tangani di sini
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
