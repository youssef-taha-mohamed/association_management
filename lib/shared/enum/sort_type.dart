enum SortType {
  asc(name: 'Asc', value: 'ASC'),
  desc(name: 'Desc', value: 'DESC');

  const SortType({
    required this.name,
    required this.value,
  });

  final String name;
  final String value;
}
