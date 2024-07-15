import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Formatters {
  static MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(
      mask: '+998 (##) ###-##-##',
      filter: {'#': RegExp(r'[\+0-9]')},
      type: MaskAutoCompletionType.lazy);
  static final cardNumberFormatter = MaskTextInputFormatter(
      mask: '#### #### #### ####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  static final cardExpirationDateFormatter = MaskTextInputFormatter(
      mask: '##/##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
}
