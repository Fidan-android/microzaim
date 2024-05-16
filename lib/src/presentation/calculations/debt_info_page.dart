import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:microzaim/src/data/models/debt/debt_model.dart';
import 'package:microzaim/src/data/repository/import_repository.dart';
import 'package:microzaim/src/domain/state/calculations/calculations_state.dart';
import 'package:microzaim/src/presentation/template/internal_page_template.dart';
import 'package:mobx/mobx.dart';

class DebtInfoPage extends StatefulWidget {
  const DebtInfoPage({Key? key, required this.debtModel}) : super(key: key);

  final DebtModel debtModel;

  @override
  State<DebtInfoPage> createState() => _DebtInfoPageState();
}

class _DebtInfoPageState extends State<DebtInfoPage> {
  late CalculationsState _calculationsState;
  late List<ReactionDisposer> _disposers;

  @override
  void didChangeDependencies() {
    _calculationsState = CalculationsState(ImportRepository());
    _disposers = [
      reaction((_) => _calculationsState.isSaved, (bool? isSaved) {
        if (isSaved == true) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Расчеты успешно сохранены")));
        } else if (isSaved == false) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Вы уже добавили данный расчет в календарь!")));
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
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      widget.debtModel.title,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox.shrink(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28),
                child: Text(
                  "Итоговый расчет",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Платеж/мес.",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF878987),
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
                          child: Text(
                            widget.debtModel.payment.toString(),
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: widget.debtModel.payment == 0
                                      ? const Color(0x4D878987)
                                      : const Color(0xFF0F3F15),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Средний доход",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF878987),
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
                          child: Text(
                            widget.debtModel.averageIncome.toString(),
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: widget.debtModel.averageIncome == 0
                                      ? const Color(0x4D878987)
                                      : const Color(0xFF0F3F15),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Долговая\nнагрузка",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF878987),
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
                          child: Text(
                            "${widget.debtModel.debtBurden}%",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: widget.debtModel.debtBurden == 0
                                      ? const Color(0x4D878987)
                                      : const Color(0xFF0F3F15),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Остаток ежемесячного\nдохода после\nвыплат",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF878987),
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
                          child: Text(
                            widget.debtModel.monthlyIncome.toString(),
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: widget.debtModel.monthlyIncome == 0
                                      ? const Color(0x4D878987)
                                      : const Color(0xFF0F3F15),
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 30),
                      child: Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: 59,
                          child: ElevatedButton(
                            onPressed: () => _calculationsState
                                .saveDebtToImport(widget.debtModel),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                (states) => const Color(0xFFBCFE2B),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  // Change your radius here
                                  borderRadius: BorderRadius.circular(44),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Добавить в Календарь",
                              style: TextStyle(
                                fontFamily: 'SFProText',
                                color: Color(0xFF0F3F15),
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
      ),
    );
  }
}
