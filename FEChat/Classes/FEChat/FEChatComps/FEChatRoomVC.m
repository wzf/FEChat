//
//  FEChatRoomVC.m
//  FEChat
//
//  Created by wangzhanfeng on 15/11/22.
//  Copyright © 2015年 F.E. All rights reserved.
//

#import "FEChatRoomVC.h"
#import "XHAudioPlayerHelper.h"

@interface FEChatRoomVC ()

@end

@implementation FEChatRoomVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[XHAudioPlayerHelper shareInstance] stopAudio];
}

- (void)_setupEmotions
{
    // 设置表情
    [_conversation setupEmotions];
    // 重新加载数据
    [self.emotionManagerView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
