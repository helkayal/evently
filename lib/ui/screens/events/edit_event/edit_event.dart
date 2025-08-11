import 'package:evently/data/firestore_utils.dart';
import 'package:evently/model/category_dm.dart';
import 'package:evently/model/event_dm.dart';
import 'package:evently/model/user_dm.dart';
import 'package:evently/ui/screens/events/common/events_common.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/dialog_utils.dart';
import 'package:evently/ui/widgets/category_tabs.dart';
import 'package:evently/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class EditEvent extends StatefulWidget {
  final EventDM event;
  const EditEvent({super.key, required this.event});

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late CategoryDM selectedCategory;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    EventDM event = widget.event;
    titleController.text = event.title;
    descriptionController.text = event.description;
    selectedCategory = CategoryDM.fromTitle(event.categoryId);
    selectedDate = event.date;
    selectedTime = TimeOfDay.fromDateTime(event.date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            children: [
              buildCategoryImage(selectedCategory, context),
              buildCategoryTabs(),
              buildTitleTextField(titleController),
              buildDescriptionTextField(descriptionController),
              buildEventDate(
                selectedDate: selectedDate,
                context: context,
                onDateSelected: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
              buildEventTime(
                selectedTime: selectedTime,
                context: context,
                onTimeSelected: (time) {
                  setState(() {
                    selectedTime = time;
                  });
                },
              ),
              buildEventLocation(),
              buildEditEventButton(),
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar() => AppBar(title: Text("Edit Event"));

  buildCategoryTabs() => CategoryTabs(
    categories: CategoryDM.createEventsCategories,
    initialSelectedCategory: CategoryDM.createEventsCategories.firstWhere(
      (c) => c.title == widget.event.categoryId,
    ),
    onTabSelected: (category) {
      selectedCategory = category;
      setState(() {});
    },
    selectedTabBg: AppColors.blue,
    selectedTabTextColor: AppColors.white,
    unselectedTabBg: AppColors.white,
    unselectedTabTextColor: AppColors.blue,
  );

  buildEditEventButton() => CustomButton(
    text: "Save event",
    onClick: () async {
      showLoading(context);
      selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
      );
      EventDM eventDM = EventDM(
        id: widget.event.id,
        title: titleController.text,
        categoryId: selectedCategory.title,
        date: selectedDate,
        description: descriptionController.text,
        ownerId: UserDM.currentUser!.id,
      );
      await editEventInFirestore(eventDM);
      if (!mounted) return;
      Navigator.pop(context); // hide loading
      Navigator.pop(context); // Close screen
    },
  );
}
