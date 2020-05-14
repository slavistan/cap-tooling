service DataSink @(path: '/') {

  /*
   * Use a volatile entity with a single attribute.
   */
  @cds.persistence.skip
  entity Data {
      key data: String;
  }
}