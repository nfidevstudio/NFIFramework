//
//  NFITableViewDataSource.m
//  NFIFramework
//
//  Created by Pedro Lopez on 9/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "NFITableViewDataSource.h"
#import "NFICollectionItem.h"
#import "NFIViewCell.h"

@interface NFITableViewDataSource ()

@property Class itemClass;
@property Class cellClass;

@end

@implementation NFITableViewDataSource

+ (NFITableViewDataSource *)dataSourceForItems:(Class)itemClass andCell:(Class)cellClass {
    return [[NFITableViewDataSource alloc] initWithItem:itemClass andCell:cellClass];
}

- (instancetype)initWithItem:(Class)itemClass andCell:(Class)cellClass {
    self = [super init];
    if (self) {
        self.items = [NSMutableArray array];
        self.itemClass = itemClass;
        self.cellClass = cellClass;
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = [NSString stringWithFormat:@"%@Identifier", NSStringFromClass(self.cellClass)];
    id<NFIViewCell> cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    NFICollectionItem *item = [self itemAtIndexPath:indexPath];
    [cell configureCellForItem:item];
    return (UITableViewCell *)cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

@end
