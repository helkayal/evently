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

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  CategoryDM selectedCategory = CategoryDM.createEventsCategories[0];
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildEventAppbar(context: context, title: 'Create Event'),
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
              buildEventLocation(context),
              buildAddEventButton(),
            ],
          ),
        ),
      ),
    );
  }

  buildCategoryTabs() => CategoryTabs(
    categories: CategoryDM.createEventsCategories,
    onTabSelected: (category) {
      selectedCategory = category;
      setState(() {});
    },
    selectedTabBg: AppColors.blue,
    selectedTabTextColor: AppColors.white,
    unselectedTabBg: AppColors.white,
    unselectedTabTextColor: AppColors.blue,
  );

  buildAddEventButton() => CustomButton(
    text: "Add event",
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
        id: "",
        //This id is retrieved from firestore
        title: titleController.text,
        categoryId: selectedCategory.title,
        date: selectedDate,
        description: descriptionController.text,
        ownerId: UserDM.currentUser!.id,
      );
      await addEventToFirestore(eventDM);
      if (!mounted) return;
      Navigator.pop(context); // hide loading
      Navigator.pop(context); // Close screen
    },
  );
}
