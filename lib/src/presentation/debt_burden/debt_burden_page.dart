import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:microzaim/src/data/repository/debt_repository.dart';
import 'package:microzaim/src/domain/state/debt_burden/debt_burden_state.dart';
import 'package:microzaim/src/presentation/custom/edit_text.dart';
import 'package:microzaim/src/presentation/template/internal_page_template.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class DebtBurdenPage extends StatefulWidget {
  const DebtBurdenPage({super.key});

  @override
  State<DebtBurdenPage> createState() => _DebtBurdenPageState();
}

class _DebtBurdenPageState extends State<DebtBurdenPage> {
  late DebtBurdenState _debtBurdenState;
  late List<ReactionDisposer> _disposers;

  final TextEditingController _amountDebtController = TextEditingController();
  final TextEditingController _termDebtController = TextEditingController();
  final TextEditingController _percentageController = TextEditingController();

  @override
  void didChangeDependencies() {
    _debtBurdenState = DebtBurdenState(Provider.of<DebtRepository>(context, listen: false));
    _disposers = [
      reaction((_) => _debtBurdenState.isSaved, (bool isSaved) {
        if (isSaved) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Расчеты успешно сохранены")));
        }
      })
    ];
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    for (var d in _disposers) {
      d();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InternalPageTemplate(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 17),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () => AutoRouter.of(context).pop(),
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "Долговая нагрузка",
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _debtBurdenState.saveCalculation();
                                      },
                                      child: Icon(
                                        Icons.folder_outlined,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: CustomEditText(
                                    maxLength: 10,
                                    mController: _amountDebtController,
                                    mLabel: 'Сумма кредита/займа',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CustomEditText(
                                        mController: _termDebtController,
                                        maxLength: 2,
                                        mLabel: 'Срок кредита/займа',
                                        onChange: (value) {
                                          _debtBurdenState
                                              .updateCountOfAverageIncomes(
                                                  value);
                                        },
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional.centerEnd,
                                        child: Container(
                                          width: 108,
                                          height: 59,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(44),
                                            color: const Color(0xFFBCFE2B),
                                          ),
                                          child: Center(
                                            child: Observer(builder: (_) {
                                              return DropdownButtonFormField<
                                                  String>(
                                                decoration:
                                                    const InputDecoration(
                                                        border:
                                                            InputBorder.none),
                                                elevation: 6,
                                                iconSize: 0.0,
                                                isExpanded: true,
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                value: _debtBurdenState
                                                    .selectedTypeTerm,
                                                dropdownColor:
                                                    const Color(0xFFF1F1F1),
                                                selectedItemBuilder:
                                                    (context) => [
                                                  const SizedBox(
                                                    height: 59,
                                                    child: Center(
                                                      child: Text(
                                                        "Годы",
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 59,
                                                    child: Center(
                                                      child: Text(
                                                        "Месяцы",
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                                items: const [
                                                  DropdownMenuItem(
                                                    value: "Год",
                                                    child: SizedBox(
                                                      height: 59,
                                                      child: Center(
                                                        child: Text(
                                                          "Год",
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: "Месяцы",
                                                    child: SizedBox(
                                                      height: 59,
                                                      child: Center(
                                                        child: Text(
                                                          "Месяцы",
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                                onChanged: (String? value) {
                                                  if (_debtBurdenState
                                                          .selectedTypeTerm !=
                                                      value) {
                                                    _debtBurdenState
                                                        .selectTypeTerm(value!);
                                                    setState(() {
                                                      _termDebtController
                                                          .clear();
                                                    });
                                                  }
                                                },
                                              );
                                            }),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: CustomEditText(
                                    mController: _percentageController,
                                    mLabel: 'Процентная ставка %',
                                    maxLength: 2,
                                  ),
                                ),
                                Observer(
                                  builder: (context) {
                                    return generateInputsByTerm();
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Observer(
                                    builder: (_) => Text(
                                      _debtBurdenState.errorMessage,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: const Color(0xFFFF5959),
                                              fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 20),
                        child: Center(
                          child: SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                _debtBurdenState.doCalculations(
                                    _amountDebtController.text,
                                    _termDebtController.text,
                                    _percentageController.text);
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFFBCFE2B),
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    // Change your radius here
                                    borderRadius: BorderRadius.circular(43),
                                  ),
                                ),
                              ),
                              child: const Text(
                                "Рассчитать",
                                style: TextStyle(
                                  fontFamily: 'SFProText',
                                  color: Color(0xFF0F3F15),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, bottom: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Text(
                                      "Итоговый расчет",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Платеж/мес.",
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      const Color(0xFF878987),
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 35,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFF1F1F1),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(44),
                                              ),
                                            ),
                                            child: Center(
                                              child: Observer(
                                                builder: (_) => Text(
                                                  _debtBurdenState.payment
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: _debtBurdenState
                                                                    .payment ==
                                                                0
                                                            ? const Color(
                                                                0x4D878987)
                                                            : const Color(
                                                                0xFF0F3F15),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Средний доход",
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      const Color(0xFF878987),
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 35,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFF1F1F1),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(44),
                                              ),
                                            ),
                                            child: Center(
                                              child: Observer(
                                                builder: (_) => Text(
                                                  _debtBurdenState.averageIncome
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: _debtBurdenState
                                                                    .averageIncome ==
                                                                0
                                                            ? const Color(
                                                                0x4D878987)
                                                            : const Color(
                                                                0xFF0F3F15),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Долговая нагрузка",
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      const Color(0xFF878987),
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 35,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFF1F1F1),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(44),
                                              ),
                                            ),
                                            child: Center(
                                              child: Observer(
                                                builder: (_) => Text(
                                                  "${_debtBurdenState.debtBurden}%",
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: _debtBurdenState
                                                                    .debtBurden ==
                                                                0
                                                            ? const Color(
                                                                0x4D878987)
                                                            : const Color(
                                                                0xFF0F3F15),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Остаток ежемесячного дохода после выплат",
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      const Color(0xFF878987),
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 35,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFF1F1F1),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(44),
                                              ),
                                            ),
                                            child: Center(
                                              child: Observer(
                                                builder: (_) => Text(
                                                  _debtBurdenState.monthlyIncome
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: _debtBurdenState
                                                                    .monthlyIncome ==
                                                                0
                                                            ? const Color(
                                                                0x4D878987)
                                                            : const Color(
                                                                0xFF0F3F15),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget generateInputsByTerm() {
    debugPrint(_debtBurdenState.averageIncomes.toString());
    List<Widget> list = [];
    for (var i = 0; i < _debtBurdenState.countOfAverageIncomes; i++) {
      list.add(
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: CustomEditText(
            mLabel: 'Среднемесячный доход за ${i + 1}-й год',
            maxLength: 10,
            onChange: (value) {
              _debtBurdenState.updateIncomes(i, value);
            },
          ),
        ),
      );
    }

    return Column(
      children: list,
    );
  }
}
