//
//  FEIMCenter.h
//  FEChatManager
//
//  Created by wangzhanfeng-PC on 15/12/3.
//  Copyright © 2015年 F.E. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeanChatLib.h"
#import "FEIMUserCenter.h"

/**
 * 1. 连接服务器
 * 2. 断线处理
 */
@interface FEIMCenter : NSObject

+ (instancetype)center;
+ (instancetype)sharedInstance;

// 建立IM服务器连接
- (void)openWithUser:(NSDictionary *)user callback:(AVIMBooleanResultBlock)callback;

@end
