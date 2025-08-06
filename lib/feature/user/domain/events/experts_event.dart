// ignore_for_file: public_member_api_docs, sort_constructors_first
enum ExpertsEvent {
  expertStatus('expert-status');

  const ExpertsEvent(this.name);

  final String name;
  static ExpertsEvent? fromName(String name) {
    return values.where((event) => event.name == name).firstOrNull;
  }
}

class ExpertEventPayload {
  final ExpertsEvent event;
  final int id;
  final bool isOnline;
  final bool isBusy;
  final bool isFast;

  ExpertEventPayload({
    required this.event,
    required this.id,
    required this.isOnline,
    required this.isBusy,
    required this.isFast,
  });
  factory ExpertEventPayload.fromMap(
    Map<String, dynamic> json,
    ExpertsEvent event,
  ) {
    switch (event) {
      case ExpertsEvent.expertStatus:
        return ExpertEventPayload(
          event: event,
          id: json['expert_id'] as int,
          // ignore: avoid_bool_literals_in_conditional_expressions
          isOnline: json['is_online'] == 1 ? true : false,
          // ignore: avoid_bool_literals_in_conditional_expressions
          isBusy: json['is_busy'] == 1 ? true : false,
          // ignore: avoid_bool_literals_in_conditional_expressions
          isFast: json['allow_fast_dreams'] == 1 ? true : false,
        );
    }
  }
}
