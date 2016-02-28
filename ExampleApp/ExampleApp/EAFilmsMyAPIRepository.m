//
//  GamesMemoryProvider.m
//  ExampleApp
//
//  Created by Pedro Lopez on 13/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "EAFilmsMyAPIRepository.h"
#import "Film.h"

@implementation EAFilmsMyAPIRepository

- (void)retrieveFilmsWithCompletionBlock:(FilmsRepositoryRetrieveCompletionBlock)block {
    NSURLSessionConfiguration* sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    /* Create session, and optionally set a NSURLSessionDelegate. */
    NSURLSession* session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
    NSURL* URL = [NSURL URLWithString:@"http://www.myapifilms.com/imdb/inTheaters?token=c3f8dc8a-de59-4f94-836d-38ee07333aa3&format=json&language=en"];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:URL];
    request.HTTPMethod = @"GET";
    /* Start a new Task */
    NSURLSessionDataTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil) {
            // Success
            NSLog(@"URL Session Task Succeeded: HTTP %ld", ((NSHTTPURLResponse*)response).statusCode);
            NSError* error;
            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:kNilOptions
                                                                   error:&error];
            NSMutableArray *films = [NSMutableArray array];
            NSArray *filmsContainer = [[json objectForKey:@"data"] objectForKey:@"inTheaters"];
            NSDictionary *filmsNext = [filmsContainer objectAtIndex:1];
            //NSDictionary *filmsNow = [filmsContainer objectAtIndex:1];
            NSArray *filmsDictionary = [filmsNext objectForKey:@"movies"];
            for (NSDictionary *filmDictionary in filmsDictionary) {
                Film *film = [Film filmWithDictionary:filmDictionary];
                [films addObject:film];
            }
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                block(films, YES);
            }];
        }
        else {
            // Failure
            NSLog(@"URL Session Task Failed: %@", [error localizedDescription]);
        }
    }];
    [task resume];

}

@end
