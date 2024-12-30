abstract class UseCase<Type, Params> {
  Future<Type> call({Params params});
}

abstract class UseCaseStream<Type, Params> {
  Stream<List<Type>> call({Params params});
}
