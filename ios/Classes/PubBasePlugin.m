#import "PubBasePlugin.h"
#if __has_include(<pub_base/pub_base-Swift.h>)
#import <pub_base/pub_base-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "pub_base-Swift.h"
#endif

@implementation PubBasePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPubBasePlugin registerWithRegistrar:registrar];
}
@end
