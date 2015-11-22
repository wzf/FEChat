//
//  ViewController.m
//  FEChatDemo
//
//  Created by wangzhanfeng on 15/11/22.
//  Copyright © 2015年 F.E. All rights reserved.
//

#import "ViewController.h"
#import "FEChatHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// conn to IM server
- (IBAction)btnAction_conn:(id)sender
{
    if (_userIdTxt.text.length == 0) {
        _userIdTxt.text = @"wzf";
    }
    
    //
    [[FEIMDataCenter center] connWithSelfID:_userIdTxt.text complete:^(BOOL isSuccess, NSError *error) {
        FEChatListVC *target = [FEChatListVC new];
        target.title = @"聊天";
        [self.navigationController pushViewController:target animated:YES];
    }];
}
@end
