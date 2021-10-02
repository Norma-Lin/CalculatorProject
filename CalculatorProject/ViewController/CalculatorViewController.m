//
//  CalculatorViewController.m
//  CalculatorProject
//
//  Created by Richard on 2020/7/14.
//  Copyright © 2020 CalculatorProject. All rights reserved.
//

#import "CalculatorViewController.h"


typedef NS_ENUM(NSInteger, OperationType) {
    OperationTypePlus = 0,
    OperationTypeMinus = 1,
    OperationTypeMultiply = 2,
    OperationTypeDivision = 3,
    OperationTypeNone = 4
};

@interface CalculatorViewController ()

@property (weak, nonatomic) IBOutlet UITextField *calculationView;

//紀錄運算符號
@property (strong, nonatomic) NSString *calculationSymbol;
//記錄目前數字
@property (assign, nonatomic) double nowNumber;
//記錄上一個數字
@property (assign, nonatomic) double previousNunber;
//紀錄是否運算中
@property (assign, nonatomic) BOOL isCalculation;
//紀錄是否為新運算
@property (assign, nonatomic) BOOL isNew;
//記錄目前運算
@property (assign, nonatomic) OperationType operation;

@end

@implementation CalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.isNew = YES;
    self.operation = OperationTypeNone;
}

- (void)setCalculationSymbol:(NSString *)calculationSymbol {
    
    _calculationSymbol = calculationSymbol;
    NSLog(@"calculationSymbol = %@", _calculationSymbol);
}

- (void)setNowNumber:(double)nowNumber {
    
    _nowNumber = nowNumber;
    NSLog(@"nowNumber = %f", _nowNumber);
}

- (void)setPreviousNunber:(double)previousNunber {
    
    _previousNunber = previousNunber;
    NSLog(@"previousNunber = %f", _previousNunber);
}

- (IBAction)clearButton:(UIButton *)sender {
    
    self.calculationView.text = @"0";
    self.calculationSymbol = @"";
    self.nowNumber = 0;
    self.previousNunber = 0;
    self.isCalculation = NO;
    self.isNew = YES;
}

- (IBAction)plusMinusChangeButton:(UIButton *)sender {
}

- (IBAction)factorialButton:(UIButton *)sender {
}

- (IBAction)deleteButton:(UIButton *)sender {
    
    if ([self.calculationView.text isEqualToString:@""]) {
        return;
    }
    
    NSString *number = self.calculationView.text;
    NSLog(@"原始text = %@", number);
    
    if (number.length == 1) {
        
        self.calculationView.text = @"0";
        self.isCalculation = NO;
        self.isNew = YES;
        self.nowNumber = 0;
    }
    else if ([number containsString:@"e"]) {
        
        self.calculationView.text = @"0";
        self.isCalculation = NO;
        self.isNew = YES;
        self.nowNumber = 0;
    }
    else {
        
        NSString *deleteNumber = [number substringToIndex:[number length]-1];
        self.calculationView.text = deleteNumber;
        self.nowNumber = [deleteNumber doubleValue];
    }
    
}

- (IBAction)pointButton:(UIButton *)sender {
    
    NSString *number = self.calculationView.text;
    if ([number containsString:@"."] || [self.calculationView.text isEqualToString:@""]) {
        return;
    }
    self.calculationView.text = [NSString stringWithFormat:@"%@%@", number, @"."];
    self.isNew = NO;
}

- (IBAction)numberButton:(UIButton *)sender {
    
    NSInteger inputNumber = sender.tag;
    NSString *displayText = self.calculationView.text;
    
    if (self.isNew) {
        
        displayText = [NSString stringWithFormat:@"%zd", inputNumber];
        self.isNew = NO;
    }
    else {
        if ([self.calculationSymbol isEqualToString:@""]) {
            displayText = [NSString stringWithFormat:@"%@%zd", displayText, inputNumber];
        }
        else {
           
            displayText = [NSString stringWithFormat:@"%zd", inputNumber];
            self.calculationSymbol = @"";
        }
    }
    
    if (displayText.length > 13) {
        return;
    }
    self.calculationView.text = displayText;
    NSLog(@"displayText = %@", displayText);
    self.nowNumber = [displayText doubleValue];
}


@end
