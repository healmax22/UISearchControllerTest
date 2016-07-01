//
//  QNSearchResultControllerViewController.m
//  Qnotes3
//
//  Created by healmax on 2016/6/27.
//  Copyright © 2016年 QNAP. All rights reserved.
//

#import "QNSearchResultController.h"
#import "ViewController.h"
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSArray *notes = self.notesInSites[section];
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *resultCell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    resultCell.textLabel.text = @"tt";
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *s = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *controller = [s instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.presentingViewController.navigationController pushViewController:controller animated:YES];
}

#pragma mark - QNSearchResultControllerDelegate  

- (void)searchWithKeyword:(NSString *)keyword {

}


@end
