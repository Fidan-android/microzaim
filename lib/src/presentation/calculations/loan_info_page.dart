import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:microzaim/src/data/models/loan/loan_model.dart';
import 'package:microzaim/src/data/repository/import_repository.dart';
import 'package:microzaim/src/domain/state/calculations/calculations_state.dart';
import 'package:microzaim/src/presentation/template/internal_page_template.dart';
import 'package:mobx/mobx.dart';

class LoanInfoPage extends StatefulWidget {
  const LoanInfoPage({Key? key, required this.loanModel}) : super(key: key);

  final LoanModel loanModel;

  @override
  State<LoanInfoPage> createState() => _LoanInfoPageState();
}

class _LoanInfoPageState extends State<LoanInfoPage> {
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: () => AutoRouter.of(context).pop(),
                        child: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: Text(
                            widget.loanModel.lender,
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox.shrink(),
                  ],
                ),
              ),
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
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyMedium
                            ?.copyWith(
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
                            widget.loanModel.totalToRefunded.round().toString(),
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: widget.loanModel.totalToRefunded == 0
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
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyMedium
                            ?.copyWith(
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
                            widget.loanModel.overpayment.round().toString(),
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: widget.loanModel.overpayment == 0
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
                              _contentOfTableItem(
                                  widget.loanModel.calculations[index].day),
                              _contentOfTableItem(widget
                                  .loanModel.calculations[index].dailyPayment),
                              _contentOfTableItem(
                                  widget.loanModel.calculations[index].percent),
                              _contentOfTableItem(widget
                                  .loanModel.calculations[index].mainDebt),
                              _contentOfTableItem(widget.loanModel
                                  .calculations[index].outstandingBalance),
                            ],
                          ),
                        ),
                        separatorBuilder: (context, index) {
                          return const Divider(
                            thickness: 1,
                            color: Color(0xFFE5EBE8),
                          );
                        },
                        itemCount: widget.loanModel.calculations.length,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 30, top: 30),
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () =>
                          _calculationsState.saveLoanToImport(widget.loanModel),
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
                        "Добавить в календарь",
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
      ),
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
}
