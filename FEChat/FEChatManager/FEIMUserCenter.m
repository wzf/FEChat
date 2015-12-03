//
//  FEIMUserCenter.m
//  FEChatManager
//
//  Created by wangzhanfeng-PC on 15/12/3.
//  Copyright © 2015年 F.E. All rights reserved.
//

#import "FEIMUserCenter.h"

static FEIMUserCenter *sharedOjbect = nil;

@implementation FEIMUserCenter

#pragma mark -
#pragma mark 初始化
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (sharedOjbect == nil) {
            sharedOjbect = [[FEIMUserCenter alloc] init];
        }
    });
    return sharedOjbect;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cacheUsers = [NSMutableDictionary dictionary];
    }
    return self;
}


#pragma mark -
#pragma mark 缓存用户
- (FEIMUser *)pickUserByUserID:(NSString *)userID
{
    if ([userID isEqualToString:_clientUserID]) {
        return _clientUser;
    }
    else if ([[_cacheUsers allKeys] containsObject:userID]) {
        return [_cacheUsers valueForKey:userID];
    }
    else return nil;
}


#pragma mark -
#pragma mark 注册Client User
- (void)registerClientUser:(NSDictionary *)aUser;
{
    FEIMUser *user = [FEIMUser new];
    user.userID    = aUser[@"userID"];
    user.username  = aUser[@"username"];
    user.avatarURL = aUser[@"avatarURL"];
    
    self.clientUserID = user.userId;
    self.clientUser   = user;
}

#pragma mark -
#pragma mark 注册其他User
- (void)registerCommonUsers:(NSArray *)users;
{
    for (NSDictionary *userDict in users) {
        FEIMUser *user = [FEIMUser new];
        user.userID    = userDict[@"userID"];
        user.username  = userDict[@"username"];
        user.avatarURL = userDict[@"avatarURL"];
        
        //
        [_cacheUsers setValue:user forKey:user.userID];
    }
}

/**
 *  同步方法，下面的 cacheUserByIds:block 方法是为了 getUserById: 能同步返回用户信息
 */
- (id<CDUserModel>)getUserById:(NSString *)userId;
{
    FEIMUser *user = [self pickUserByUserID:userId];
    if (user == nil) {
        NSAssert(NO, @"用户未缓存");
    }
    return user;
}

/**
 *  对于每条消息，都会调用这个方法来缓存发送者的用户信息，以便 getUserById 直接返回用户信息
 */
- (void)cacheUserByIds:(NSSet *)userIds block:(AVBooleanResultBlock)block;
{
//    __block
    NSMutableArray *needCacheUserIDs = [NSMutableArray arrayWithCapacity:userIds.count];
    for (NSString *userID in userIds) {
        if ([self pickUserByUserID:userID] == nil) {
            [needCacheUserIDs addObject:userID];
        }
    }
    
    NSMutableArray *cachedUsers = [NSMutableArray arrayWithCapacity:needCacheUserIDs.count];
    for (NSString *userID in needCacheUserIDs) {
        // 模拟数据
        NSDictionary *userDict = @{@"userID":userID, @"username":userID, @"avatarURL":@""};
        //
        [cachedUsers addObject:userDict];
    }
    
    // 缓存user
    [self registerCommonUsers:cachedUsers];
    
    // 回调
    block(YES, nil);
}
@end
