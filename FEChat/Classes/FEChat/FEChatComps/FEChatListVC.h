//
//  FEChatListVC.h
//  FEChat
//
//  Created by wangzhanfeng on 15/11/22.
//  Copyright © 2015年 F.E. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FEChatListVC : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *iTableView;

@property (strong, nonatomic) NSMutableArray *dataArray;
@end
