extension EnumExpanded on Enum {
  getValue() => toString().split('.').last;
}
