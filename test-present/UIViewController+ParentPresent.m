//
// Created by wilsonwan on 13-10-29.
//
// Copyright (c) 2013年 Tencent. All rights reserved.
//


#import "UIViewController+ParentPresent.h"

#define ANIMATION_DURATION (0.3f)

@implementation UIViewController (ParentPresent)
- (void)wyPresentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)animated completion:(void (^)(void))completion {
    [self addChildViewController:viewControllerToPresent];

    if (!animated) {
        [self.view addSubview:viewControllerToPresent.view];
        if (completion != nil) {
            completion();
        }
        return;
    }

    CGRect frame = self.view.frame;
    viewControllerToPresent.view.frame = CGRectMake(0, frame.size.height, frame.size.width, frame.size.height);
    [self.view addSubview:viewControllerToPresent.view];

    [UIView animateWithDuration:ANIMATION_DURATION
            animations:^{
                viewControllerToPresent.view.frame = frame;
            }
            completion:^(BOOL finished){
                if (finished && completion != nil) {
                    completion();
                }
            }
    ];
}

- (void)wyParentPresentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)animated completion:(void (^)(void))completion {
    UIViewController *presentingViewController = self.parentViewController;

    [presentingViewController addChildViewController:viewControllerToPresent];

    if (!animated) {
        [presentingViewController transitionFromViewController:self
                                              toViewController:viewControllerToPresent
                                                      duration:0
                                                       options:UIViewAnimationOptionTransitionNone
                                                    animations:nil
                                                    completion:^(BOOL finished){
                                                        if (finished && completion != nil) {
                                                            completion();
                                                        }
                                                    }
        ];
        return;
    }

    CGRect frame = self.view.frame;
    viewControllerToPresent.view.frame = CGRectMake(0, frame.size.height, frame.size.width, frame.size.height);
    [presentingViewController transitionFromViewController:self
                                          toViewController:viewControllerToPresent
                                                  duration:ANIMATION_DURATION
                                                   options:UIViewAnimationOptionTransitionNone
                                                animations:^{
                                                    viewControllerToPresent.view.frame = frame;
                                                }
                                                completion:^(BOOL finished){
                                                    [self removeFromParentViewController];
                                                }
    ];
}

- (void)wyDismissViewControllerFromParentAnimated:(BOOL)animated completion:(void (^)(void))completion {
    if (!animated) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
        if (completion != nil) {
            completion();
        }
        return;
    }

    CGRect frame = self.view.frame;
    [UIView animateWithDuration:ANIMATION_DURATION
                     animations:^{
                         self.view.frame = CGRectMake(0, frame.size.height, frame.size.width, frame.size.height);
                     }
                     completion:^(BOOL finished){
                         [self.view removeFromSuperview];
                         [self removeFromParentViewController];

                         if (finished && completion != nil) {
                             completion();
                         }
                     }];
}

@end