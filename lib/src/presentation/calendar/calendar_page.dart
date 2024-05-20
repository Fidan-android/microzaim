import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:microzaim/src/data/models/calendar/calendar_model.dart';
import 'package:microzaim/src/data/models/day/day_model.dart';
import 'package:microzaim/src/data/models/month/month_model.dart';
import 'package:microzaim/src/data/repository/calendar_repository.dart';
import 'package:microzaim/src/data/repository/storage_repository.dart';
import 'package:microzaim/src/domain/state/calendar/calendar_state.dart';
import 'package:microzaim/src/helper/months.dart';
import 'package:provider/provider.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late CalendarState _calendarState;

  @override
  void didChangeDependencies() {
    _calendarState = CalendarState(CalendarRepository(),
        Provider.of<StorageRepository>(context, listen: false));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (_) => CupertinoAlertDialog(
                        title: Text(
                          "Удаление импорта\nкалендаря",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyMedium
                              ?.copyWith(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        content: Text(
                          "Вы уверены что хотите удалить данные расчета из календаря?",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyMedium
                              ?.copyWith(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        actions: [
                          // Close the dialog
                          // You can use the CupertinoDialogAction widget instead
                          CupertinoButton(
                            child: const Text('Удалить'),
                            onPressed: () {
                              _calendarState.removeCurrentCalendar();
                              AutoRouter.of(context).pop();
                            },
                          ),
                          CupertinoButton(
                            child: const Text('Отмена'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ),
                    );
                  },
                  child: ValueListenableBuilder(
                    valueListenable:
                        Hive.box<CalendarModel>("calendar_box").listenable(),
                    builder: (context, Box<CalendarModel> box, _) {
                      return SvgPicture.asset(
                        "assets/images/calendar/ic_delete.svg",
                        colorFilter: ColorFilter.mode(
                            box.values.isEmpty
                                ? const Color(0x26000000)
                                : const Color(0xFF000000),
                            BlendMode.srcIn),
                      );
                    },
                  ),
                ),
                Text(
                  "Календарь",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 20),
                ),
                GestureDetector(
                  onTap: () => AutoRouter.of(context).pushNamed("/import-page"),
                  child: SvgPicture.asset(
                    "assets/images/calendar/ic_download.svg",
                    colorFilter: const ColorFilter.mode(
                        Color(0xD90F3F15), BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: <Widget>[
                    Observer(
                      builder: (_) => Visibility(
                        visible: _calendarState.currentDateTime
                                .compareTo(DateTime.now()) ==
                            1,
                        child: GestureDetector(
                          onTap: () => _calendarState.changeCurrentMonth(-1),
                          child: SvgPicture.asset(
                            "assets/images/calendar/ic_left_arrow.svg",
                            colorFilter: const ColorFilter.mode(
                                Color(0xD9000000), BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Observer(
                        builder: (_) => Text(
                          _dateTimeFormatter(_calendarState.currentDateTime),
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 20),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _calendarState.changeCurrentMonth(1),
                      child: SvgPicture.asset(
                        "assets/images/calendar/ic_forward_arrow.svg",
                        colorFilter: const ColorFilter.mode(
                            Color(0xD9000000), BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Остаток",
                      style: Theme.of(context).primaryTextTheme.bodySmall,
                    ),
                    ValueListenableBuilder(
                      valueListenable:
                          Hive.box<CalendarModel>("calendar_box").listenable(),
                      builder: (context, Box<CalendarModel> box, _) {
                        if (box.values.isEmpty) {
                          return Text(
                            "0",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.black, fontSize: 20),
                          );
                        } else {
                          CalendarModel model = box.getAt(0)!;
                          return Text(
                            model.totalToRefunded.toString(),
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.black, fontSize: 20),
                          );
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          ValueListenableBuilder(
            valueListenable:
                Hive.box<CalendarModel>("calendar_box").listenable(),
            builder: (context, Box<CalendarModel> box, _) {
              if (box.values.isEmpty) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/calendar/ic_download.svg",
                          width: 28,
                          height: 32,
                          colorFilter: const ColorFilter.mode(
                              Color(0xD90F3F15), BlendMode.srcIn),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            "Чтобы воспользоваться календарем, импортруйте данные из расчетов",
                            style:
                                Theme.of(context).primaryTextTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                CalendarModel calendarModel = box.getAt(0)!;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Observer(
                      builder: (_) => ListView.builder(
                        itemCount: calendarModel.days.isNotEmpty &&
                                calendarModel.months.isNotEmpty
                            ? months[_calendarState.currentDateTime.month]! + 1
                            : calendarModel.days.isNotEmpty &&
                                    calendarModel.months.isEmpty
                                ? months[_calendarState.currentDateTime.month]
                                : 1,
                        itemBuilder: (context, index) {
                          DateTime loopedDateTime = DateTime(
                              _calendarState.currentDateTime.year,
                              _calendarState.currentDateTime.month,
                              index + 1);
                          DayModel? dayModel = _findCurrentDayModel(
                              loopedDateTime, calendarModel);

                          if (calendarModel.days.isNotEmpty &&
                              calendarModel.months.isNotEmpty) {
                            if (index <
                                months[_calendarState.currentDateTime.month]!) {
                              return GestureDetector(
                                onTap: dayModel != null
                                    ? () => _calendarState.markDailyPayment(
                                        calendarModel, dayModel)
                                    : null,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: dayModel?.isChecked == true
                                          ? const Color(0x33BCFE2B)
                                          : const Color(0xFFF1F1F1),
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                convertDateTimeToString(
                                                    index + 1,
                                                    _calendarState
                                                        .currentDateTime.month,
                                                    _calendarState
                                                        .currentDateTime.year),
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: Text(
                                                  dayModel != null
                                                      ? "Ежедневный платеж: ${dayModel.payment}"
                                                      : "Ежедневный платеж: 0",
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodySmall,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: Text(
                                                  dayModel != null
                                                      ? "Остаток к оплате: ${dayModel.balanceToBePaid}"
                                                      : "Остаток к оплате: 0",
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodySmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 23,
                                            height: 23,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: dayModel?.isChecked == true
                                                  ? const Color(0xD9BCFE2B)
                                                  : Colors.white,
                                              border: Border.all(
                                                color: const Color(0xFFD3D3D3),
                                              ),
                                            ),
                                            child: Visibility(
                                              visible:
                                                  dayModel?.isChecked ?? false,
                                              child: SvgPicture.asset(
                                                "assets/images/calendar/ic_checked.svg",
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(top: 16, bottom: 20),
                                child: Observer(
                                  builder: (_) {
                                    MonthModel? monthModel =
                                        _lastPaymentOfMonth(
                                            _calendarState.currentDateTime,
                                            calendarModel);
                                    return GestureDetector(
                                      onTap: monthModel != null
                                          ? () =>
                                              _calendarState.markMonthlyPayment(
                                                  calendarModel, monthModel)
                                          : null,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Container(
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: monthModel?.isChecked == true
                                                ? const Color(0x33BCFE2B)
                                                : const Color(0xFFF1F1F1),
                                            borderRadius:
                                                BorderRadius.circular(32),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      _dateTimeFormatter(
                                                          _calendarState
                                                              .currentDateTime),
                                                      style: Theme.of(context)
                                                          .primaryTextTheme
                                                          .bodyMedium
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8),
                                                      child: Text(
                                                        "Ежемесячный платеж: ${monthModel?.payment ?? 0}",
                                                        style: Theme.of(context)
                                                            .primaryTextTheme
                                                            .bodySmall,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8),
                                                      child: Text(
                                                        "Остаток к оплате: ${monthModel?.balanceToBePaid ?? 0}",
                                                        style: Theme.of(context)
                                                            .primaryTextTheme
                                                            .bodySmall,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: 23,
                                                  height: 23,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color:
                                                        monthModel?.isChecked ==
                                                                true
                                                            ? const Color(
                                                                0xD9BCFE2B)
                                                            : Colors.white,
                                                    border: Border.all(
                                                      color: const Color(
                                                          0xFFD3D3D3),
                                                    ),
                                                  ),
                                                  child: Visibility(
                                                    visible:
                                                        monthModel?.isChecked ??
                                                            false,
                                                    child: SvgPicture.asset(
                                                      "assets/images/calendar/ic_checked.svg",
                                                      fit: BoxFit.scaleDown,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          } else if (calendarModel.days.isNotEmpty &&
                              calendarModel.months.isEmpty) {
                            return GestureDetector(
                              onTap: dayModel != null
                                  ? () => _calendarState.markDailyPayment(
                                      calendarModel, dayModel)
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: dayModel?.isChecked == true
                                        ? const Color(0x33BCFE2B)
                                        : const Color(0xFFF1F1F1),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              convertDateTimeToString(
                                                  index + 1,
                                                  _calendarState
                                                      .currentDateTime.month,
                                                  _calendarState
                                                      .currentDateTime.year),
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 8),
                                              child: Text(
                                                dayModel != null
                                                    ? "Ежедневный платеж: ${dayModel.payment}"
                                                    : "Ежедневный платеж: 0",
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .bodySmall,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 8),
                                              child: Text(
                                                dayModel != null
                                                    ? "Остаток к оплате: ${dayModel.balanceToBePaid}"
                                                    : "Остаток к оплате: 0",
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .bodySmall,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: 23,
                                          height: 23,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: dayModel?.isChecked == true
                                                ? const Color(0xD9BCFE2B)
                                                : Colors.white,
                                            border: Border.all(
                                              color: const Color(0xFFD3D3D3),
                                            ),
                                          ),
                                          child: Visibility(
                                            visible:
                                                dayModel?.isChecked ?? false,
                                            child: SvgPicture.asset(
                                              "assets/images/calendar/ic_checked.svg",
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 20),
                              child: Observer(
                                builder: (_) {
                                  MonthModel? monthModel = _lastPaymentOfMonth(
                                      _calendarState.currentDateTime,
                                      calendarModel);
                                  return GestureDetector(
                                    onTap: monthModel != null
                                        ? () =>
                                            _calendarState.markMonthlyPayment(
                                                calendarModel, monthModel)
                                        : null,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: monthModel?.isChecked == true
                                              ? const Color(0x33BCFE2B)
                                              : const Color(0xFFF1F1F1),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _dateTimeFormatter(
                                                        _calendarState
                                                            .currentDateTime),
                                                    style: Theme.of(context)
                                                        .primaryTextTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8),
                                                    child: Text(
                                                      "Ежемесячный платеж: ${monthModel?.payment ?? 0}",
                                                      style: Theme.of(context)
                                                          .primaryTextTheme
                                                          .bodySmall,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8),
                                                    child: Text(
                                                      "Остаток к оплате: ${monthModel?.balanceToBePaid ?? 0}",
                                                      style: Theme.of(context)
                                                          .primaryTextTheme
                                                          .bodySmall,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                width: 23,
                                                height: 23,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: monthModel
                                                              ?.isChecked ==
                                                          true
                                                      ? const Color(0xD9BCFE2B)
                                                      : Colors.white,
                                                  border: Border.all(
                                                    color:
                                                        const Color(0xFFD3D3D3),
                                                  ),
                                                ),
                                                child: Visibility(
                                                  visible:
                                                      monthModel?.isChecked ??
                                                          false,
                                                  child: SvgPicture.asset(
                                                    "assets/images/calendar/ic_checked.svg",
                                                    fit: BoxFit.scaleDown,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  MonthModel? _lastPaymentOfMonth(
      DateTime dateTime, CalendarModel calendarModel) {
    MonthModel? monthModel;
    for (var i = 0; i < calendarModel.months.length; i++) {
      if (calendarModel.months[i].dateTime.year == dateTime.year &&
          calendarModel.months[i].dateTime.month == dateTime.month) {
        monthModel = calendarModel.months[i];
      }
    }
    return monthModel;
  }

  DayModel? _findCurrentDayModel(
      DateTime dateTime, CalendarModel calendarModel) {
    DayModel? dayModel;
    for (var i = 0; i < calendarModel.days.length; i++) {
      if (calendarModel.days[i].dateTime.year == dateTime.year &&
          calendarModel.days[i].dateTime.month == dateTime.month &&
          calendarModel.days[i].dateTime.day == dateTime.day) {
        dayModel = calendarModel.days[i];
        break;
      }
    }
    return dayModel;
  }

  String _dateTimeFormatter(DateTime dateTime) {
    switch (dateTime.month) {
      case DateTime.january:
        {
          return "Январь ${dateTime.year}";
        }
      case DateTime.february:
        {
          return "Февраль ${dateTime.year}";
        }
      case DateTime.march:
        {
          return "Март ${dateTime.year}";
        }
      case DateTime.april:
        {
          return "Апрель ${dateTime.year}";
        }
      case DateTime.may:
        {
          return "Май ${dateTime.year}";
        }
      case DateTime.june:
        {
          return "Июнь ${dateTime.year}";
        }
      case DateTime.july:
        {
          return "Июль ${dateTime.year}";
        }
      case DateTime.august:
        {
          return "Август ${dateTime.year}";
        }
      case DateTime.september:
        {
          return "Сентябрь ${dateTime.year}";
        }
      case DateTime.october:
        {
          return "Октбярь ${dateTime.year}";
        }
      case DateTime.november:
        {
          return "Ноябрь ${dateTime.year}";
        }
      case DateTime.december:
        {
          return "Декабрь ${dateTime.year}";
        }
      default:
        {
          return "";
        }
    }
  }

  String convertDateTimeToString(int day, int month, int year) {
    switch (month) {
      case DateTime.january:
        {
          return "$day января $year";
        }
      case DateTime.february:
        {
          return "$day февраля $year";
        }
      case DateTime.march:
        {
          return "$day марта $year";
        }
      case DateTime.april:
        {
          return "$day апреля $year";
        }
      case DateTime.may:
        {
          return "$day мая $year";
        }
      case DateTime.june:
        {
          return "$day июня $year";
        }
      case DateTime.july:
        {
          return "$day июля $year";
        }
      case DateTime.august:
        {
          return "$day августа $year";
        }
      case DateTime.september:
        {
          return "$day сентября $year";
        }
      case DateTime.october:
        {
          return "$day октября $year";
        }
      case DateTime.november:
        {
          return "$day ноября $year";
        }
      case DateTime.december:
        {
          return "$day декабря $year";
        }
      default:
        {
          return "";
        }
    }
  }
}
