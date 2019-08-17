#import <substrate.h>
#import <UIKit/UIKit.h>
#import <notif.h>
#import <libactivator/libactivator.h>

@interface NotifListener : NSObject <LAListener>
@end

@implementation NotifListener

- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event
{
    // Coversheet toggle from https://www.reddit.com/r/jailbreakdevelopers/comments/82hrqg/best_way_to_present_coversheet_notification/dvavuab?utm_source=share&utm_medium=web2x
    SBCoverSheetPresentationManager *_csController = [%c(SBCoverSheetPresentationManager) sharedInstance];

    if (_csController != nil) {

        SBCoverSheetSlidingViewController *currentSlidingViewController = nil;

        if ([_csController isInSecureApp] && _csController.secureAppSlidingViewController != nil)
            currentSlidingViewController = _csController.secureAppSlidingViewController;
        else if (_csController.coverSheetSlidingViewController != nil)
            currentSlidingViewController = _csController.coverSheetSlidingViewController;

        if (currentSlidingViewController != nil) {
            if ([_csController isVisible])
                [currentSlidingViewController _dismissCoverSheetAnimated:YES withCompletion:nil];
            else
                [currentSlidingViewController _presentCoverSheetAnimated:YES withCompletion:nil];
        }
    }
    [[%c(SBUIPluginManager) sharedInstance] handleButtonUpEventFromSource:1];
    [event setHandled:YES];
}


+ (void)load
{
    @autoreleasepool {
        [LASharedActivator registerListener:[self new] forName:@"com.amooose.notiftoggle"];
    }
}

- (NSString *)activator:(LAActivator *)activator requiresLocalizedTitleForListenerName:(NSString *)listenerName {
    return @"Notification Center Toggle";
}
- (NSString *)activator:(LAActivator *)activator requiresLocalizedDescriptionForListenerName:(NSString *)listenerName {
    return @"Toggles the Notification Center (aka Cover Sheet)";
}
- (NSArray *)activator:(LAActivator *)activator requiresCompatibleEventModesForListenerWithName:(NSString *)listenerName {
    return [NSArray arrayWithObjects:@"springboard", @"lockscreen", @"application", nil];
}
@end

