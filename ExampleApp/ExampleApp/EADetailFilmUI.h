//
//  EADetailFilmUI.h
//  ExampleApp
//
//  Created by Pedro Lopez on 21/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

// NFIFramework classes.
#import "NFIFramework.h"

// Example App classes.
#import "Film.h"

@protocol EADetailFilmUI <NFIUI>

#pragma mark - View Interface Methods

- (void)updateFilmInfo:(Film *)film;
- (void)updateFilmFavoriteStatus:(BOOL)isFavorite;
- (void)showAddFavoriteErrorMessage;
- (void)showRemoveFavoriteErrorMessage;

@end
