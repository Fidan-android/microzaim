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
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox.shrink(),
                        ],
                      ),
                    ),
                    Expanded(child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
                          child: Center(
                            child: SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {},
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
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
