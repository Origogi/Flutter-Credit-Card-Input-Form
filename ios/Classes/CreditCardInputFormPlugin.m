#import "CreditCardInputFormPlugin.h"
#if __has_include(<credit_card_input_form/credit_card_input_form-Swift.h>)
#import <credit_card_input_form/credit_card_input_form-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "credit_card_input_form-Swift.h"
#endif

@implementation CreditCardInputFormPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCreditCardInputFormPlugin registerWithRegistrar:registrar];
}
@end
