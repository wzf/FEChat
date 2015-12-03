//
//  ViewController.m
//  FEChatManager
//
//  Created by wangzhanfeng-PC on 15/12/3.
//  Copyright © 2015年 F.E. All rights reserved.
//

#import "ViewController.h"
#import "FEIMCenter.h"

#import "CDChatListVC.h"

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

- (IBAction)btnAction_toChat:(id)sender
{
    if (_usernameTxt.text.length) {
        NSDictionary *clientUser = @{@"userID":_usernameTxt.text,
                                     @"username":[NSString stringWithFormat:@"%@名字",_usernameTxt.text],
                                     @"avatarURL":@""};
        [[FEIMCenter sharedInstance] openWithUser:clientUser callback:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                CDChatListVC *target = [[CDChatListVC alloc] init];
                [self.navigationController pushViewController:target animated:YES];
            }
        }];
    }
}

- (IBAction)btnAction_toChatWithMember:(id)sender
{
    if (_usernameTxt.text.length) {
        NSDictionary *clientUser = @{@"userID":_usernameTxt.text,
                                     @"username":[NSString stringWithFormat:@"%@名字",_usernameTxt.text],
                                     @"avatarURL":@""};
        [[FEIMCenter sharedInstance] openWithUser:clientUser callback:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                [self performSegueWithIdentifier:@"toTargetLists" sender:nil];
            }
        }];
    }
}
@end
