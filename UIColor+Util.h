//
//  UIColor+Util.h
//  ColorUtil
//
//  Created by Ha Minh Vuong on 7/1/13.
//  Copyright (c) 2013 Ha Minh Vuong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)

///
/// Create a random color.
///
/// @return A random color.
///
+ (UIColor *)randomColor;

///
/// Create a color from hex code.
///
/// @param hexString A hex string. Eg. @"1A2B4F".
/// @return A color created from hex string.
///
+ (UIColor *)colorFromHex:(NSString *)hexString;

///
/// Create a lighter color by increase its brightness by number of percentage.
///
/// @param percent A percentage to increase.
/// @return A lighter color from the orginal color.
///
- (UIColor *)lighterColorByPercent:(float)percent;

///
/// Create a darker color by decrease its brightness by number of percentage.
///
/// @param percent A percentage to decrease.
/// @return A darker color from the original color.
///
- (UIColor *)darkerColorByPercent:(float)percent;

///
/// Create a lighter color by increase in the amount of its brightness.
///
/// @param amount An amount to increase.
/// @return A lighter color from the original color.
///
- (UIColor *)lighterColorInAmount:(float)amount;

///
/// Create a darker color by decrease in the amount of its brightness.
///
/// @param amount An amount to decrease.
/// @return A darker color from the originanl color.
///
- (UIColor *)darkerColorInAmount:(float)amount;

@end
