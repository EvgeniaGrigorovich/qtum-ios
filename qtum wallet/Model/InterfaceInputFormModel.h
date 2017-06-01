//
//  InterphaseInputFormModel.h
//  qtum wallet
//
//  Created by Vladimir Lebedevich on 16.05.17.
//  Copyright © 2017 PixelPlex. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AbiinterfaceItem;

@interface InterfaceInputFormModel : NSObject

@property (strong, nonatomic, readonly) NSMutableArray<AbiinterfaceItem*>* functionItems;
@property (strong, nonatomic, readonly) NSMutableArray<AbiinterfaceItem*>* propertyItems;
@property (strong, nonatomic, readonly) AbiinterfaceItem* constructorItem;

-(instancetype)initWithAbi:(NSDictionary*) abi;

@end
