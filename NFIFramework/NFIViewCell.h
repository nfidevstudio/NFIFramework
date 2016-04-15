//
//  NFIViewCell.h
//  NFIFramework
//
//  Created by Pedro Lopez on 20/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NFICollectionItem.h"

@protocol NFIViewCell <NSObject>

- (void)configureCellForItem:(NSObject<NFICollectionItem> *)item;
- (NSString *)identifierForCellContent;

@end