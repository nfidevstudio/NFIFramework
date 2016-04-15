//
//  NFIViewDataSource.h
//  NFIFramework
//
//  Created by Pedro Lopez on 9/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NFIViewDataSource.h"
#import "NFITableViewDataSourceProtocol.h"

@interface NFITableViewDataSource : NFIViewDataSource <UITableViewDataSource>

@property (nonatomic, weak) id<NFITableViewDataSourceProtocol> delegate;

- (instancetype)initWithItem:(Class)itemClass andCell:(Class)cellClass;
- (NSObject<NFICollectionItem> *)provideItemForIndexPath:(NSIndexPath *)indexPath;

+ (NFITableViewDataSource *)dataSourceForItems:(Class)itemClass andCell:(Class)cellClass;

@end
