//====================================================================================================
// Author: Peter Chen
// Created: 6/12/14
// Copyright 2014 pchensoftware
//====================================================================================================

#import "MyController.h"
#import "PCSPopupControllerContainer.h"
#import "PopupThisController.h"

@interface MyController()



@end

@implementation MyController

- (id)init {
   if ((self = [super init])) {
   }
   return self;
}

- (void)viewDidLoad {
   [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
   [super viewDidAppear:animated];
   
   PopupThisController *popupController = [[PopupThisController alloc] init];
   UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:popupController];
   
   PCSPopupControllerContainer *container = [[PCSPopupControllerContainer alloc] init];
   container.fromController = self;
   container.popupController = nav;
   [container setPopupLeftMargin:20 height:200];
   [container displayPopupCompletion:nil];
}

//====================================================================================================
#pragma mark - Events
//====================================================================================================



@end
