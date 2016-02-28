//
//  Film.m
//  ExampleApp
//
//  Created by Pedro Lopez on 13/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "Film.h"

@interface Film ()

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *year;
@property (nonatomic, copy) NSString *urlPoster;
@property (nonatomic, copy) NSString *plot;
@property (nonatomic, copy) NSString *idIMDB;
@property (nonatomic, copy) NSString *urlIMDB;
@property (nonatomic, copy) NSString *rating;

@end

@implementation Film

+ (instancetype)filmWithDictionary:(NSDictionary *)dictionary {
    return [self baseModelWithDictionary:dictionary];
}

#pragma mark - BaseModelSerializable

static NSString *const kTitleKey = @"kTitleKey";
static NSString *const kYearKey = @"kYearKey";
static NSString *const kPosterKey = @"kPosterKey";
static NSString *const kPlotKey = @"kPlotKey";
static NSString *const kIdIMDBKey = @"kIdIMDBKey";
static NSString *const kUrlIMDBKey = @"kUrlIMDBKey";
static NSString *const kRatingKey = @"kRatingKey";

+ (id<NFIBaseModelSerializable>)deserialize:(NSDictionary *)dictionary {
    Film *film = [[Film alloc] init];
    film.title = NFIEmptyStringToNil([dictionary objectForKey:kTitleKey]);
    film.year = NFIEmptyStringToNil([dictionary objectForKey:kYearKey]);
    film.urlPoster = NFIEmptyStringToNil([dictionary objectForKey:kPosterKey]);
    film.plot = NFIEmptyStringToNil([dictionary objectForKey:kPlotKey]);
    film.idIMDB = NFIEmptyStringToNil([dictionary objectForKey:kIdIMDBKey]);
    film.urlIMDB = NFIEmptyStringToNil([dictionary objectForKey:kUrlIMDBKey]);
    film.rating = NFIEmptyStringToNil([dictionary objectForKey:kRatingKey]);
    return film;
}

- (NSDictionary *)serialize {
    return @{ kTitleKey : NFINilToEmptyString(self.title),
              kYearKey : NFINilToEmptyString(self.year),
              kPosterKey  : NFINilToEmptyString(self.urlPoster),
              kPlotKey : NFINilToEmptyString(self.plot),
              kIdIMDBKey : NFINilToEmptyString(self.idIMDB),
              kUrlIMDBKey : NFINilToEmptyString(self.urlIMDB),
              kRatingKey : NFINilToEmptyString(self.rating)
              };
}

#pragma mark - Identifier

- (NSString *)uniqueIdentifier {
    return self.idIMDB;
}

#pragma mark - Public Methods

- (NSURL *)urlForFilmSite {
    NSString *urlString = [NSString stringWithFormat:@"http://www.imdb.com/title/%@/", self.idIMDB];
    return [NSURL URLWithString:urlString];
}

#pragma mark - Realm Primary Key

+ (NSString *)primaryKey {
    return @"idIMDB";
}

@end
