part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  NotificationState({this.cardList=const [], this.isRead=true});

  final List<VolunteerDbModel> cardList;
  late final bool isRead;


  @override
  // TODO: implement props
  List<Object?> get props => [cardList,isRead];


  NotificationState copyWith({
    List<VolunteerDbModel>? list,
    bool? isRead
  }) {
    return NotificationState(
        cardList: list ?? this.cardList,
        isRead: isRead ?? this.isRead
    );
  }
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MyVolunteeringState &&
              runtimeType == other.runtimeType &&
              cardList == other.cardList&&
              isRead==other.isDone;
}
