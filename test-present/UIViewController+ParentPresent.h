//
// Created by wilsonwan on 13-10-29.
//
// Copyright (c) 2013年 Tencent. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface UIViewController (ParentPresent)
- (void)wyPresentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)animated completion:(void (^)(void))completion;
- (void)wyParentPresentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)animated completion:(void (^)(void))completion;
- (void)wyDismissViewControllerFromParentAnimated:(BOOL)animated completion: (void (^)(void))completion;
@end