//
//  FEIMUser.h
//  FEChatManager
//
//  Created by wangzhanfeng-PC on 15/12/3.
//  Copyright © 2015年 F.E. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeanChatLib.h"

@interface FEIMUser : NSObject<CDUserModel>
@property (copy, nonatomic) NSString *userID; //
@property (copy, nonatomic) NSString *username; //
@property (copy, nonatomic) NSString *avatarURL; //
@end
