//
//  FunctionButton.m
//  CalculatorProject
//
//  Created by DaiDai on 2021/10/3.
//  Copyright © 2021 CalculatorProject. All rights reserved.
//

#import "FunctionButton.h"
#import "ColorConfig.h"

@implementation FunctionButton

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    self.backgroundColor = highlighted ? [ColorConfig functionButtonHighlightedColor] : [ColorConfig functionButtonNormalColor];
}

@end
