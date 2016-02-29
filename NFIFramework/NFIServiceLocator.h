//
//  NFIServiceLocator.h
//  NFIFramework
//
//  Created by Pedro Lopez on 6/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NFIStoryboard.h"
#import "NFINavigatorContainer.h"

@interface NFIServiceLocator : NSObject

#pragma mark - Public Methods.

@property (nonatomic, strong) NFINavigatorContainer *navigatorContainer;

+ (instancetype)sharedInstance;

- (NFIStoryboard *)provideMainStoryboard;
- (NFIStoryboard *)provideStoryboardByIdentifier:(NSString *)identifier;

@end
