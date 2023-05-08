class CalendarWidget {
  static const Set<String> weekdaysName = {
    'ПН',
    'ВТ',
    'СР',
    'ЧТ',
    'ПТ',
    'СБ',
    'ВС'
  };
  static const Set<String> monthsName = {
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь'
  };
  late DateTime _nowDay;
  late DateTime selectDay;

  late DateTime _firstDayOfMonth;
  late DateTime _lastDayOfMonth;

  CalendarWidget() {
    _nowDay = DateTime.now();

    _firstDayOfMonth = DateTime(_nowDay.year, _nowDay.month, 1);
    _lastDayOfMonth = DateTime(_nowDay.year, _nowDay.month + 1, 0);

    selectDay = _nowDay;
  }

  get lastDayOfMonth => _lastDayOfMonth;

  get firstDayOfMonth => _firstDayOfMonth;

  get nowDay => _nowDay;
}
