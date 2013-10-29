//
//  ParentViewController.m
//  test-present
//
//  Created by WilsonWan on 13-10-29.
//  Copyright (c) 2013年 WilsonWan. All rights reserved.
//

#import "ParentViewController.h"
#import "ChildViewController.h"
#import "UIViewController+ParentPresent.h"
#import "AppDelegate.h"

@interface ParentViewController ()

@end

@implementation ParentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    CGRect frame = self.view.frame;
    frame.origin.y = 100;
    frame.size.height = 50;

    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    [button setTitle:@"present" forState:UIControlStateNormal];
    [self.view addSubview:button];

    [button addTarget:self action:@selector(onButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onButtonClicked:(id)sender {
    ChildViewController *child = [[ChildViewController alloc] init];
    [self wyPresentViewController:child animated:[AppDelegate animated] completion:nil];
}
@end
