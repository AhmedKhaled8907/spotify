abstract class UseCase<type, params> {
  Future<type> call({params param});
}
