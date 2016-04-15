//
//  NFISectionTableViewDataSource.h
//  NFIFramework
//
//  Created by Pedro Lopez on 9/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NFITableViewDataSource.h"

@interface NFISectionTableViewDataSource : NFITableViewDataSource <UITableViewDataSource>

@property (nonatomic, strong) NSMutableDictionary *itemsBySection;
@property (nonatomic, strong) NSMutableArray *sections;

+ (NFISectionTableViewDataSource *)dataSourceForItems:(Class)itemClass andCell:(Class)cellClass;

@end
