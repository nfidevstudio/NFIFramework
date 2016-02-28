//
//  Song.h
//  ExampleApp
//
//  Created by Pedro Lopez on 13/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NFIRealmBaseModel.h"

@interface Film : NFIRealmBaseModel

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *year;
@property (nonatomic, copy, readonly) NSString *urlPoster;
@property (nonatomic, copy, readonly) NSString *plot;
@property (nonatomic, copy, readonly) NSString *idIMDB;
@property (nonatomic, copy, readonly) NSString *urlIMDB;
@property (nonatomic, copy, readonly) NSString *rating;

+ (instancetype)filmWithDictionary:(NSDictionary *)dictionary;

- (NSURL *)urlForFilmSite;

@end
