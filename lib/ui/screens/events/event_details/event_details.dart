import 'package:evently/data/firestore_utils.dart';
import 'package:evently/model/category_dm.dart';
import 'package:evently/model/event_dm.dart';
import 'package:evently/ui/screens/events/common/events_common.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventDetails extends StatefulWidget {
  final EventDM event;
  const EventDetails({super.key, required this.event});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 10,
            children: [
              buildCategoryImage(
                CategoryDM.fromTitle(widget.event.categoryId),
                context,
              ),
              buildTitle(),
              buildDateTime(),
              buildLocation(),
              buildDescription(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppbar(BuildContext context) {
    return buildEventAppbar(
      context: context,
      title: 'Event Details',
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(context, AppRoutes.editEvent(widget.event));
          },
          icon: Icon(
            Icons.edit_outlined,
            size: 24,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        IconButton(
          onPressed: () async {
            final navigator = Navigator.of(context);
            await deleteEventFromFirestore(widget.event.id);
            navigator.pop();
          },
          icon: Icon(Icons.delete_outline, size: 24, color: AppColors.red),
        ),
      ],
    );
  }

  Widget buildTitle() {
    return Text(
      widget.event.title,
      style: Theme.of(context).textTheme.headlineLarge,
      textAlign: TextAlign.center,
    );
  }

  Widget buildDateTime() {
    return Container(
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
              Icons.calendar_month_outlined,
              size: 32,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.event.date.day} ${getMonthName(widget.event.date.month)} ${widget.event.date.year}",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 4),
              Text(
                "${widget.event.date.hour}:${widget.event.date.minute.toString().padLeft(2, '0')}",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLocation() {
    return Container();
  }

  Widget buildDescription() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description", style: Theme.of(context).textTheme.labelSmall),
          const SizedBox(height: 8),
          Text(
            widget.event.description,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }

  String getMonthName(int monthNumber) {
    final date = DateTime(2025, monthNumber);
    return DateFormat.MMMM().format(date);
  }
}
