//====================================================================================================
// Author: Peter Chen
// Created: 6/12/14
// Copyright 2014 Hidoodle
//====================================================================================================

#import "PCSPopupControllerContainer.h"

#define kPopupCornerRadius 10

//====================================================================================================

@interface PCSDarkUnderlayView : UIView
@end

@implementation PCSDarkUnderlayView
- (id)initWithFrame:(CGRect)frame {
   if ((self = [super initWithFrame:frame])) {
      self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.7];
   }
   return self;
}
@end

//====================================================================================================

@interface PCSPopupControllerContainer()



@end

@implementation PCSPopupControllerContainer

+ (void)hidePopupController:(UIViewController *)popupController fromController:(UIViewController *)fromController {
   PCSDarkUnderlayView *underlayView = nil;
   for (UIView *subview in fromController.view.subviews) {
      if ([subview isKindOfClass:[PCSDarkUnderlayView class]]) {
         underlayView = (PCSDarkUnderlayView *) subview;
         break;
      }
   }
   
   [UIView animateWithDuration:0.2 animations:^{
      popupController.view.transform = CGAffineTransformMakeScale(0, 0);
      popupController.view.alpha = 0.5;
      underlayView.alpha = 0;
      
   } completion:^(BOOL finished) {
      [popupController.view removeFromSuperview];
      [popupController removeFromParentViewController];
      
      [underlayView removeFromSuperview];
   }];
}

- (id)init {
   if ((self = [super init])) {
   }
   return self;
}

- (void)setPopupLeftMargin:(int)leftMargin height:(int)height {
   int keyboardHeight = self.keyboardWillShow ? 216 : 0;
   int fromControllerContentHeight = self.fromController.view.frame.size.height - keyboardHeight - self.fromController.topLayoutGuide.length;
   
   int centerY = self.fromController.topLayoutGuide.length + fromControllerContentHeight / 2;
   self.popupController.view.frame = CGRectMake(leftMargin, centerY - height / 2, self.fromController.view.frame.size.width - 2 * leftMargin, height);
   self.popupController.view.layer.cornerRadius = kPopupCornerRadius;
   self.popupController.view.clipsToBounds = YES;
}

- (void)displayPopupCompletion:(void(^)(void))completion {
   PCSDarkUnderlayView *underlayView = [[PCSDarkUnderlayView alloc] initWithFrame:self.fromController.view.bounds];
   underlayView.alpha = 0;
   [self.fromController.view addSubview:underlayView];
   
   [self.fromController addChildViewController:self.popupController];
   [self.fromController.view addSubview:self.popupController.view];
   [self.popupController didMoveToParentViewController:self.fromController];
   
   self.popupController.view.alpha = 0;
   self.popupController.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
   
   [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:0 animations:^{
      self.popupController.view.transform = CGAffineTransformIdentity;
      self.popupController.view.alpha = 1;
      underlayView.alpha = 1;
      
   } completion:^(BOOL finished) {
      if (completion)
         completion();
   }];
}

@end
