import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:microzaim/src/conventions/enum/calculations_type.dart';
import 'package:microzaim/src/data/models/debt/debt_model.dart';
import 'package:microzaim/src/data/models/loan/loan_model.dart';
import 'package:microzaim/src/presentation/template/internal_page_template.dart';

class CalculationsInfoPage extends StatefulWidget {
  const CalculationsInfoPage(
      {Key? key,
      required this.calculationsType,
      required this.title,
      this.loanModel,
      this.debtModel})
      : super(key: key);

  final CalculationsType calculationsType;
  final String title;
  final LoanModel? loanModel;
  final DebtModel? debtModel;

  @override
  State<CalculationsInfoPage> createState() => _CalculationsInfoPageState();
}

class _CalculationsInfoPageState extends State<CalculationsInfoPage> {
  @override
  Widget build(BuildContext context) {
    return InternalPageTemplate(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
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
                          widget.title,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox.shrink(),
                    ],
                  ),
                ),
                widget.calculationsType == CalculationsType.loan
                    ? loanInfoWidget(widget.loanModel!)
                    : debtInfoWidget(widget.debtModel!),
                Expanded(
                  child: Container(
                    color: Colors.pink,
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loanInfoWidget(LoanModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 28, left: 24, right: 24),
          child: Text(
            "Итоговый расчет",
            style: Theme.of(context)
                .primaryTextTheme
                .bodyLarge
                ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "Итого к возврату:",
                  style:
                      Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
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
                      model.totalToRefunded.round().toString(),
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyMedium
                          ?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: model.totalToRefunded == 0
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
          padding: const EdgeInsets.only(top: 12, left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "Переплата:",
                  style:
                      Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
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
                      model.overpayment.round().toString(),
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyMedium
                          ?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: model.overpayment == 0
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
          padding: const EdgeInsets.only(top: 28),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color(0xFFE5EBE8),
              ),
              color: const Color(0xFFF1F1F1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 48,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFFE5EBE8),
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _headerOfTableItem("День"),
                      _headerOfTableItem("Ежеднев.\nплатеж"),
                      _headerOfTableItem("%"),
                      _headerOfTableItem("Основ.\nдолг"),
                      _headerOfTableItem("Остаток\nзадолж"),
                    ],
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) => SizedBox(
                    height: 48,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _contentOfTableItem(model.calculations[index].day),
                        _contentOfTableItem(
                            model.calculations[index].dailyPayment),
                        _contentOfTableItem(model.calculations[index].percent),
                        _contentOfTableItem(model.calculations[index].mainDebt),
                        _contentOfTableItem(
                            model.calculations[index].outstandingBalance),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                      color: Color(0xFFE5EBE8),
                    );
                  },
                  itemCount: model.calculations.length,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _headerOfTableItem(String title) {
    return Expanded(
      child: Text(
        title,
        style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(
              fontSize: 14,
              color: const Color(0xFF878987),
            ),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _contentOfTableItem(dynamic data) {
    return Expanded(
      child: Text(
        data.toString(),
        style: const TextStyle(
            color: Color(0xFF0F3F15),
            fontFamily: 'SFProText',
            fontSize: 14,
            fontWeight: FontWeight.w500),
        maxLines: 1,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget debtInfoWidget(DebtModel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                    style:
                        Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
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
                        model.payment.toString(),
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: model.payment == 0
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
                    style:
                        Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
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
                        model.averageIncome.toString(),
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: model.averageIncome == 0
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
                    style:
                        Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
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
                        "${model.debtBurden}%",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: model.debtBurden == 0
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
                    style:
                        Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
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
                        model.monthlyIncome.toString(),
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: model.monthlyIncome == 0
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
        ],
      ),
    );
  }
}
