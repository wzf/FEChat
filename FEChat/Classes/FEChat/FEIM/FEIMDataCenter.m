//
//  FEIMDataCenter.m
//  FEChat
//
//  Created by wangzhanfeng on 15/11/22.
//  Copyright © 2015年 F.E. All rights reserved.
//

#import "FEIMDataCenter.h"
#import "FEChatHeader.h"

@implementation FEIMDataCenter

#pragma mark -
#pragma mark 单例
+ (instancetype)center;
{
    return [self sharedInstance];
}

+ (instancetype)sharedInstance;
{
    static dispatch_once_t onceToken;
    static FEIMDataCenter *sharedObject = nil;
    dispatch_once(&onceToken, ^{
        if (!sharedObject) {
            sharedObject = [FEIMDataCenter new];
        }
    });
    return sharedObject;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        [AVOSCloud setApplicationId:kLeanCloudAppID clientKey:kLeanCloudAppKey];
        self.avim_client = [[AVIMClient alloc] init];
    }
    return self;
}

#pragma mark -
#pragma mark 连接LeanCloud服务器
- (void)connWithSelfID:(NSString *)selfID;
{
    [self connWithSelfID:selfID complete:nil];
}

- (void)connWithSelfID:(NSString *)selfID complete:(void (^)(BOOL, NSError *))complete;
{
    __block typeof(self) weakSelf = self;
    dispatch_block_t connBlock = ^{
        [weakSelf.avim_client openWithClientId:selfID callback:^(BOOL succeeded, NSError *error) {
            if (complete) {
                complete(succeeded, error);
            }
        }];
    };
    
    // 如果已经建立了连接，将原来的关闭，然后再重新建立
    // TODO:没仔细研究过用一个连接，更换clientID的方式
    if (_avim_client.status == AVIMClientStatusOpened) {
        [_avim_client closeWithCallback:^(BOOL succeeded, NSError *error) {
            connBlock();
        }];
    }
    else {
        connBlock();
    }
}

#pragma mark -
#pragma mark 会话操作(创建会话)
- (void)openConvertaionWithMemberIDs:(NSArray *)targets complete:(AVIMConversationResultBlock)block;
{
    if (_avim_client && _avim_client.status == AVIMClientStatusOpened) {
        NSString *name = [[targets componentsJoinedByString:@","] substringToIndex:8];
        [_avim_client createConversationWithName:name clientIds:targets attributes:nil options:AVIMConversationOptionUnique callback:block];
    }
    else {
        if (block) {
            block(nil, [NSError errorWithDomain:@"F.E" code:9404 userInfo:@{NSLocalizedDescriptionKey:@"服务器连接异常"}]);
        }
    }
}

@end
