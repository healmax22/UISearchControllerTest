//
//  QNSearchViewController.h
//  Qnotes3
//
//  Created by healmax on 2016/6/24.
//  Copyright © 2016年 QNAP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QNBaseViewController.h"
#import "QNSearchResultController.h"

@interface QNSearchViewController : QNBaseViewController

@property (nonatomic, strong) UIViewController<QNSearchResultControllerDelegate> *searchResultViewController;

- (void)setNavRightButtons;

@end
