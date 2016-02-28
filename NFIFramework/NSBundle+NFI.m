//
//  NSBundle+NFI.h
//  NFIFramework
//
//  Created by Pedro Lopez on 9/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "NSBundle+NFI.h"

@implementation NSBundle (NFI)

- (UIView *)loadNibWithName:(NSString *)name andOwner:(id)owner {
    NSArray *loadedViews = [self loadNibNamed:name owner:owner options:nil];
    if (loadedViews.count > 0) {
        return [loadedViews objectAtIndex:0];
    }
    return nil;
}

- (UIView *)loadNibWithName:(NSString *)name {
    NSArray *loadedViews = [self loadNibNamed:name owner:nil options:nil];
    if (loadedViews.count > 0) {
        return [loadedViews objectAtIndex:0];
    }
    return nil;
}

@end
