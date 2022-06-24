class Mode {
  String mode;

  Mode(this.mode);

  static List<Mode> getModes() {
    return <Mode>[
      Mode('Selecione'),
      Mode('FM'),
      Mode('BM-DMR'),
      Mode('MS-DMR'),
      Mode('C4FM'),
      Mode('D-Star'),
      Mode('Outro'),
    ];
  }
}
