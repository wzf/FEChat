//
//  FEIMDataCenter.h
//  FEChat
//
//  Created by wangzhanfeng on 15/11/22.
//  Copyright © 2015年 F.E. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloudIM.h>

@interface FEIMDataCenter : NSObject

+ (instancetype)center;
+ (instancetype)sharedInstance;

@property (strong, nonatomic) AVIMClient *avim_client;

// Part1:连接LeanCloud服务器
@property (copy, nonatomic) NSString *selfID;   //自己的ID
- (void)connWithSelfID:(NSString *)selfID;
- (void)connWithSelfID:(NSString *)selfID complete:(void (^)(BOOL, NSError *))complete;

// Part2:建立会话
- (void)openConvertaionWithMemberIDs:(NSArray *)targets complete:(AVIMConversationResultBlock)block;

@end
