import 'package:evently/data/firestore_utils.dart';
import 'package:evently/model/category_dm.dart';
import 'package:evently/model/user_dm.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_routes.dart';
import 'package:evently/ui/widgets/category_tabs.dart';
import 'package:evently/ui/widgets/event_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  CategoryDM selectedCategory = CategoryDM.homeCategories[0];
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildHeader(),
        Expanded(child: buildEventsList()),
      ],
    );
  }

  buildHeader() => Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.blue,
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
    ),
    child: Column(
      children: [buildUserInfo(), SizedBox(height: 8), buildCategoriesTabs()],
    ),
  );

  buildUserInfo() => Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome Back ✨ $number",
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          Text(
            UserDM.currentUser!.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.white),
              Text(
                "Cairo, Egypt",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      Spacer(),
      Icon(Icons.language, color: Colors.white),
      Icon(Icons.light_mode, color: Colors.white),
    ],
  );

  buildCategoriesTabs() => CategoryTabs(
    categories: CategoryDM.homeCategories,
    onTabSelected: (category) {
      selectedCategory = category;
      setState(() {});
    },
    selectedTabBg: AppColors.white,
    selectedTabTextColor: AppColors.blue,
    unselectedTabBg: AppColors.blue,
    unselectedTabTextColor: AppColors.white,
  );

  buildEventsList() => StreamBuilder(
    stream: getAllEventsFromFirestore(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Center(child: Text(snapshot.error.toString()));
      } else if (snapshot.hasData) {
        var events = snapshot.data!;
        if (selectedCategory.title != "All") {
          events = events.where((event) {
            return event.categoryId == selectedCategory.title;
          }).toList();
        }
        return ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            return Slidable(
              key: ValueKey(event.id),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (_) async {
                      await deleteEventFromFirestore(event.id);
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: (_) {
                      Navigator.push(context, AppRoutes.editEvent(event));
                    },
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Edit',
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, AppRoutes.eventDetails(event));
                },
                child: EventWidget(eventDM: event),
              ),
            );
          },
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
  );
}
