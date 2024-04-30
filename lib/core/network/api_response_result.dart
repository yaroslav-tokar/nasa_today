sealed class ApiResponseResult<T, E extends Exception> {
  const ApiResponseResult();
}

final class ApiSuccessResult<T, E extends Exception> extends ApiResponseResult<T, E> {
  ApiSuccessResult(this.data);
  final T data;
}

final class ApiErrorResult<T, E extends Exception> extends ApiResponseResult<T, E> {
  ApiErrorResult(this.exception);
  final E exception;
}
