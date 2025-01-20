import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tasky/core/constant/skeltonizer_demo_data.dart';
import 'package:tasky/features/home/presentation/cubit/cubit/todo_cubit.dart';
import 'package:tasky/features/home/presentation/widgets/custom_tab.dart';
import 'package:tasky/features/home/presentation/widgets/todo_item_widget.dart';
import 'package:tasky/tasky_enjection.dart';

class HomeContentWidget extends StatefulWidget {
  const HomeContentWidget({super.key});

  @override
  State<HomeContentWidget> createState() => _HomeContentWidgetState();
}

class _HomeContentWidgetState extends State<HomeContentWidget>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Wrap(spacing: 5.w, children: [
              CustomTab(
                  isSelected: selectedIndex == 0,
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  text: 'All'),
              CustomTab(
                  isSelected: selectedIndex == 1,
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  text: 'Completed'),
              CustomTab(
                  isSelected: selectedIndex == 2,
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                  text: 'In Progress'),
              CustomTab(
                  isSelected: selectedIndex == 3,
                  onTap: () {
                    setState(() {
                      selectedIndex = 3;
                    });
                  },
                  text: 'Waiting'),
            ]),
          ),
          BlocProvider(
            create: (context) => ls<TodoCubit>()..getTodos(),
            child: BlocBuilder<TodoCubit, TodoState>(
              builder: (context, state) {
                if (state is TodoLoadingState) {
                  return Flexible(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Skeletonizer(
                          enabled: true,
                          child: TodoItemWidget(todo: SkeltonizerDemoData.doto),
                        );
                      },
                    ),
                  );
                } else if (state is TodoGetedListState) {
                  if (state.todos.isEmpty) {
                    return RefreshIndicator(
                      onRefresh: () async =>
                          BlocProvider.of<TodoCubit>(context).getTodos(),
                      child: const Center(
                        child: Text("No data"),
                      ),
                    );
                  }
                  return Flexible(
                    // height: .5.sh,
                    child: RefreshIndicator(
                      onRefresh: () async =>
                          await BlocProvider.of<TodoCubit>(context).getTodos(),
                      child: ListView.builder(
                        itemCount: state.todos.length,
                        itemBuilder: (context, index) {
                          return TodoItemWidget(todo: state.todos[index]);
                        },
                      ),
                    ),
                  );
                } else if (state is TodoErrorState) {
                  return Center(child: Text(state.message));
                } else {
                  return Skeletonizer(
                    child: Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return TodoItemWidget(todo: SkeltonizerDemoData.doto);
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
