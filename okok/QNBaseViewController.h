//
//  QNBaseViewController.h
//  Qnotes3
//
//  Created by healmax on 2016/6/20.
//  Copyright © 2016年 QNAP. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, NavigationBarButtonType) {
    NavigationBarButtonTypeMore = 0,
    NavigationBarButtonTypeEdit = 1,
    NavigationBarButtonTypeSearch = 2,
    NavigationBarButtonTypeAdd,
    NavigationBarButtonTypeMenu,
    NavigationBarButtonTypeBack
};

@interface QNBaseViewController : UIViewController<UIActionSheetDelegate>

@property (nonatomic, assign) NSInteger maxRightBarButtonItemsToShow;
@property (nonatomic, assign) NSInteger maxLeftBarButtonItemsToShow;
@property (nonatomic, assign) CGFloat   distanceBetweenBarButtonItems;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) NSArray *navRightBarButtonTypes;
@property (nonatomic, strong) NSArray *navLeftBarButtonTypes;
@property (nonatomic, strong) NSArray *navRightBarButtons;
@property (nonatomic, strong) NSArray *navLeftBarButtons;

- (void)showDropDownView;
- (void)hideDropDownView;

- (UIButton *)navButtonWithType:(NavigationBarButtonType)buttonType;
- (UIButton *)navButtonWithImage:(UIImage *)image Title:(NSString *)title action:(SEL)selector;

- (void)setNavLeftBarButtonsWithDefaultTypes:(NSArray <NSNumber *> *) types;
- (void)setNavRightBarButtonsWithDefaultTypes:(NSArray *) types;
- (void)setNavLeftBarButtonsWithCustomButtons:(NSArray *) buttons;
- (void)setNavRightBarButtonsWithCustomButtons:(NSArray *) buttons;
- (void)setRightNavigationButtonsEnabled:(BOOL)enabled;

- (void)addNavigationBarRightButton:(UIButton *)button;

@end
