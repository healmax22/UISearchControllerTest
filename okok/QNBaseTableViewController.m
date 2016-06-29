//
//  QNBaseTableViewController.m
//  Qnotes3
//
//  Created by healmax on 2016/6/23.
//  Copyright © 2016年 QNAP. All rights reserved.
//

#import "QNBaseTableViewController.h"

@interface QNBaseTableViewController() <UITableViewDelegate, UITableViewDataSource>

//@property (nonatomic, strong) UITableView *tableView;

@end

@implementation QNBaseTableViewController

//-(instancetype)init {
//    if (self = [super init]) {
//        
//    }
//    
//    return self;
//}
//
//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    if (self = [super initWithCoder:aDecoder]) {
//        
//    }
//    
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    [self setupTableViewConstraints];
}

- (void)initTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.tableView  setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.tableView  setDelegate:self];
    [self.tableView  setDataSource:self];
    [self.tableView  registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:self.tableView];
}

- (void)setupTableViewConstraints{
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_tableView]|" options:0 metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_tableView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_tableView)]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    return cell;
}

@end
