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

+ (UIColor *)colorFromHex:(NSString *)hexString
{
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float r = ((baseValue >> 24) & 0xFF)/255.0f;
    float g = ((baseValue >> 16) & 0xFF)/255.0f;
    float b = ((baseValue >> 8) & 0xFF)/255.0f;
    float a = ((baseValue >> 0) & 0xFF)/255.0f;
    
    UIColor *color = [UIColor colorWithRed:r green:g blue:b alpha:a];
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
