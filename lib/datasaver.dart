class datasaver {
  _datasaver() {
    // TODO: implement _datasaver
    throw UnimplementedError();
  }

  static datasaver _app = datasaver();

  static datasaver datasaverapp() {
    return _app;
  }
}
