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

@interface NFITableViewDataSource : NFIViewDataSource <UITableViewDataSource>

+ (NFITableViewDataSource *)dataSourceForItems:(Class)itemClass andCell:(Class)cellClass;

@end
