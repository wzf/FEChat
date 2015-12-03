//
//  TargetListVC.m
//  FEChatManager
//
//  Created by wangzhanfeng-PC on 15/12/3.
//  Copyright © 2015年 F.E. All rights reserved.
//

#import "TargetListVC.h"
#import "CDChatRoomVC.h"
#import "FEIMUserCenter.h"

@interface TargetListVC ()
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation TargetListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[@{@"userID":@"wzf", @"username":@"王占峰", @"avatarURL":@""}];
}

#pragma mark -
#pragma mark UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = _dataArray[indexPath.row][@"username"];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    
    //
    return cell;
}

#pragma mark -
#pragma mark UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *userDict = _dataArray[indexPath.row];
    __weak typeof(self) weakSelf = self;
    [[CDChatManager sharedManager] fetchConvWithOtherId:userDict[@"userID"] callback:^(AVIMConversation *conversation, NSError *error) {
        if (error == nil) {
            [[FEIMUserCenter sharedInstance] registerCommonUsers:@[userDict]];
            CDChatRoomVC *target = [[CDChatRoomVC alloc] initWithConv:conversation];
            [weakSelf.navigationController pushViewController:target animated:YES];
        }
    }];
    
}

@end
