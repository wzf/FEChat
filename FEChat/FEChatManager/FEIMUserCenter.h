//
//  FEIMUserCenter.h
//  FEChatManager
//
//  Created by wangzhanfeng-PC on 15/12/3.
//  Copyright © 2015年 F.E. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeanChatLib.h"
#import "FEIMUser.h"

@interface FEIMUserCenter : NSObject<CDUserDelegate>

+ (instancetype)sharedInstance;

@property (strong, nonatomic) FEIMUser *clientUser; //
@property (strong, nonatomic) NSString *clientUserID; //

- (void)registerClientUser:(NSDictionary *)user;
- (void)registerCommonUsers:(NSArray *)users;

@property (strong, nonatomic) NSMutableDictionary *cacheUsers; //
- (void)cleanCache;
@end
