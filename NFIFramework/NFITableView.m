//
//  NFITableView.m
//  Pods
//
//  Created by Hasten on 8/4/16.
//
//

#import "NFITableView.h"
#import "NFITableViewCell.h"

@interface NFITableView ()

@property (nonatomic, strong) NSMutableArray *selectedItems;

@end

@implementation NFITableView

/**
 * Init the tableview with data source and delegate
 */
- (instancetype)initWithDataSource:(NFICollectionViewDataSource *)dataSource
                          delegate:(id<UITableViewDelegate>)delegate {
    
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.dataSource = dataSource;
        self.selectedItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)awakeFromNib {
    self.selectedItems = [[NSMutableArray alloc] init];
}

/**
 * Init
 */
- (instancetype)init {
    self = [super init];
    if (self) {
        self.selectedItems = [[NSMutableArray alloc] init];
    }
    return self;
}


#pragma mark - Public Methods

- (BOOL)isItemSelected:(NSObject<NFICollectionItem> *)item {
    if ([self.selectedItems containsObject:[item uniqueIdentifierForCollectionItem]]) {
        return YES;
    }
    return NO;
}

/**
 * Override of reloadDataMethod
 */
- (void)reloadData {
    [self.selectedItems removeAllObjects];
    NSArray *indexForSelectedRows = [self indexPathsForSelectedRows];
    for (NSIndexPath *indexPath in indexForSelectedRows) {
        NFITableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
        NSString *cellIdentifier = [cell identifierForCellContent];
        [self.selectedItems addObject:cellIdentifier];
    }
    [super reloadData];
}

@end
