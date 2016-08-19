//
//  UIView+HW_PureLayout.h
//  PureLayoutExtension
//
//  Created by HuanWang on 6/10/15.
//  Copyright (c) 2015 HuanWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HW_PureLayout)

/**
 *  标记约束已经添加，避免重复添加约束
 */

@property (nonatomic, assign) BOOL didSetupConstraints;

@end
