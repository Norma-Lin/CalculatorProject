//
//  CalculatorViewController.m
//  CalculatorProject
//
//  Created by Richard on 2020/7/14.
//  Copyright © 2020 CalculatorProject. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@property (weak, nonatomic) IBOutlet UITextField *m_tfDisplay;
@property (weak, nonatomic) IBOutlet UIButton *m_btnAC;

@end

@implementation CalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addBtnTarget];
}

- (void)addBtnTarget
{
    [self.m_btnAC addTarget:self
                     action:@selector(onClickAC:)
           forControlEvents:UIControlEventTouchUpInside];
}

- (void)onClickAC:(id)sender
{
    // Reset to Default
    // ...
    self.m_tfDisplay.text = @"";
}

@end
