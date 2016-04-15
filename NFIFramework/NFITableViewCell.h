//
//  NFITableViewCell.h
//  NFIFramework
//
//  Created by Pedro Lopez on 8/4/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NFIViewCell.h"

@interface NFITableViewCell : UITableViewCell <NFIViewCell>

@property (nonatomic, readonly) NSString *identifierForCellContent;

@end
