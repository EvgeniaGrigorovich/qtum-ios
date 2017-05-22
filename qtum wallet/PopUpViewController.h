//
//  PopUpViewController.h
//  qtum wallet
//
//  Created by Sharaev Vladimir on 18.05.17.
//  Copyright © 2017 Designsters. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopUpViewControllerDelegate <NSObject>

- (void)okButtonPressed;

@end

@protocol PopUpWithTwoButtonsViewControllerDelegate <PopUpViewControllerDelegate>

- (void)cancelButtonPressed;

@end

@interface PopUpViewController : UIViewController

- (void)showFromViewController:(UIViewController *)controller animated:(BOOL)animated completion:(void (^)(void))completion;
- (void)hide:(BOOL)animated completion:(void (^)(void))completion;

@end