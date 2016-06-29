//
//  ViewController.m
//  okok
//
//  Created by healmax on 2016/6/28.
//  Copyright © 2016年 healmax. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *searchButton = [[UIButton alloc] init];
    [searchButton setImage:[UIImage imageNamed:@"ic_search_close"] forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    [self addNavigationBarRightButton:searchButton];
}

- (void)pushViewController {
    UIStoryboard *s = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *controller = [s instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
