//
//  NFIRepositoryManager.m
//  NFIFramework
//
//  Created by Pedro Lopez on 13/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "NFIRepositoryManager.h"

@interface NFIRepositoryManager ()

@property (nonatomic, strong) NSMutableDictionary *repositories;
@property (nonatomic, strong) NSMutableDictionary *sharedRepositories;

@end

@implementation NFIRepositoryManager

#pragma mark - Class life cycle.

+ (instancetype)sharedInstance {
    static NFIRepositoryManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] initSingleton];
    });
    return _sharedInstance;
}

- (NFIRepositoryManager *)initSingleton {
    self = [super init];
    if (self) {
        _repositories = [NSMutableDictionary dictionary];
        _sharedRepositories = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSString *)classNameIdentier:(Class)class {
    return NSStringFromClass(class);
}

#pragma mark - Methods to register / unregister app repositories.

- (void)registerRepositoryClass:(Class)repositoryClass forRelatedModel:(NSString *)relatedModelIdentifier {
    [_repositories setObject:repositoryClass forKey:relatedModelIdentifier];
}

- (void)unregisterRepositoryClass:(Class)repositoryClass {
    for (NSString *classIdentifier in _repositories.allKeys) {
        Class classRepository = [_repositories objectForKey:classIdentifier];
        if ([classRepository isEqual:repositoryClass]) {
            [_repositories removeObjectForKey:classIdentifier];
        }
    }
}

- (void)unregisterRepositoryClassForRelatedModelIdentifier:(NSString *)relatedModelIdentifer {
    [_repositories removeObjectForKey:relatedModelIdentifer];
}

#pragma mark - Methods to handle repositories.

- (id<NFIRepository>)provideRepositoryInstanceForRelatedModel:(NSString *)relatedModelIdentifier {
    Class repositoryClass = [_repositories objectForKey:relatedModelIdentifier];
    return [[repositoryClass alloc] init];
}

- (id<NFIRepository>)provideSharedRepositoryInstanceForRelatedModel:(NSString *)relatedModelIdentifier {
    id<NFIRepository> repositoryToProvide = nil;
    if (![_sharedRepositories objectForKey:relatedModelIdentifier]) {
        repositoryToProvide = [self provideRepositoryInstanceForRelatedModel:relatedModelIdentifier];
        [_sharedRepositories setObject:repositoryToProvide forKey:relatedModelIdentifier];
    } else {
        repositoryToProvide = [_sharedRepositories objectForKey:relatedModelIdentifier];
    }
    return repositoryToProvide;
}

@end
