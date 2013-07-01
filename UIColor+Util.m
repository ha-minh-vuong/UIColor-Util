//
//  UIColor+Util.m
//  ColorUtil
//
//  Created by Ha Minh Vuong on 7/1/13.
//  Copyright (c) 2013 Ha Minh Vuong. All rights reserved.
//

#import "UIColor+Util.h"

@implementation UIColor (Util)

+ (UIColor *)randomColor
{
    double rr = arc4random() / ((double) (((long long)2<<31) -1));
    double rg = arc4random() / ((double) (((long long)2<<31) -1));
    double rb = arc4random() / ((double) (((long long)2<<31) -1));
    UIColor *color = [UIColor colorWithRed:rr green:rg blue:rb alpha:1.0];
    return color;
}

- (UIColor *)lighterColorByPercent:(float)percent
{
    float h, s, b, a;
    if (![self getHue:&h saturation:&s brightness:&b alpha:&a]) return nil;
    UIColor *color = [UIColor colorWithHue:h saturation:s brightness:b*(1+percent) alpha:a];
    return color;
}

- (UIColor *)darkerColorByPercent:(float)percent
{
    float h, s, b, a;
    if (![self getHue:&h saturation:&s brightness:&b alpha:&a]) return nil;
    UIColor *color = [UIColor colorWithHue:h saturation:s brightness:b*(1-percent) alpha:a];
    return color;
}

- (UIColor *)lighterColorInAmount:(float)amount
{
    float h, s, b, a;
    if (![self getHue:&h saturation:&s brightness:&b alpha:&a]) return nil;
    UIColor *color = [UIColor colorWithHue:h saturation:s brightness:b+amount alpha:a];
    return color;
}

- (UIColor *)darkerColorInAmount:(float)amount
{
    float h, s, b, a;
    if (![self getHue:&h saturation:&s brightness:&b alpha:&a]) return nil;
    UIColor *color = [UIColor colorWithHue:h saturation:s brightness:b-amount alpha:a];
    return color;
}

@end
