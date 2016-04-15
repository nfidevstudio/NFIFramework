//
//  NFIViewDataSource.h
//  NFIFramework
//
//  Created by Pedro Lopez on 9/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NFICollectionItem.h"
#import <UIKit/UIKit.h>

@interface NFIViewDataSource : NSObject

@property (nonatomic, strong) NSMutableArray *items;

- (NSObject<NFICollectionItem> *)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
