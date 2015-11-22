//
//  FEChatListVC.m
//  FEChat
//
//  Created by wangzhanfeng on 15/11/22.
//  Copyright © 2015年 F.E. All rights reserved.
//

#import "FEChatListVC.h"
#import "FEChatHeader.h"

@interface FEChatListVC ()

@end

@implementation FEChatListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setup];
    
#ifdef DEBUG
    [_dataArray addObject:@"Amy"];
    [_dataArray addObject:@"Jeff"];
#endif
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_setup
{
    self.iTableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        tableView.rowHeight    = 48.;
        tableView.dataSource   = self;
        tableView.delegate     = self;
        tableView;
    });
    [self.view addSubview:_iTableView];
    
    self.dataArray = [NSMutableArray arrayWithCapacity:1];
}

#pragma mark -
#pragma mark UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSString *cellName = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
    //
    [cell prepareForReuse];
    //
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = [@"  " stringByAppendingString:_dataArray[indexPath.row]];
    
    return cell;
}
#pragma mark -
#pragma mark UITableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *targetID = _dataArray[indexPath.row];
    
    [[FEIMDataCenter center] openConvertaionWithMemberIDs:@[targetID] complete:^(AVIMConversation *conversation, NSError *error) {
        
    }];
    
}
@end
