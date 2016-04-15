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
#import "NFITableView.h"

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
    NSString *cellIdentifier = [self cellIdentifierForIndexPath:indexPath];
    id<NFIViewCell> cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.cellClass) owner:self options:nil];
        if (nib.count > 0) {
            cell = [nib objectAtIndex:0];
        }
    }
    NSObject<NFICollectionItem> *item = [self provideItemForIndexPath:indexPath];
    [cell configureCellForItem:item];
    
    if ([tableView isKindOfClass:[NFITableView class]]) {
        NFITableView *nfiTableView = (NFITableView *)tableView;
        if ([nfiTableView isItemSelected:item]) {
            [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
        }
    }
    return (UITableViewCell *)cell;
}

- (NSObject<NFICollectionItem> *)provideItemForIndexPath:(NSIndexPath *)indexPath {
    return [self itemAtIndexPath:indexPath];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.items.count > 0) return 1;
    return 0;
}

- (NSString *)cellIdentifierForIndexPath:(NSIndexPath *)indexPath {
    NSString *cellClassName = nil;
    if ([self.delegate respondsToSelector:@selector(cellClassForIndexPath:)]) {
        cellClassName = NSStringFromClass([self.delegate cellClassForIndexPath:indexPath]);
    } else {
        cellClassName = NSStringFromClass(self.cellClass);
    }
    return [NSString stringWithFormat:@"%@Identifier", cellClassName];
}

@end
