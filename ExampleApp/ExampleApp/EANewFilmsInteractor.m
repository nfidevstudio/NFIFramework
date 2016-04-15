//
//  ListTeamsInteractor.m
//  ExampleApp
//
//  Created by Pedro Lopez on 14/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "EANewFilmsInteractor.h"

@interface EANewFilmsInteractor ()

@property (nonatomic, strong) id<EAFilmsRepository> repository;

@end

@implementation EANewFilmsInteractor

#pragma mark - Init Methods

- (instancetype)initWithRepository:(id<EAFilmsRepository>)repository {
    self = [super init];
    if (self) {
        self.repository = repository;
    }
    return self;
}

#pragma mark - Interactor Input Methods

- (void)findNewFilms {
    [self.repository retrieveFilmsWithCompletionBlock:^(NSArray *films, BOOL success) {
        [self.output foundNewFilms:films];
    }];
}

- (void)findFilmByIdentifier:(NSString *)filmId {
    [self.repository retrieveFilmsWithCompletionBlock:^(NSArray *films, BOOL success) {
        for (Film *film in films) {
            if ([[film uniqueIdentifier] isEqualToString:filmId]) {
                [self.output foundFilmById:film];
                break;
            }
        }
    }];
}

- (void)findFilmsFilterByTitle:(NSString *)title {
    [self.repository retrieveFilmsWithCompletionBlock:^(NSArray *films, BOOL success) {
        NSMutableArray *filteredFilms = [NSMutableArray array];
        if (![title isEqualToString:@""]) {
            for (Film *film in films) {
                if ([[film.title lowercaseString] rangeOfString:[title lowercaseString]].location != NSNotFound) {
                    [filteredFilms addObject:film];
                }
            }
        } else {
            [filteredFilms addObjectsFromArray:films];
        }
        [self.output foundFilteredFilms:filteredFilms];
    }];
}

@end
