//====================================================================================================
// Author: Peter Chen
// Created: 6/12/14
// Copyright 2014 pchensoftware
//====================================================================================================

#import "PopupThisController.h"

@interface PopupThisController()



@end

@implementation PopupThisController

- (id)init {
   if ((self = [super init])) {
   }
   return self;
}

- (void)viewDidLoad {
   [super viewDidLoad];
   self.title = @"Popup";
   self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:nil action:nil];
   self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:nil action:nil];
   self.view.backgroundColor = [UIColor whiteColor];
}

//====================================================================================================
#pragma mark - Events
//====================================================================================================



@end
