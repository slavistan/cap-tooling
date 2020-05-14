service Data @(path: '/data') {
  @cds.persistence.skip
  @nokey
  entity Json {
      // WIP;
      // https://answers.sap.com/questions/13048183/disabling-the-default-crud-handlers.html
     // key id: UUID;
      data: String;
  }
}