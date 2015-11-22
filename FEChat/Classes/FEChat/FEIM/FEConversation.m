//
//  FEConversation.m
//  FEChat
//
//  Created by wangzhanfeng on 15/11/22.
//  Copyright © 2015年 F.E. All rights reserved.
//

#import "FEConversation.h"
#import "FEChatHeader.h"
#import "CDEmotionUtils.h"

@implementation FEConversation
// 初始化
- (instancetype)initWithConversation:(AVIMConversation *)conversation;
{
    self = [super init];
    if (self) {
        self.avim_conv = conversation;
        self.convID    = conversation.conversationId;
    }
    return self;
}

#pragma mark -
#pragma mark 设置聊天表情
- (void)setupEmotions;
{
//    NSMutableArray *emotionManagers = [NSMutableArray array];
//    for (NSInteger i = 0; i < 10; i ++) {
//        XHEmotionManager *emotionManager = [[XHEmotionManager alloc] init];
//        emotionManager.emotionName = [NSString stringWithFormat:@"表情%ld", (long)i];
//        NSMutableArray *emotions = [NSMutableArray array];
//        for (NSInteger j = 0; j < 18; j ++) {
//            XHEmotion *emotion = [[XHEmotion alloc] init];
//            NSString *imageName = [NSString stringWithFormat:@"section%ld_emotion%ld", (long)i , (long)j % 16];
//            emotion.emotionPath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"emotion%ld",(long)(j%16)] ofType:@"gif"];
//            emotion.emotionConverPhoto = [UIImage imageNamed:imageName];
//            [emotions addObject:emotion];
//        }
//        emotionManager.emotions = emotions;
//        [emotionManagers addObject:emotionManager];
//    }
    
    self.emotionManagers = [CDEmotionUtils emotionManagers];
}
@end
