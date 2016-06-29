//
//  QNSearchResultControllerViewController.h
//  Qnotes3
//
//  Created by healmax on 2016/6/27.
//  Copyright © 2016年 QNAP. All rights reserved.
//

#import "QNBaseTableViewController.h"

//#define QN_SEARCH_VIEW_CONTROLLER_HEADER_CELL_HEIGHT = 44.0
//#define QN_SEARCH_VIEW_CONTROLLER_CELL_HEIGHT = 100.0

@protocol QNSearchResultControllerDelegate

- (void)searchWithKeyword:(NSString *)keyword;

@end

@interface QNSearchResultController : QNBaseTableViewController<QNSearchResultControllerDelegate>{
    
    
}
//@interface QNSearchResultController : QNBaseTableViewController

//@property (nonatomic, strong) QNSearchViewController<QNSearchResultControllerDelegate> *test;

@end
