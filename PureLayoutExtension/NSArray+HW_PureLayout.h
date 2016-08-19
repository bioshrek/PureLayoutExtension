//
//  NSArray+YMTPureLayout.h
//  YMTControlDemo
//
//  Created by HuanWang on 6/10/15.
//  Copyright (c) 2015 HuanWang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <PureLayout/PureLayout.h>

@interface NSArray (HW_PureLayout)

/**
 *  -
 *  A
 *  |
 *  B
 *  |
 *  C
 *  -
 */

- (NSArray *)autoFillViewsWithFixedVerticalSpacing:(CGFloat)spacing;

/**
 *  |A-B-C|
 */

- (NSArray *)autoFillViewsWithFixedHorizentalSpacing:(CGFloat)spacing;

/**
 *  -
 *  |
 *  A
 *  |
 *  B
 *  |
 *  C
 *  |
 *  -
 */

- (NSArray *)autoFillViewsWithFixedVerticalSpacing:(CGFloat)spacing
                                      edgeInsetTop:(CGFloat)edgeTop
                                   edgeInsetBottom:(CGFloat)edgeBottom;

/**
 *  |-A-B-C-|
 */

- (NSArray *)autoFillViewsWithFixedHorizentalSpacing:(CGFloat)spacing
                                       edgeInsetLeft:(CGFloat)edgeLeft
                                      edgeInsetRight:(CGFloat)edgeRight;
/**
 *  same as @selector(autoFillViewsWithFixedVerticalSpacing:edgeInsetTop:edgeInsetBottom:),
 *  but you can specify different spacings.
 *
 */

- (NSArray *)autoFillViewsWithFixedVerticalSpacings:(NSArray *)spacingList
                                       edgeInsetTop:(CGFloat)edgeTop
                                    edgeInsetBottom:(CGFloat)edgeBottom;

/**
 *  same as @selector(autoFillViewsWithFixedHorizentalSpacing:edgeInsetLeft:edgeInsetRight:),
 *  but you can specify different spacings.
 */

- (NSArray *)autoFillViewsWithFixedHorizentalSpacings:(NSArray *)spacingList
                                        edgeInsetLeft:(CGFloat)edgeLeft
                                       edgeInsetRight:(CGFloat)edgeRight;

/**
 *   -------
 *  |       |
 *  |-A-B-C-|
 *  |       |
 *   -------
 */

- (NSArray *)autoFillViewsAlongAxis:(ALAxis)axis
                   withFixedSpacing:(CGFloat)spacing
                         edgeInsets:(UIEdgeInsets)insets;

/**
 *  same as @selector(autoFillViewsAlongAxis:withFixedSpacing:edgeInsets:),
 *  but you can specify different spacings.
 */

- (NSArray *)autoFillViewsAlongAxis:(ALAxis)axis
                  withFixedSpacings:(NSArray *)spacingList
                         edgeInsets:(UIEdgeInsets)insets;

@end
