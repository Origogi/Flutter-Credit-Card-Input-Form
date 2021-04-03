class Captions {
  final Map<String, String> _default = {
    'PREV': 'Prev',
    'NEXT': 'Next',
    'DONE': 'Done',
    'CARD_NUMBER': 'Card Number',
    'CARDHOLDER_NAME': 'Cardholder Name',
    'VALID_THRU': 'Valid Thru',
    'SECURITY_CODE_CVC': 'Security Code (CVC)',
    'NAME_SURNAME': 'Name Surname',
    'MM_YY': 'MM/YY',
    'RESET': 'Reset',
  };

  late Map<String, String> _captions;

  Captions({customCaptions}) {
    _captions = {};
    _captions.addAll(_default);
    if (customCaptions != null) _captions.addAll(customCaptions);
  }

  String? getCaption(String key) {
    return _captions.containsKey(key) ? _captions[key] : key;
  }
}
