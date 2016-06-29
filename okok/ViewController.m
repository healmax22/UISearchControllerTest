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
    
//    UIButton *searchViewButton = [[UIButton alloc] init];
//    [searchViewButton setImage:[UIImage imageNamed:@"ic_search_close"] forState:UIControlStateNormal];
//    [searchViewButton addTarget:self action:@selector(searchViewButtonOnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self addNavigationBarRightButton:searchViewButton];
//    // Do any additional setup after loading the view, typically from a nib.
}

- (void)pushViewController {
    UIStoryboard *s = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *controller = [s instantiateViewControllerWithIdentifier:@"ViewController"];
    UINavigationController *nav = [s instantiateViewControllerWithIdentifier:@"NavViewController"];
    ViewController *controller1 = [s instantiateViewControllerWithIdentifier:@"ViewController1ViewController"];
    
//    ViewController *controller = [[ViewController alloc] init];
    [self.navigationController pushViewController:controller1 animated:YES];
//    [self presentViewController:nav animated:YES completion:nil];
}

- (void)searchViewButtonOnClick {
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(-5.0, 0.0, 320.0, 44.0)];
//    searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//    UIView *searchBarView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 310.0, 44.0)];
//    searchBarView.autoresizingMask = 0;
//    [searchBarView addSubview:searchBar];
    self.navigationItem.titleView = searchBar;
    [searchBar sizeToFit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
