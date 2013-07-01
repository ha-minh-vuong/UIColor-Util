//
//  UIColor+Util.h
//  ColorUtil
//
//  Created by Ha Minh Vuong on 7/1/13.
//  Copyright (c) 2013 Ha Minh Vuong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)

+ (UIColor *)randomColor;

- (UIColor *)lighterColorByPercent:(float)percent;

- (UIColor *)darkerColorByPercent:(float)percent;

- (UIColor *)lighterColorInAmount:(float)amount;

- (UIColor *)darkerColorInAmount:(float)amount;

@end
