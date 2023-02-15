import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../core/widget/base_widget.dart';
import '../../widget/common_widget.dart';
import 'domain_cubit.dart';
import 'domain_state.dart';

class DomainPage extends BaseStatelessWidget<DomainState, DomainCubit> {
  const DomainPage({super.key});

  @override
  Widget buildContent(BuildContext context, StateWrapper<DomainState> state) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Column(
          children: [
            _buildImageLogo('assets/images/logo.png'),
            CusTomTextFieldNoIcon(
              text: 'Nhập vào địa chỉ email...',
              onChanged: (username) =>
                  context.read<DomainCubit>().onUsernameChanged(username),
              isObsCurrentText: false,
            ),
            CustomButton(text: 'Processs', isActive: state.value!.status.isValid , onPressed: null)
          ],
        ),
      ),
    );
  }

  @override
  Color? backgroundColor() => Colors.white;
}

Padding _buildImageLogo(String s) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(110, 50, 110, 50),
    child: Image.asset(s),
  );
}
