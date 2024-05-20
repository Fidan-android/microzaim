import 'package:auto_route/auto_route.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:microzaim/src/data/repository/lender_repository.dart';
import 'package:microzaim/src/data/repository/loan_repository.dart';
import 'package:microzaim/src/domain/state/loan/loan_state.dart';
import 'package:microzaim/src/presentation/template/internal_page_template.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class LoanPage extends StatefulWidget {
  const LoanPage({super.key});

  @override
  State<LoanPage> createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  final TextEditingController _lenderEditingController =
      TextEditingController();
  final TextEditingController _amountLoanController = TextEditingController();
  final TextEditingController _termLoanController = TextEditingController();
  final TextEditingController _percentagePerDayController =
      TextEditingController();
  final GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  late LoanState _loanState;
  late List<ReactionDisposer> _disposers;

  @override
  void didChangeDependencies() {
    _loanState = LoanState(
        Provider.of<LenderRepository>(context, listen: false),
        Provider.of<LoanRepository>(context, listen: false));
    _disposers = [
      reaction((_) => _loanState.isSaved, (bool isSaved) {
        if (isSaved) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Расчеты успешно сохранены")));
        }
      }),
      /*reaction((_) => _loanState.selectedLender, (value) {
        debugPrint("lender from reaction: $value");
        setState(() {
          _lenderEditingController.text = value;
        });
      })*/
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
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 117),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Card(
                                          color: const Color(0xFFF1F1F1),
                                          elevation: 0,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(44),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: SizedBox(
                                              height: 59,
                                              child: TextFormField(
                                                controller:
                                                    _amountLoanController,
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      10),
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                decoration: InputDecoration(
                                                  labelText: 'Сумма займа',
                                                  border: InputBorder.none,
                                                  labelStyle: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: const Color(
                                                            0x4D0F3F15),
                                                      ),
                                                ),
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xFF0F3F15),
                                                    ),
                                                onTapOutside: (event) {
                                                  FocusScopeNode currentFocus =
                                                      FocusScope.of(context);
                                                  if (!currentFocus
                                                      .hasPrimaryFocus) {
                                                    currentFocus.unfocus();
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Card(
                                          color: const Color(0xFFF1F1F1),
                                          elevation: 0,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(44),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: SizedBox(
                                              height: 59,
                                              child: TextFormField(
                                                controller: _termLoanController,
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      3),
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                decoration: InputDecoration(
                                                  labelText: 'Срок займа',
                                                  border: InputBorder.none,
                                                  labelStyle: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: const Color(
                                                            0x4D0F3F15),
                                                      ),
                                                ),
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xFF0F3F15),
                                                    ),
                                                onTapOutside: (event) {
                                                  FocusScopeNode currentFocus =
                                                      FocusScope.of(context);
                                                  if (!currentFocus
                                                      .hasPrimaryFocus) {
                                                    currentFocus.unfocus();
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Card(
                                          color: const Color(0xFFF1F1F1),
                                          elevation: 0,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(44),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: SizedBox(
                                              height: 59,
                                              child: TextFormField(
                                                controller:
                                                    _percentagePerDayController,
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      2),
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                decoration: InputDecoration(
                                                  labelText: 'Процент в день',
                                                  border: InputBorder.none,
                                                  labelStyle: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: const Color(
                                                            0x4D0F3F15),
                                                      ),
                                                ),
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xFF0F3F15),
                                                    ),
                                                onTapOutside: (event) {
                                                  FocusScopeNode currentFocus =
                                                      FocusScope.of(context);
                                                  if (!currentFocus
                                                      .hasPrimaryFocus) {
                                                    currentFocus.unfocus();
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Observer(
                                          builder: (_) => Text(
                                            _loanState.errorMessage,
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    color:
                                                        const Color(0xFFFF5959),
                                                    fontWeight:
                                                        FontWeight.w400),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 50),
                                  child: Column(
                                    children: [
                                      Card(
                                        color: const Color(0xFFF1F1F1),
                                        elevation: 0,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(44),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: SizedBox(
                                            height: 59,
                                            child: TextFormField(
                                              controller:
                                                  _lenderEditingController,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(100)
                                              ],
                                              decoration: InputDecoration(
                                                labelText: 'Займодатель',
                                                border: InputBorder.none,
                                                labelStyle: Theme.of(context)
                                                    .primaryTextTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0x4D0F3F15),
                                                    ),
                                              ),
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        const Color(0xFF0F3F15),
                                                  ),
                                              onChanged: (value) => _loanState
                                                  .searchLender(value),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Observer(
                                        builder: (_) => Visibility(
                                          visible:
                                              _loanState.lenders.isNotEmpty,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 12),
                                            child: Card(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: Color(
                                                              0xFFE5EBE8)),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(44),
                                                      )),
                                              color: const Color(0xFFF1F1F1),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: ConstrainedBox(
                                                  constraints:
                                                      const BoxConstraints(
                                                          maxHeight: 180),
                                                  child: ListView.separated(
                                                    shrinkWrap: true,
                                                    itemCount: _loanState
                                                        .lenders.length,
                                                    itemBuilder: (_, index) =>
                                                        GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          _lenderEditingController
                                                                  .text =
                                                              _loanState
                                                                      .lenders[
                                                                  index];
                                                        });
                                                        _loanState.onChangeItem(
                                                            index);
                                                      },
                                                      child: SizedBox(
                                                        height: 45,
                                                        child: Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 24,
                                                                  top: 12,
                                                                  bottom: 12),
                                                          child: Text(
                                                            _loanState
                                                                .lenders[index],
                                                            style: Theme.of(
                                                                    context)
                                                                .primaryTextTheme
                                                                .bodyMedium
                                                                ?.copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    separatorBuilder:
                                                        (context, index) {
                                                      return const Divider(
                                                        thickness: 1,
                                                        color:
                                                            Color(0xFFE5EBE8),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                                        "Расчет займа",
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
                                        _loanState.saveCalculation(
                                            _lenderEditingController.text);
                                      },
                                      child: Icon(
                                        Icons.folder_outlined,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
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
                              onPressed: () => _loanState.doCalculations(
                                  _lenderEditingController.text,
                                  _amountLoanController.text,
                                  _termLoanController.text,
                                  _percentagePerDayController.text),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFFBCFE2B),
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    // Change your radius here
                                    borderRadius: BorderRadius.circular(44),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
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
                                            "Итого к возврату:",
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
                                                builder: (_) => Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 8),
                                                  child: Text(
                                                    _loanState.totalToRefunded
                                                        .round()
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .primaryTextTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: _loanState.totalToRefunded ==
                                                                  0
                                                              ? const Color(
                                                                  0x4D878987)
                                                              : const Color(
                                                                  0xFF0F3F15),
                                                        ),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                            "Переплата:",
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
                                                  _loanState.overpayment
                                                      .round()
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: _loanState
                                                                    .overpayment ==
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
                Observer(
                  builder: (_) => Visibility(
                    visible: _loanState.calculations.isNotEmpty,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24),
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _contentOfTableItem(
                                          _loanState.calculations[index].day),
                                      _contentOfTableItem(_loanState
                                          .calculations[index].dailyPayment),
                                      _contentOfTableItem(_loanState
                                          .calculations[index].percent),
                                      _contentOfTableItem(_loanState
                                          .calculations[index].mainDebt),
                                      _contentOfTableItem(_loanState
                                          .calculations[index]
                                          .outstandingBalance),
                                    ],
                                  ),
                                ),
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    thickness: 1,
                                    color: Color(0xFFE5EBE8),
                                  );
                                },
                                itemCount: _loanState.calculations.length,
                              ),
                            ],
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
