//
//  NFICollectionPresenter.h
//  NFIFramework
//
//  Created by Pedro Lopez on 9/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NFIPresenter.h"
#import "NFICollectionItem.h"

@protocol NFICollectionPresenter <NFIPresenter>

- (void)itemWasTapped:(NFICollectionItem *)item;

@end
