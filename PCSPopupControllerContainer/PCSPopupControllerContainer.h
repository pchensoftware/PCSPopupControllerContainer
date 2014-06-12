//====================================================================================================
// Author: Peter Chen
// Created: 6/12/14
// Copyright 2014 Hidoodle
//====================================================================================================

#import <UIKit/UIKit.h>


@interface PCSPopupControllerContainer : NSObject

@property (nonatomic, weak) UIViewController *fromController;
@property (nonatomic, weak) UIViewController *popupController;
@property (nonatomic, assign) BOOL keyboardWillShow; // hack

+ (void)hidePopupController:(UIViewController *)popupController fromController:(UIViewController *)fromController;

- (void)setPopupLeftMargin:(int)leftMargin height:(int)height;
- (void)displayPopupCompletion:(void(^)(void))completion;

@end
