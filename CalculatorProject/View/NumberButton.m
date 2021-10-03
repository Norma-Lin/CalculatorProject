//
//  NumberButton.m
//  CalculatorProject
//
//  Created by DaiDai on 2021/10/3.
//  Copyright © 2021 CalculatorProject. All rights reserved.
//

#import "NumberButton.h"
#import "ColorConfig.h"

@implementation NumberButton

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    self.backgroundColor = highlighted ? [ColorConfig numberButtonHighlightedColor] : [ColorConfig numberButtonNormalColor];
}

@end
