//
//  ChildViewController.m
//  test-present
//
//  Created by WilsonWan on 13-10-29.
//  Copyright (c) 2013年 WilsonWan. All rights reserved.
//

#import "ChildViewController.h"
#import "UIViewController+ParentPresent.h"
#import "AppDelegate.h"

@interface ChildViewController ()

@end

@implementation ChildViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"%p init", self);
    }
    return self;
}

- (void)dealloc{
    NSLog(@"%p dealloc", self);
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%p will appear, animated=%d", self, animated);
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    CGFloat red = (arc4random() & 0xff) / 255.0f;
    CGFloat green = (arc4random() & 0xff) / 255.0f;
    CGFloat blue = (arc4random() & 0xff) / 255.0f;

    self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];

    {
        CGRect frame = self.view.frame;
        frame.origin.y = 150;
        frame.size.height = 50;

        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = frame;
        [button setTitle:@"parent present" forState:UIControlStateNormal];
        [self.view addSubview:button];

        [button addTarget:self action:@selector(onParentPresent:) forControlEvents:UIControlEventTouchUpInside];
    }

    {
        CGRect frame = self.view.frame;
        frame.origin.y = 250;
        frame.size.height = 50;

        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = frame;
        [button setTitle:@"dismiss" forState:UIControlStateNormal];
        [self.view addSubview:button];

        [button addTarget:self action:@selector(onDismiss:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)onParentPresent:(id)sender {
    ChildViewController *brother = [[ChildViewController alloc] init];
    [self wyParentPresentViewController:brother animated:[AppDelegate animated] completion:nil];
}

- (void)onDismiss:(id)sender {
    [self wyDismissViewControllerFromParentAnimated:[AppDelegate animated]completion:nil];
}
@end
