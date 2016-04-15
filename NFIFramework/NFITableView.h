//
//  NFITableView.h
//  Pods
//
//  Created by Hasten on 8/4/16.
//
//

#import <UIKit/UIKit.h>
#import "NFIFramework.h"

@interface NFITableView : UITableView

@property (nonatomic, strong) NSMutableArray *indexPaths;

#pragma mark - Instance Methods

/** 
 * Init the tableview with data source and delegate
 */
- (instancetype)initWithDataSource:(NFICollectionViewDataSource *)dataSource
                          delegate:(id<UITableViewDelegate>)delegate;

- (BOOL)isItemSelected:(NSObject<NFICollectionItem> *)item;

@end
