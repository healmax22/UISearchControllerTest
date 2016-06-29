//
//  QNSearchResultControllerViewController.m
//  Qnotes3
//
//  Created by healmax on 2016/6/27.
//  Copyright © 2016年 QNAP. All rights reserved.
//

#import "QNSearchResultController.h"
//#import "QNSystemService.h"
//#import "QNSearchService.h"
//#import "QNErrorHandler.h"
//#import "QNSearchViewCell.h"
//#import "QNTagHeaderCell.h"

@interface QNSearchResultController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *sites;
@property (nonatomic, strong) NSMutableArray *notesInSites;

@end

@implementation QNSearchResultController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)initTableView {
    [super initTableView];
//    [self.tableView registerNib:[UINib nibWithNibName:@"QNSearchViewCell" bundle:nil] forCellReuseIdentifier:@"QNSearchViewCell"];
//    [self.tableView registerNib:[UINib nibWithNibName:@"QNTagHeaderCell" bundle:nil] forCellReuseIdentifier:@"QNTagHeaderCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSArray *notes = self.notesInSites[section];
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *resultCell;
//    if (indexPath.row == 0) {
//        QNTagHeaderCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"QNTagHeaderCell" forIndexPath:indexPath];
//        cell.siteViewModel = self.sites[indexPath.section];
//        cell.userInteractionEnabled = NO;
//        resultCell = cell;
//    } else {
//        QNSearchViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"QNSearchViewCell" forIndexPath:indexPath];
//        NSArray *notes = self.notesInSites[indexPath.section];
//        cell.noteViewModel = notes[indexPath.row-1];
//        cell.userInteractionEnabled = YES;
//        resultCell = cell;
//    }
    
    return resultCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 44.0f;
    } else {
        return 100.0f;
    }
}

#pragma mark - QNSearchResultControllerDelegate  

- (void)searchWithKeyword:(NSString *)keyword {
//    __block __weak QNSearchResultController *weakSelf = self;
//    
//    QNSystemService *service = [[QNSystemService alloc] init];
//    [[[[[service fetchSiteList] deliverOn:[RACScheduler mainThreadScheduler]]
//       flattenMap:^RACStream *(NSMutableArray *siteList) {
//           NSMutableArray *signalArray = [[NSMutableArray alloc] init];
//           QNSearchService *service = [[QNSearchService alloc] init];
//           for (QNSite *site in siteList) {
//               [signalArray addObject:[service fetchNoteListWithKeyWord:keyword site:site]];
//           }
//           weakSelf.sites = siteList;
//           return [RACSignal zip:signalArray];
//       }]
//      map:^id(RACTuple *responseTuple) {
//          return responseTuple.rac_sequence.array;
//      }] subscribeNext:^(NSMutableArray *notesInSites) {
//          weakSelf.notesInSites = [notesInSites mutableCopy];
//          for (NSArray *notes in notesInSites) {
//              if(notes.count == 0){
//                  NSInteger index = [notesInSites indexOfObject:notes];
//                  [weakSelf.notesInSites removeObjectAtIndex:index];
//                  [weakSelf.sites removeObjectAtIndex:index];
//              }
//          }
//          [weakSelf.tableView reloadData];
//      } error:^(NSError *error) {
//          [QNErrorHandler showErrorMessageWithError:error];
//      }];
}


@end
