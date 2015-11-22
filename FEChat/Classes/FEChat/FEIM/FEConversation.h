//
//  FEConversation.h
//  FEChat
//
//  Created by wangzhanfeng on 15/11/22.
//  Copyright © 2015年 F.E. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloudIM.h>
#import "XHEmotionManager.h"

// 会话类型
typedef NS_ENUM(NSUInteger, FEConvType) {
    FEConvTypeSingle = 0,   //单聊
    FEConvTypeGroup  = 1,   //群聊
};


// Desc：定义会话(Conversation)，处理业务逻辑，如发送消息、接受消息，显示成员名称、成员头像。
// AVOSCloudIM相关的属性，都是以avim开头的
@interface FEConversation : NSObject
@property (copy,   nonatomic) NSString     *convID;     //会话ID，取自avim_conversation
@property (assign, nonatomic) FEConvType   *convType;   //会话类型，
@property (assign, nonatomic) NSMutableSet *members;    //成员，包括自己

@property (strong, nonatomic) AVIMConversation *avim_conv;  //
- (instancetype)initWithConversation:(AVIMConversation *)conv;  //根据conversation创建模型

// 消息
@property (strong, nonatomic) NSMutableArray *convMsgs;
//- (void)sendTextMsg:(NSString *)msg;


// emotion
@property (nonatomic, strong) NSArray *emotionManagers;
- (void)setupEmotions;
@end
