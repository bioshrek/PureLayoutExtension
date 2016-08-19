//
//  NSArray+YMTPureLayout.m
//  YMTControlDemo
//
//  Created by HuanWang on 6/10/15.
//  Copyright (c) 2015 HuanWang. All rights reserved.
//

#import "NSArray+HW_PureLayout.h"

@implementation NSArray (HW_PureLayout)

- (NSArray *)autoFillViewsWithFixedVerticalSpacing:(CGFloat)spacing
{
    return [self autoFillViewsWithFixedVerticalSpacing:spacing edgeInsetTop:0.0f edgeInsetBottom:0.0f];
}

- (NSArray *)autoFillViewsWithFixedHorizentalSpacing:(CGFloat)spacing
{
    return [self autoFillViewsWithFixedHorizentalSpacing:spacing edgeInsetLeft:0.0f edgeInsetRight:0.0f];
}

- (NSArray *)autoFillViewsWithFixedVerticalSpacing:(CGFloat)spacing
                                      edgeInsetTop:(CGFloat)edgeTop
                                   edgeInsetBottom:(CGFloat)edgeBottom
{
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    NSLayoutConstraint *constraint = nil;
    
    if (0 == [self count]) return constraints;
    
    // vertical
    constraint = [[self firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:edgeTop];
    [constraints addObject:constraint];
    constraint = [[self lastObject] autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:edgeBottom];
    [constraints addObject:constraint];
    NSUInteger count = [self count];
    if (count >= 2) {
        for (NSUInteger i = 1; i < count; i++) {
            UIView *topView = self[i - 1];
            UIView *view = self[i];
            constraint = [view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:topView withOffset:spacing];
            [constraints addObject:constraint];
        }
    }
    
    return constraints;
}

- (NSArray *)autoFillViewsWithFixedVerticalSpacings:(NSArray *)spacingList
                                       edgeInsetTop:(CGFloat)edgeTop
                                    edgeInsetBottom:(CGFloat)edgeBottom
{
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    NSLayoutConstraint *constraint = nil;
    
    if (0 == [self count]) return constraints;
    
    // vertical
    constraint = [[self firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:edgeTop];
    [constraints addObject:constraint];
    constraint = [[self lastObject] autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:edgeBottom];
    [constraints addObject:constraint];
    NSUInteger count = [self count];
    NSParameterAssert([spacingList count] >= count - 1);
    if (count >= 2) {
        for (NSUInteger i = 1, j = 0; i < count && j < [spacingList count]; i++, j++) {
            UIView *topView = self[i - 1];
            UIView *view = self[i];
            CGFloat spacing = [[spacingList objectAtIndex:j] floatValue];
            constraint = [view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:topView withOffset:spacing];
            [constraints addObject:constraint];
        }
    }
    
    return constraints;
}

- (NSArray *)autoFillViewsWithFixedHorizentalSpacing:(CGFloat)spacing
                                       edgeInsetLeft:(CGFloat)edgeLeft
                                      edgeInsetRight:(CGFloat)edgeRight
{
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    NSLayoutConstraint *constraint = nil;
    
    if (0 == [self count]) return constraints;
    
    // horizontal
    constraint = [[self firstObject] autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:edgeLeft];
    [constraints addObject:constraint];
    constraint = [[self lastObject] autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:edgeRight];
    [constraints addObject:constraint];
    NSUInteger count = [self count];
    if (count >= 2) {
        for (NSUInteger i = 1; i < count; i++) {
            UIView *leftView = self[i - 1];
            UIView *view = self[i];
            constraint = [view autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:leftView withOffset:spacing];
            [constraints addObject:constraint];
        }
    }
    
    return constraints;
}

- (NSArray *)autoFillViewsWithFixedHorizentalSpacings:(NSArray *)spacingList
                                      edgeInsetLeft:(CGFloat)edgeLeft
                                     edgeInsetRight:(CGFloat)edgeRight
{
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    NSLayoutConstraint *constraint = nil;
    
    if (0 == [self count]) return constraints;
    
    // horizontal
    constraint = [[self firstObject] autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:edgeLeft];
    [constraints addObject:constraint];
    constraint = [[self lastObject] autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:edgeRight];
    [constraints addObject:constraint];
    NSUInteger count = [self count];
    NSParameterAssert([spacingList count] >= count - 1);
    if (count >= 2) {
        for (NSUInteger i = 1, j = 0; i < count && j < [spacingList count]; i++, j++) {
            UIView *leftView = self[i - 1];
            UIView *view = self[i];
            CGFloat spacing = [[spacingList objectAtIndex:j] floatValue];
            constraint = [view autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:leftView withOffset:spacing];
            [constraints addObject:constraint];
        }
    }
    
    return constraints;
}

- (NSArray *)autoFillViewsAlongAxis:(ALAxis)axis
                   withFixedSpacing:(CGFloat)spacing
                         edgeInsets:(UIEdgeInsets)insets
{
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    NSLayoutConstraint *constraint = nil;
    
    if (0 == [self count]) return constraints;
    
    ALEdge edge1 = ALEdgeLeading;
    ALEdge edge2 = ALEdgeTrailing;
    ALEdge edge3 = ALEdgeTop;
    ALEdge edge4 = ALEdgeBottom;
    CGFloat edge1Inset = insets.left;
    CGFloat edge2Inset = insets.right;
    CGFloat edge3Inset = insets.top;
    CGFloat edge4Inset = insets.bottom;
    
    if (ALAxisHorizontal == axis) {
        edge1 = ALEdgeTop;
        edge2 = ALEdgeBottom;
        edge3 = ALEdgeLeading;
        edge4 = ALEdgeTrailing;
        
        edge1Inset = insets.top;
        edge2Inset = insets.bottom;
        edge3Inset = insets.left;
        edge4Inset = insets.right;
    } else if (ALAxisVertical == axis) {
        edge1 = ALEdgeLeading;
        edge2 = ALEdgeTrailing;
        edge3 = ALEdgeTop;
        edge4 = ALEdgeBottom;
        
        edge1Inset = insets.left;
        edge2Inset = insets.right;
        edge3Inset = insets.top;
        edge4Inset = insets.bottom;
    }
    
    // vertical or horizontal
    for (UIView *view in self) {
        constraint = [view autoPinEdgeToSuperviewEdge:edge1 withInset:edge1Inset];
        [constraints addObject:constraint];
        constraint = [view autoPinEdgeToSuperviewEdge:edge2 withInset:edge2Inset];
        [constraints addObject:constraint];
    }
    
    // horizontal or vertical
    constraint = [[self firstObject] autoPinEdgeToSuperviewEdge:edge3 withInset:edge3Inset];
    [constraints addObject:constraint];
    constraint = [[self lastObject] autoPinEdgeToSuperviewEdge:edge4 withInset:edge4Inset];
    [constraints addObject:constraint];
    NSUInteger count = [self count];
    if (count >= 2) {
        for (NSUInteger i = 1; i < count; i++) {
            UIView *previousView = self[i - 1];
            UIView *view = self[i];
            constraint = [view autoPinEdge:edge3 toEdge:edge4 ofView:previousView withOffset:spacing];
            [constraints addObject:constraint];
        }
    }
    
    return constraints;
}

- (NSArray *)autoFillViewsAlongAxis:(ALAxis)axis
                  withFixedSpacings:(NSArray *)spacingList
                         edgeInsets:(UIEdgeInsets)insets
{
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    NSLayoutConstraint *constraint = nil;
    
    if (0 == [self count]) return constraints;
    
    ALEdge edge1 = ALEdgeLeading;
    ALEdge edge2 = ALEdgeTrailing;
    ALEdge edge3 = ALEdgeTop;
    ALEdge edge4 = ALEdgeBottom;
    CGFloat edge1Inset = insets.left;
    CGFloat edge2Inset = insets.right;
    CGFloat edge3Inset = insets.top;
    CGFloat edge4Inset = insets.bottom;
    
    if (ALAxisHorizontal == axis) {
        edge1 = ALEdgeTop;
        edge2 = ALEdgeBottom;
        edge3 = ALEdgeLeading;
        edge4 = ALEdgeTrailing;
        
        edge1Inset = insets.top;
        edge2Inset = insets.bottom;
        edge3Inset = insets.left;
        edge4Inset = insets.right;
    } else if (ALAxisVertical == axis) {
        edge1 = ALEdgeLeading;
        edge2 = ALEdgeTrailing;
        edge3 = ALEdgeTop;
        edge4 = ALEdgeBottom;
        
        edge1Inset = insets.left;
        edge2Inset = insets.right;
        edge3Inset = insets.top;
        edge4Inset = insets.bottom;
    }
    
    // vertical or horizontal
    for (UIView *view in self) {
        constraint = [view autoPinEdgeToSuperviewEdge:edge1 withInset:edge1Inset];
        [constraints addObject:constraint];
        constraint = [view autoPinEdgeToSuperviewEdge:edge2 withInset:edge2Inset];
        [constraints addObject:constraint];
    }
    
    // horizontal or vertical
    constraint = [[self firstObject] autoPinEdgeToSuperviewEdge:edge3 withInset:edge3Inset];
    [constraints addObject:constraint];
    constraint = [[self lastObject] autoPinEdgeToSuperviewEdge:edge4 withInset:edge4Inset];
    [constraints addObject:constraint];
    NSUInteger count = [self count];
    NSParameterAssert([spacingList count] >= count - 1);
    if (count >= 2) {
        for (NSUInteger i = 1, j = 0; i < count && j < [spacingList count]; i++, j++) {
            UIView *previousView = self[i - 1];
            UIView *view = self[i];
            CGFloat spacing = [[spacingList objectAtIndex:j] floatValue];
            constraint = [view autoPinEdge:edge3 toEdge:edge4 ofView:previousView withOffset:spacing];
            [constraints addObject:constraint];
        }
    }
    
    return constraints;
}


@end
