//
//  NFISectionTableViewDataSource.m
//  NFIFramework
//
//  Created by Pedro Lopez on 9/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "NFISectionTableViewDataSource.h"
#import "NFICollectionItem.h"
#import "NFIViewCell.h"

@interface NFISectionTableViewDataSource ()

@end

@implementation NFISectionTableViewDataSource

+ (NFISectionTableViewDataSource *)dataSourceForItems:(Class)itemClass andCell:(Class)cellClass {
    return [[NFISectionTableViewDataSource alloc] initWithItem:itemClass andCell:cellClass];
}

- (instancetype)initWithItem:(Class)itemClass andCell:(Class)cellClass {
    self = [super initWithItem:itemClass andCell:cellClass];
    if (self) {
        self.sections = [NSMutableArray array];
        self.itemsBySection = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSObject<NFICollectionItem> *)provideItemForIndexPath:(NSIndexPath *)indexPath {
    if (self.itemsBySection.count > 0) {
        NSString *sectionKey = [self.sections objectAtIndex:indexPath.section];
        NSArray *items = [self.itemsBySection objectForKey:sectionKey];
        return [items objectAtIndex:indexPath.row];
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.itemsBySection.count > 0) {
        NSString *sectionKey = [self.sections objectAtIndex:section];
        NSArray *sectionItems = [self.itemsBySection objectForKey:sectionKey];
        return sectionItems.count;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

@end
