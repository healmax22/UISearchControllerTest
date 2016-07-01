//
//  QNSearchViewController.m
//  Qnotes3
//
//  Created by healmax on 2016/6/24.
//  Copyright © 2016年 QNAP. All rights reserved.
//

#import "QNSearchViewController.h"
#import "QNSearchResultController.h"
//#import "QNHomeNavigationController.h"

@interface QNSearchViewController()<UISearchControllerDelegate, UISearchBarDelegate>

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSArray<UIBarButtonItem *> *tempRightBarButtonItems;
@property (nonatomic, strong) NSArray<UIBarButtonItem *> *tempLeftBarButtonItems;
@property (nonatomic, strong) UIView *tempTitleView;
@property (nonatomic, strong) UINavigationController *searchResultNavController;


@end

@implementation QNSearchViewController
//@synthesize searchResultViewController;
#pragma mark - getter setter


#pragma mark - viewController life cycle
-(void)viewDidLoad {
    [super viewDidLoad];
    [self setupSearchController];
    [self setNavRightButtons];
}


#pragma mark - UI Setup
- (void)setNavRightButtons {
    UIButton *searchButton = [[UIButton alloc] init];
    [searchButton setImage:[UIImage imageNamed:@"btn_nav_search"] forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(searchOnClick) forControlEvents:UIControlEventTouchUpInside];
    self.maxLeftBarButtonItemsToShow = 2;
    self.navRightBarButtons = @[searchButton];
}

- (void)searchOnClick {
    self.tempRightBarButtonItems = self.navigationItem.rightBarButtonItems;
    self.tempLeftBarButtonItems = self.navigationItem.leftBarButtonItems;
    self.tempTitleView = self.navigationItem.titleView;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.searchController.searchBar.alpha = 0.0f;
        
    } completion:^(BOOL finished) {
        
        // remove the search button
//        self.navigationItem.rightBarButtonItems = nil;
//        self.navigationItem.leftBarButtonItems = nil;
//        self.navigationItem.titleView = nil;
        // add the search bar (which will start out hidden).
        self.navigationItem.titleView = _searchController.searchBar;
        self.searchController.searchBar.alpha = 0.0;
        
        [UIView animateWithDuration:0.5
                         animations:^{
                             self.searchController.searchBar.alpha = 1.0;
                         } completion:^(BOOL finished) {
                             [self.searchController.searchBar becomeFirstResponder];
                         }];
        
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.definesPresentationContext = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.definesPresentationContext = NO;
}

- (void)setupSearchController {
    if (!self.searchResultViewController) {
        self.searchResultViewController = [[QNSearchResultController alloc] init];
    }
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:self.searchResultViewController ];
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    self.searchController.delegate = self;
    self.searchController.searchBar.delegate = self;
//    [self.searchController.searchBar sizeToFit];
    
//    self.definesPresentationContext = YES;
}

#pragma mark - UISearchControllerDelegate 
- (void)didDismissSearchController:(UISearchController *)searchController {
    
    [UIView animateWithDuration:0.5f animations:^{
        self.searchController.searchBar.alpha = 0.0;
    } completion:^(BOOL finished) {
        self.navigationItem.titleView = nil;
//        self.navigationItem.rightBarButtonItems = self.tempRightBarButtonItems;
//        self.navigationItem.leftBarButtonItems = self.tempLeftBarButtonItems;
//        self.navigationItem.titleView = self.tempTitleView;
        self.searchController.searchBar.alpha = 0.0;  // set this *after* adding it back
        [UIView animateWithDuration:0.5f animations:^ {
            self.searchController.searchBar.alpha = 1.0;
        }];
    }];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *searchString = [self.searchController.searchBar text];
    
    if (self.searchController.searchResultsController == self.searchResultViewController) {
        [self.searchResultViewController searchWithKeyword:searchString];
        
    }
}
@end
