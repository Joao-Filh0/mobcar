


abstract class HttpRepository<T>{

  Future<T> get({required String endpoint});

}