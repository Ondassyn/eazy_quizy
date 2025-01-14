abstract class DispatcherState {}

class DispatcherLoading extends DispatcherState {}

class DispatcherError extends DispatcherState {}

class IsHost extends DispatcherState {}

class IsGuest extends DispatcherState {}

class UnknownRole extends DispatcherState {}
