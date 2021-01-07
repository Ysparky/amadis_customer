import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/core/widgets/custom_form_field.dart';
import 'package:amadis_customer/features/sign_up/sign_up_view_model.dart';
import 'package:amadis_customer/features/sign_up/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientCodePage extends StatelessWidget {
  const ClientCodePage({Key key, this.totalHeight}) : super(key: key);

  final double totalHeight;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SignUpViewModel>(context);
    return Container(
      child: Form(
        key: viewModel.clientCodeKey,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: totalHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: wp(7),
                      vertical: hp(2.5),
                    ),
                    child: Column(
                      children: [
                        FieldColumn(
                          inputText: 'Código de cliente',
                          customFormField: CustomFormField(
                            textController: viewModel.clientCodeController,
                            validator: viewModel.clientCodeValidator,
                            hintText: 'Código de cliente',
                            suffixIcon: Icon(Icons.lock_open),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  BottomButtons(
                    firstText2: 'Regresar',
                    secondText: 'Validar',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
