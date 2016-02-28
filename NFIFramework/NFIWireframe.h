//
//  NFIWireframe.h
//  NFIFramework
//
//  Created by Pedro Lopez on 7/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NFIServiceLocator.h"

@interface NFIWireframe : NSObject

@property (nonatomic, readonly) NFIServiceLocator *serviceLocator;

@end
