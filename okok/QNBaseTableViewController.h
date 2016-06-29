//
//  QNBaseTableViewController.h
//  Qnotes3
//
//  Created by healmax on 2016/6/23.
//  Copyright © 2016年 QNAP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QNBaseViewController.h"

@interface QNBaseTableViewController : QNBaseViewController

@property (nonatomic, strong) UITableView *tableView;

- (void)initTableView;
@end
