// The file implements exceptions

class WeatherBaseException implements Exception {
  final String msg;

  const WeatherBaseException([this.msg = 'Weather client exception']);

  @override
  String toString() => msg;
}

class WeatherBadRequestException extends WeatherBaseException {
  WeatherBadRequestException(
      [msg = 'Weather client. Bad request. The code status is not successful'])
      : super(msg);
}

class WeatherFailedReceiveException extends WeatherBaseException {
  WeatherFailedReceiveException(
      [msg = 'Weather client. Failed to retrieve value'])
      : super(msg);
}
