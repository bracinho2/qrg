class Coverage {
  String coverage;

  Coverage(
    this.coverage,
  );

  static List<Coverage> getCoverage() {
    return <Coverage>[
      Coverage('Selecione'),
      Coverage('Local'),
      Coverage('Regional'),
      Coverage('Nacional'),
      Coverage('Internacional'),
    ];
  }
}
