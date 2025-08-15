abstract interface class UseCase<R, P> {
  Future<R> execute(P params);
}
