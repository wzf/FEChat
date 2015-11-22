//
//  FEChatRoomVC.h
//  FEChat
//
//  Created by wangzhanfeng on 15/11/22.
//  Copyright © 2015年 F.E. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHMessageTableViewController.h"
#import "FEChatHeader.h"

@interface FEChatRoomVC : XHMessageTableViewController
@property (strong, nonatomic) FEConversation *conversation;

// 增加部分

@end
