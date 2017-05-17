//
//  AppDelegate.m
//  qtum wallet
//
//  Created by Sharaev Vladimir on 29.10.16.
//  Copyright © 2016 Designsters. All rights reserved.
//

#import "AppDelegate.h"
#import "RPCRequestManager.h"
#import "Appearance.h"
#import "ContractManager.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//     Remove all wallets
//    [[WalletManager sharedInstance] removeAllWallets];
    [Appearance setUp];
    [[AppSettings sharedInstance] setup];
    [[ApplicationCoordinator sharedInstance] start];

//     Send money for our wallet
//    if ([[WalletManager sharedInstance] haveWallets]) {
//        [[WalletManager sharedInstance].requestManager sendToAddress:[[[WalletManager sharedInstance] getCurrentWallet] getRandomKey].address.string withSuccessHandler:^(id responseObject) {
//            NSLog(@"yes");
//        } andFailureHandler:^(NSError *error, NSString *message) {
//            NSLog(@"no");
//        }];
//    }
//
    [ContractManager sharedInstance];
    return YES;
}

- (NSArray *)getRandomWordsFromWordsArray:(NSInteger)count
{
    NSMutableArray *randomWords = @[].mutableCopy;
    NSInteger i = 0;
    
    while (i < count) {
        uint32_t rnd = arc4random_uniform((uint32_t)wordsArray().count);
        NSString *randomWord = wordsArray()[rnd];
        
        if (![randomWords containsObject:randomWord]) {
            [randomWords addObject:randomWord];
            i++;
        }
    }
    
    return randomWords;
}

-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    [[ApplicationCoordinator sharedInstance] launchFromUrl:url];
    return YES;
}

#pragma mark - Notifications


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    [[ApplicationCoordinator sharedInstance].notificationManager application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    [[ApplicationCoordinator sharedInstance].notificationManager application:application didFailToRegisterForRemoteNotificationsWithError:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [[ApplicationCoordinator sharedInstance].notificationManager application:application didReceiveRemoteNotification:userInfo];
}



@end
