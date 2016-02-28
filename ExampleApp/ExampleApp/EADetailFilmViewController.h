//
//  EADetailFilmViewController.h
//  ExampleApp
//
//  Created by Pedro Lopez on 21/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

// NFIFramework classes.
#import "NFIFramework.h"

// Example App classes.
#import "EADetailFilmUI.h"

@interface EADetailFilmViewController : NFIViewController <EADetailFilmUI>

@property (nonatomic, strong) NSString *filmId;

@end
