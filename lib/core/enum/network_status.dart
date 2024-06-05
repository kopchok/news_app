enum NetworkStatus {
  init,
  loading,
  success,
  error,
}

extension NetworkStatusExtension on NetworkStatus {
  bool get isInit => this == NetworkStatus.init;
  bool get isLoading => this == NetworkStatus.loading;
  bool get isSuccess => this == NetworkStatus.success;
  bool get isError => this == NetworkStatus.error;
}
