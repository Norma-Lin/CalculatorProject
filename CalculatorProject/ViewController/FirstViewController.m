//
//  FirstViewController.m
//  CalculatorProject
//
//  Created by Richard on 2020/7/14.
//  Copyright © 2020 CalculatorProject. All rights reserved.
//

#import "FirstViewController.h"
#import "CalculatorViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (IBAction)goCalculatorButtonIsClicked:(UIButton *)sender {
    
    NSLog(@"goCalculatorButtonIsClicked");
    UIViewController *vc = [[CalculatorViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}



@end
