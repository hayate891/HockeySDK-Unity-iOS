#import "HockeyAppUnity.h"
#import "HockeySDK.h"

@interface HockeyAppUnity()

@end

@implementation HockeyAppUnity

+ (void)startManagerWithIdentifier:(NSString *)appIdentifier updateManagerEnabled:(BOOL)updateManagerEnabled{
  
  [[BITHockeyManager sharedHockeyManager] configureWithIdentifier:appIdentifier];
  [[BITHockeyManager sharedHockeyManager] setDisableUpdateManager:!updateManagerEnabled];
  [[BITHockeyManager sharedHockeyManager] startManager];
  [[BITHockeyManager sharedHockeyManager].authenticator authenticateInstallation];
}

+ (void)showFeedbackListView{
  
  [[[BITHockeyManager sharedHockeyManager] feedbackManager] showFeedbackListView];
}

+ (NSString *)appVersion{
  
  return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *)bundleIdentifier;{
  
  return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

@end
