enum Menu {
  home(0, 'Home'),
  about(2, 'About'),
  service(1, 'Service'),
  contact(4, 'Contact');

  final String title;
  final int indexValue;

  const Menu(this.indexValue, this.title);
}
