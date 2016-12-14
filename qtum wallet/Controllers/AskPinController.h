//
//  AskPinController.h
//  qtum wallet
//
//  Created by Никита Федоренко on 14.12.16.
//  Copyright © 2016 Designsters. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PinViewController.h"
@protocol PinCoordinator;

@interface AskPinController : UINavigationController <PinCoordinator>

@property (nonatomic, copy) void(^validatePinCompletesion)();

@end
