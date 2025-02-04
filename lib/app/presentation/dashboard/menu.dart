enum Menu {
  home(0, 'Home'),
  about(3, 'About'),
  service(2, 'Service'),
  contact(4, 'Contact');

  final String title;
  final int indexValue;

  const Menu(this.indexValue, this.title);
}
