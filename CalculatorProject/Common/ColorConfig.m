//
//  ColorConfig.m
//  CalculatorProject
//
//  Created by DaiDai on 2021/10/3.
//  Copyright © 2021 CalculatorProject. All rights reserved.
//

#import "ColorConfig.h"

@implementation ColorConfig

+ (UIColor *)functionButtonNormalColor {
    return [UIColor colorWithRed:211.0f/255.0f green:227.0f/255.0f blue:255.0f/255.0f alpha:1];
}

+ (UIColor *)functionButtonHighlightedColor {
    return [UIColor colorWithRed:181.0f/255.0f green:197.0f/255.0f blue:222.0f/255.0f alpha:1];
}

+ (UIColor *)numberButtonNormalColor {
    return [UIColor colorWithRed:236.0f/255.0f green:250.0f/255.0f blue:255.0f/255.0f alpha:1];
}

+ (UIColor *)numberButtonHighlightedColor {
    return [UIColor colorWithRed:198.0f/255.0f green:211.0f/255.0f blue:215.0f/255.0f alpha:1];
}

@end
