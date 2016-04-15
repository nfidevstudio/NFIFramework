//
//  NFIViewDataSource.m
//  NFIFramework
//
//  Created by Pedro Lopez on 9/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "NFIViewDataSource.h"

@implementation NFIViewDataSource

- (NSObject<NFICollectionItem> *)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.items[indexPath.item];
}

@end
