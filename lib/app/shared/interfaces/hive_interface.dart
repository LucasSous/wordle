abstract class IHive<T> {
  Future<T?> get(String key);
  Future<void> put(String key, T? object);
}
