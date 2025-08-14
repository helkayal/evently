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
      const Text(
        "Event Date",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
      const Spacer(),
      Text(
        "${selectedDate.toLocal()}".split(' ')[0],
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.blue,
        ),
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
      const Text(
        "Event Time",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
      const Spacer(),
      Text(
        selectedTime.format(context),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.blue,
        ),
      ),
    ],
  ),
);

buildEventLocation() => Container();
