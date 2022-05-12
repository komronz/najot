part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  NotificationState({required this.cardList});

  final List<VolunteeringModel> cardList;

  @override
  // TODO: implement props
  List<Object?> get props => [cardList];

  NotificationState copyWith({List<VolunteeringModel>? list}) {
    return NotificationState(cardList: list ?? this.cardList);
  }
}
