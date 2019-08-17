@interface SBCoverSheetSlidingViewController
-(void)_dismissCoverSheetAnimated:(BOOL)arg1 withCompletion:(id)arg2;
-(void)_presentCoverSheetAnimated:(BOOL)arg1 withCompletion:(id)arg2;
@end

@interface SBCoverSheetPresentationManager
@property(retain, nonatomic) SBCoverSheetSlidingViewController *coverSheetSlidingViewController;
@property(retain, nonatomic) SBCoverSheetSlidingViewController *secureAppSlidingViewController;
+(id)sharedInstance;
-(BOOL)isVisible;
-(BOOL)isInSecureApp;
@end

@interface SBUIPluginManager
+ (id)sharedInstance;
- (void)handleButtonUpEventFromSource:(int)source;
@end

