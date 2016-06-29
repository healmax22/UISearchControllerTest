//
//  QNBaseViewController.m
//  Qnotes3
//
//  Created by healmax on 2016/6/20.
//  Copyright © 2016年 QNAP. All rights reserved.
//

#import "QNBaseViewController.h"

//#import "MMDrawerBarButtonItem.h"
//#import "MCNavigationController.h"
//#import "Macros.h"

#define disabledButtonColor [UIColor grayColor]

CGFloat kBarButtonItemWidth  = 44;
CGFloat kBarButtonItemHeight = 44;
CGFloat kDropDownViewWidth   = 100;

@interface QNBaseViewController ()

@property (nonatomic, strong) UIView *rightButtonView;
@property (nonatomic, strong) UIView *dropDownView;

@end

@interface QNBaseViewController ()

@end

@implementation QNBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton=YES;
    
    //Setup NAvigation bar
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.maxRightBarButtonItemsToShow = 2;
    self.distanceBetweenBarButtonItems = 0;
    _navRightBarButtonTypes = @[@(NavigationBarButtonTypeSearch),@(NavigationBarButtonTypeMore)];
    [self setupNavigationBar];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (UIView *)rightButtonView {
    if (!_rightButtonView) {
        CGFloat width = self.navRightBarButtons.count > self.maxRightBarButtonItemsToShow ?
        self.maxRightBarButtonItemsToShow * (kBarButtonItemWidth + self.distanceBetweenBarButtonItems) - self.distanceBetweenBarButtonItems :
        self.navRightBarButtons.count * (kBarButtonItemWidth + self.distanceBetweenBarButtonItems) - self.distanceBetweenBarButtonItems;
        
        _rightButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, self.navigationController.navigationBar.frame.size.height)];
        _rightButtonView.backgroundColor=[UIColor clearColor];
    }
    return _rightButtonView;
}


#pragma mark - Navigation bar setup methods
- (void)setNavLeftBarButtonTypes:(NSArray *)navLeftBarButtonTypes {
    _navLeftBarButtonTypes = navLeftBarButtonTypes;
    self.navLeftBarButtons = [self buttonsWithNavigationBarButtonTypes:navLeftBarButtonTypes];
    //    [self setupNavigationBar];
}

- (void)setNavRightBarButtonTypes:(NSArray *)navRightBarButtonTypes {
    _navRightBarButtonTypes = navRightBarButtonTypes;
    self.navRightBarButtons = [self buttonsWithNavigationBarButtonTypes:navRightBarButtonTypes];
    //    [self setupNavigationBar];
}

- (void)setNavLeftBarButtons:(NSArray *)navLeftBarButtons {
    _navLeftBarButtons = navLeftBarButtons;
    [self setupNavigationBar];
}

- (void)setNavRightBarButtons:(NSArray *)navRightBarButtons {
    _navRightBarButtons = navRightBarButtons;
    [self setupNavigationBar];
}

- (void)setNavLeftBarButtonsWithDefaultTypes:(NSArray <NSNumber *> *) types {
    self.navLeftBarButtonTypes = types;
}

- (void)setNavRightBarButtonsWithDefaultTypes:(NSArray *) types {
    self.navRightBarButtonTypes = types;
}

- (void)setNavLeftBarButtonsWithCustomButtons:(NSArray *) buttons {
    self.navLeftBarButtons = buttons;
}

- (void)setNavRightBarButtonsWithCustomButtons:(NSArray *) buttons {
    self.navRightBarButtons = buttons;
}

- (void)setRightNavigationButtonsEnabled:(BOOL)enabled {
    for (UIBarButtonItem *barItem in self.navigationItem.rightBarButtonItems) {
        barItem.enabled = enabled;
    }
}

- (void)setupNavigationBar {
    
    
    //vincent reset the rightButtonView 
    self.rightButtonView = nil;
    
    //------------------------------------------------------------------------------------------------
    //NAvigation bar style
    //------------------------------------------------------------------------------------------------
    //TODO
//    [self.navigationController.navigationBar setBarTintColor:kNavigationBarColor];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.translucent = NO;
    //------------------------------------------------------------------------------------------------
    
    
    //------------------------------------------------------------------------------------------------
    //Right navigation bar buttons setup
    //------------------------------------------------------------------------------------------------
    [self addNavigationBarRightButtons:_navRightBarButtons];
    //------------------------------------------------------------------------------------------------
    
    
    
    //------------------------------------------------------------------------------------------------
    //Left navigation bar button setup
    //------------------------------------------------------------------------------------------------
    [self addNavigationBarLeftButtons:_navLeftBarButtonTypes];
    //------------------------------------------------------------------------------------------------
}

/**
 *  Deprecated at 2016/03/02 by Tristan.
 *
 *  get navigation right buttons Type Array (NavigationButtonType)
 *
 *  @return NSArray
 */
-(NSArray *) getRightButtonsTypeArray {
    return @[@(NavigationBarButtonTypeMore)];
}

- (void)addNavigationBarRightButton:(UIButton *)button {
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:_navRightBarButtons];
    [array addObject:button];
    _navRightBarButtons = array;
//    _navRightBarButtons = navRightBarButtons;
    [self setupNavigationBar];
}

- (void)addNavigationBarLeftButtons:(NSArray *)buttonTypeArray {
    
    
    //Button implemantation
    //    UIButton * backItem = [self getBackBarButtonItem];
    UIView *leftButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 66, self.navigationController.navigationBar.frame.size.height)];
    leftButtonView.backgroundColor = [UIColor clearColor];
    
    
//    //TODO
//    if (self.navigationController.viewControllers.count == 1 &&
//        ([self.navigationController.parentViewController isKindOfClass:[UITabBarController class]])) {
//            self.backButton = [self getMenuBarButtonItem];
//        }
    //TODO
    if (self.navigationController.viewControllers.count == 1) {
        self.backButton = [self getMenuBarButtonItem];
    }
    else {
        self.backButton = [self getBackBarButtonItem];
    }
    [leftButtonView addSubview:self.backButton];
    
    
    UIBarButtonItem *fixedSpace = [self getFixedSpaceBarButtonItem];  // Fixed space
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButtonView];
    self.navigationItem.leftBarButtonItems = @[fixedSpace, leftBarButtonItem];
}

-(void) addNavigationBarRightButtons : (NSArray *) buttonTypeArray {
    self.rightButtonView = nil;
    NSUInteger buttonCount = _navRightBarButtons.count;
    if(buttonCount == 0) {
        return;
    }
    
    // Right bar button items
    for (int index = 0; index < buttonCount; index++) {
        // Set button to correct position.
        UIButton *navigationBtn = _navRightBarButtons[index];
        navigationBtn.frame = [self frameOfRightButtonAtIndex:index];
        
        // Add button to coresponding view.
        if (index < self.maxRightBarButtonItemsToShow - 1) {
            [navigationBtn setTitle:@"" forState:UIControlStateNormal];
            [self.rightButtonView addSubview:navigationBtn];
        } else if (index == self.maxRightBarButtonItemsToShow - 1) {
            if (buttonCount > self.maxRightBarButtonItemsToShow) {
                UIButton *moreButton = [self getNavigationMoreButton];
                [self.rightButtonView addSubview:moreButton];
                [self.dropDownView addSubview:navigationBtn];
            } else {
                [self.rightButtonView addSubview:navigationBtn];
            }
            
        } else {
            [self.dropDownView addSubview:navigationBtn];
        }
    }
    
    UIBarButtonItem *fixedSpace = [self getFixedSpaceBarButtonItem];  // Fixed space
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightButtonView];
    self.navigationItem.rightBarButtonItems = @[fixedSpace, rightBarButtonItem];
}

- (CGRect)frameOfRightButtonAtIndex:(NSInteger)index {
    CGRect frame;
    
    // Buttons can show in navigation bar.
    if (index < self.maxRightBarButtonItemsToShow - 1) {
        frame = CGRectMake(index*kBarButtonItemWidth + index*self.distanceBetweenBarButtonItems,
                           0,
                           kBarButtonItemWidth,
                           kBarButtonItemHeight);
    } else {
        if (self.navRightBarButtons.count > self.maxRightBarButtonItemsToShow) {
            // Frame in the drop down view.
            index -= (self.maxRightBarButtonItemsToShow - 1);
            frame = CGRectMake(0, index*kBarButtonItemWidth +
                               index*self.distanceBetweenBarButtonItems,
                               kDropDownViewWidth,
                               kBarButtonItemHeight);
        } else {
            frame = CGRectMake(index*kBarButtonItemWidth + index*self.distanceBetweenBarButtonItems,
                               0,
                               kBarButtonItemWidth,
                               kBarButtonItemHeight);
        }
        
    }
    
    return frame;
}

#pragma mark - Drop Down View

- (UIView *)dropDownView {
    if (!_dropDownView) {
        NSUInteger buttonCount = self.navRightBarButtons.count;
        CGFloat viewWidth  = 100;
        CGFloat viewHeight = (buttonCount - self.maxRightBarButtonItemsToShow + 1) * kBarButtonItemHeight;
        _dropDownView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.bounds) - viewWidth, 0, viewWidth, viewHeight)];
        _dropDownView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        _dropDownView.alpha = 0;
        [self.view addSubview:_dropDownView];
    }
    return _dropDownView;
}

- (void)showDropDownView {
    [UIView animateWithDuration:0.3 animations:^{
        self.dropDownView.alpha = 1;
    }];
}

- (void)hideDropDownView {
    [UIView animateWithDuration:0.3 animations:^{
        self.dropDownView.alpha = 0;
    }];
}

#pragma mark - Action Sheet

- (void)showActionSheet {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:NSLocalizedString(@"CANCEL",@"CANCEL")
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:nil];
    
    // Add buttons with titles.
    NSInteger initIndex = self.maxRightBarButtonItemsToShow <= 1 ? 0 : self.navRightBarButtons.count - self.maxRightBarButtonItemsToShow;
    
    for (NSInteger i=initIndex; i<self.navRightBarButtons.count; i++) {
        UIButton *button = self.navRightBarButtons[i];
        [actionSheet addButtonWithTitle:button.titleLabel.text];
    }
    
    
    [actionSheet showInView:self.view];
}

/**
 *  We do every thing after action sheet disappeared,
 *  otherwise what we show in the view would be overlap by origin view.
 */
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex > 0) {
        NSInteger realIndex = (self.maxRightBarButtonItemsToShow - 1) + (buttonIndex - 1);
        UIButton *btn = self.navRightBarButtons[realIndex];
        [btn sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark - Buttons

- (NSArray *)buttonsWithNavigationBarButtonTypes:(NSArray *)types {
    NSMutableArray *buttons = [NSMutableArray new];
    
    for (NSInteger i=0; i<types.count; i++) {
        NavigationBarButtonType type = [types[i] integerValue];
        UIButton *button = [self navButtonWithType:type];
        [buttons addObject:button];
    }
    
    return buttons;
}

- (UIButton *)navButtonWithType:(NavigationBarButtonType)buttonType{
    UIButton *navigationBtn;
    
    switch (buttonType) {
        case NavigationBarButtonTypeSearch:
            navigationBtn = [self getNavigationSearchButton];
            break;
        case NavigationBarButtonTypeEdit:
            navigationBtn = [self getNavigationEditButton];
            break;
        case NavigationBarButtonTypeMore:
            navigationBtn = [self getNavigationMoreButton];
            break;
        case NavigationBarButtonTypeAdd:
            navigationBtn = [self getNavigationAddButton];
            break;
        case NavigationBarButtonTypeMenu:
            navigationBtn = [self getNavigationMenuButton];
            break;
        case NavigationBarButtonTypeBack:
            navigationBtn = [self getBackBarButtonItem];
            break;
        default:
            break;
    }
    
    return navigationBtn;
}

- (UIButton *)navButtonWithImage:(UIImage *)image Title:(NSString *)title action:(SEL)selector {
    if (!title) title = @"";
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kBarButtonItemWidth, kBarButtonItemHeight)];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

- (UIButton *)getNavigationSearchButton {
    UIButton *searchButton = [[UIButton alloc] init];
    [searchButton setImage:[UIImage imageNamed:@"ic_search"] forState:UIControlStateNormal];
    [searchButton setTitle:NSLocalizedString(@"SEARCH", @"Search") forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(navSearchPressed:) forControlEvents:UIControlEventTouchUpInside];
    return searchButton;
}

- (UIButton *) getNavigationMenuButton{
    UIButton *menuButton = [[UIButton alloc] init];
    [menuButton setImage:[[UIImage imageNamed:@"ic_menu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                forState:UIControlStateNormal];
    [menuButton setTitle:NSLocalizedString(@"MENU", @"Menu") forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(navMenuPressed:) forControlEvents:UIControlEventTouchUpInside];
    return menuButton;
}



- (UIButton *)getNavigationEditButton{
    UIButton *moreButton = [[UIButton alloc] init];
    [moreButton setImage:[UIImage imageNamed:@"ic_selectmore"] forState:UIControlStateNormal];
    [moreButton setTitle:NSLocalizedString(@"EDIT", @"Edit") forState:UIControlStateNormal];
    [moreButton addTarget:self action:@selector(navEditPressed:) forControlEvents:UIControlEventTouchUpInside];
    return moreButton;
}

- (UIButton *)getNavigationAddButton{
    UIButton *addButton = [[UIButton alloc] init];
    [addButton setImage:[[UIImage imageNamed:@"ic_nav_add"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [addButton setTitle:NSLocalizedString(@"ADD", @"Add") forState:UIControlStateNormal];
    addButton.tintColor = [UIColor whiteColor];
    [addButton addTarget:self action:@selector(navAddPressed:) forControlEvents:UIControlEventTouchUpInside];
    return addButton;
}

- (UIButton *)getNavigationMoreButton {
    // The position of more button is static.
    UIButton *moreButton = [[UIButton alloc] initWithFrame:CGRectMake(self.rightButtonView.frame.size.width-kBarButtonItemWidth,
                                                                      0,
                                                                      kBarButtonItemWidth,
                                                                      kBarButtonItemHeight)];
    [moreButton setImage:[UIImage imageNamed:@"ic_more"] forState:UIControlStateNormal];
    [moreButton setTitle:NSLocalizedString(@"More", @"More") forState:UIControlStateNormal];
    [moreButton addTarget:self action:@selector(navMorePressed:) forControlEvents:UIControlEventTouchUpInside];
    return moreButton;
}

- (UIButton *)getMenuBarButtonItem {
    UIButton *menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    
    [menuButton setImage:[UIImage imageNamed:@"btn_nav_sidemenu"] forState:UIControlStateNormal];
    [menuButton setTitle:NSLocalizedString(@"MENU", @"Menu") forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(navMenuPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    return menuButton;
}

- (UIButton *)getBackBarButtonItem {
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    
    [backBtn setImage:[UIImage imageNamed:@"ic_nav_back"] forState:UIControlStateNormal];
    //    [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -15, 0, -15)];
    [backBtn setTitle:NSLocalizedString(@"BACK", @"Back") forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(navBackPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    return backBtn;
}

- (UIBarButtonItem *)getFixedSpaceBarButtonItem {
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                target:nil
                                                                                action:nil];
    fixedSpace.width = -15;
    
    return fixedSpace;
}


#pragma mark - Button Pressed

///**
// *  Show / Hide left menu
// *  Show left menu if left menu is now hidden.
// *  Hide left menu if left menu is now shown.
// */
//- (void)leftMenuPressed {
//    
//    [self.view endEditing:YES];
//    
//    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
//}
//
///**
// *  Show / Hide right menu
// *  Show right menu if right menu is now hidden.
// *  Hide right menu if right menu is now shown.
// */
//- (IBAction)rightEditPressed:(id)sender {
//    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
//}

- (IBAction)navSearchPressed:(id)sender {
    
}

- (IBAction)navMorePressed:(id)sender{
    
//        if (self.dropDownView.alpha == 0) {
//            [self showDropDownView];
//        } else {
//            [self hideDropDownView];
//        }
    
    [self showActionSheet];
    
    //    UIStoryboard *navigationMorePopoverStoryBoard = [UIStoryboard storyboardWithName:@"NavigationMorePopover" bundle:[NSBundle mainBundle]];
    //    UINavigationController *navigationController = [navigationMorePopoverStoryBoard instantiateViewControllerWithIdentifier:@"MorePopoverNavigation"];
    //    self.moreTable = navigationController.viewControllers[0];
    //    self.moreTable.items = self.navigationMoreItems;
    //    self.moreTable.filterItems = self.navigationMoreFilterItems;
    //    self.moreTable.orderdelegate = self;
    //    self.moreTable.parentControllerName = [[self class] description];
    //    self.moreTable.currentBook = self.favoBook;
    //
    //    //    navigationController.navigationBar.backgroundColor = [UIColor grayColor];
    //
    //    if(IS_IPAD) {
    //
    //        if (_morePopoverController== nil) {
    //            _morePopoverController = [[UIPopoverController alloc] initWithContentViewController:navigationController];
    //        }
    //
    //        if (OS_VERSION < 8.0) {
    //
    //            _morePopoverController.contentViewController.preferredContentSize = CGSizeMake(100, 100);
    //
    //        }else {
    //
    //            [_morePopoverController setPopoverContentSize:CGSizeMake(100, 100) animated:YES];
    //
    //        }
    //
    //
    //
    //        UIBarButtonItem *barBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    //        self.moreTable.morePopoverController = _morePopoverController;
    //        [_morePopoverController presentPopoverFromBarButtonItem:barBtn permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    //
    //    } else {
    //
    //        [self presentViewController:navigationController animated:YES completion:nil];
    //    }
    //
}

- (IBAction)navEditPressed:(id)sender {
    [self hideDropDownView];
}

- (IBAction)navAddPressed:(id)sender {
    [self hideDropDownView];
}

- (IBAction)navMenuPressed:(id)sender {
//    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
//    [kMainViewController showLeftViewAnimated:YES completionHandler:nil];
}

- (IBAction)navBackPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    //    [self.navigationController.navigationBar
    //     setFrame:CGRectMake(0, 0, self.navigationController.navigationBar.frame.size.width, 68)];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end
