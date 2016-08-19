//
//  UIView+HW_PureLayout.m
//  PureLayoutExtension
//
//  Created by HuanWang on 6/10/15.
//  Copyright (c) 2015 HuanWang. All rights reserved.
//

#import "UIView+HW_PureLayout.h"

#import <objc/runtime.h>

// constants: property key
const char *kPropertyKeyDidSetupConstraints = "PropertyKeyDidSetupConstraints";

@implementation UIView (HW_PureLayout)

- (BOOL)didSetupConstraints
{
    return [objc_getAssociatedObject(self, &kPropertyKeyDidSetupConstraints)
            boolValue];
}

- (void)setDidSetupConstraints:(BOOL)value
{
    objc_setAssociatedObject(self,
                             &kPropertyKeyDidSetupConstraints,
                             [NSNumber numberWithBool:value],
                             OBJC_ASSOCIATION_ASSIGN);
}

@end
