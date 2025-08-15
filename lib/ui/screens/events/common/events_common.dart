import 'package:evently/model/category_dm.dart';
import 'package:evently/ui/utils/app_assets.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

buildCategoryImage(CategoryDM selectedCategory, BuildContext context) =>
    ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Image.asset(
        selectedCategory.image,
        height: MediaQuery.of(context).size.height * 0.25,
      ),
    );

buildTitleTextField(TextEditingController titleController) => Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    Text(
      "Event title",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
    ),
    SizedBox(height: 8),
    CustomTextField(
      hint: "Event Title",
      prefixIcon: AppSvg.icTitle,
      controller: titleController,
    ),
  ],
);

buildDescriptionTextField(TextEditingController descriptionController) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Description",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        SizedBox(height: 8),
        CustomTextField(
          hint: "Description",
          minLines: 5,
          controller: descriptionController,
        ),
      ],
    );

buildEventDate({
  required DateTime selectedDate,
  required BuildContext context,
  required Function(DateTime) onDateSelected,
}) => InkWell(
  onTap: () async {
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: selectedDate,
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedDate != null) {
      onDateSelected(pickedDate);
    }
  },
  child: Row(
    children: [
      const Icon(Icons.calendar_month),
      const SizedBox(width: 8),
      Text("Event Date", style: Theme.of(context).textTheme.labelMedium),
      const Spacer(),
      Text(
        "${selectedDate.toLocal()}".split(' ')[0],
        style: Theme.of(context).textTheme.labelMedium,
      ),
    ],
  ),
);

buildEventTime({
  required TimeOfDay selectedTime,
  required BuildContext context,
  required Function(TimeOfDay) onTimeSelected,
}) => InkWell(
  onTap: () async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null) {
      onTimeSelected(pickedTime);
    }
  },
  child: Row(
    children: [
      const Icon(Icons.access_time),
      const SizedBox(width: 8),
      Text("Event Time", style: Theme.of(context).textTheme.labelMedium),
      const Spacer(),
      Text(
        selectedTime.format(context),
        style: Theme.of(context).textTheme.labelMedium,
      ),
    ],
  ),
);

buildEventLocation(BuildContext context) => Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    Text("Location", style: Theme.of(context).textTheme.labelSmall),
    const SizedBox(height: 8),
    Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.blue, width: 2),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.location_searching,
              size: 32,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          const SizedBox(width: 8),
          Text("Cairo, Egypt", style: Theme.of(context).textTheme.labelMedium),
          Spacer(),
          Icon(Icons.arrow_forward_ios, color: AppColors.blue),
        ],
      ),
    ),
  ],
);

buildEventAppbar({
  required BuildContext context,
  required String title,
  List<Widget>? actions = const [],
}) => AppBar(
  title: Text(title, style: Theme.of(context).textTheme.headlineLarge),
  centerTitle: true,
  backgroundColor: Theme.of(context).colorScheme.tertiary,
  iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
  actions: actions,
);
