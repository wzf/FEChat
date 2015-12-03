//
//  FEIMCenter.m
//  FEChatManager
//
//  Created by wangzhanfeng-PC on 15/12/3.
//  Copyright © 2015年 F.E. All rights reserved.
//

#import "FEIMCenter.h"

@implementation FEIMCenter

+ (instancetype)center;
{
    return [self sharedInstance];
}

+ (instancetype)sharedInstance;
{
    static dispatch_once_t onceToken;
    static FEIMCenter *sharedObject = nil;
    dispatch_once(&onceToken, ^{
        if (sharedObject == nil) {
            sharedObject = [[FEIMCenter alloc] init];
        }
    });
    return sharedObject;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [AVOSCloud setApplicationId:@"Lf5utA6a7OnAh9a0M048IYnb"
                          clientKey:@"Q3GEaj4LEj1cBmuRQmmwqnAb"];
    }
    return self;
}

- (void)openWithUser:(NSDictionary *)user callback:(AVIMBooleanResultBlock)callback;
{
    NSString *uID = user[@"userID"];
    if (uID.length <= 0) {
        return;
    }
    
    [CDChatManager manager].userDelegate = [FEIMUserCenter sharedInstance];
    [[CDChatManager manager] openWithClientId:uID callback:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [[FEIMUserCenter sharedInstance] registerClientUser:user];
            if (callback) {
                callback(succeeded, error);
            }
        }
    }];
}

@end
