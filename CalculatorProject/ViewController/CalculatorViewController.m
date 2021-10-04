//
//  CalculatorViewController.m
//  CalculatorProject
//
//  Created by Richard on 2020/7/14.
//  Copyright © 2020 CalculatorProject. All rights reserved.
//

#import "CalculatorViewController.h"

#pragma mark - 問題列表
#pragma mark 1. 可以打0001
#pragma mark -

typedef NS_ENUM(NSInteger, OperationType) {
    OperationTypePlus = 0,
    OperationTypeMinus = 1,
    OperationTypeMultiply = 2,
    OperationTypeDivision = 3,
    OperationTypeNone = 4
};

@interface CalculatorViewController ()

@property (weak, nonatomic) IBOutlet UITextField *calculationView;

//可輸入下一組數字
@property (assign, nonatomic) BOOL canEnterNextNumber;
//記錄目前數字
@property (assign, nonatomic) double nowNumber;
//記錄上一個數字
@property (assign, nonatomic) double previousNunber;
//紀錄是否運算中
@property (assign, nonatomic) BOOL isCalculation;
//是尚未輸入數字
@property (assign, nonatomic) BOOL isNeverInputNumber;
//記錄目前運算
@property (assign, nonatomic) OperationType operation;

@end

@implementation CalculatorViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // init
    self.isNeverInputNumber = YES;
    self.operation = OperationTypeNone;
    self.canEnterNextNumber = YES;
}

#pragma mark - Setter

- (void)setNowNumber:(double)nowNumber {
    
    _nowNumber = nowNumber;
    NSLog(@"nowNumber = %f", _nowNumber);
}

- (void)setPreviousNunber:(double)previousNunber {
    
    _previousNunber = previousNunber;
    NSLog(@"previousNunber = %f", _previousNunber);
}

#pragma mark - Button Action
#pragma mark AC清除
- (IBAction)clearButton:(UIButton *)sender {
    
    self.calculationView.text = @"";
    self.canEnterNextNumber = YES;
    self.operation = OperationTypeNone;
    self.nowNumber = 0;
    self.previousNunber = 0;
    self.isCalculation = NO;
    self.isNeverInputNumber = YES;
}

#pragma mark +/-轉換
- (IBAction)plusMinusChangeButton:(UIButton *)sender {
    
    NSString *numberStr = [NSString stringWithFormat:@"%g", self.nowNumber];
    if ([numberStr isEqualToString:@"0"]) {
        return;
    }
    
    self.nowNumber = 0 - self.nowNumber;
    if (self.isCalculation && self.canEnterNextNumber) {
        self.previousNunber = self.nowNumber;
    }
    self.calculationView.text = [NSString stringWithFormat:@"%g", self.nowNumber];
    
}

#pragma mark To do: 階乘button
#pragma mark 階乘計算
- (IBAction)factorialButton:(UIButton *)sender {
}

#pragma mark delete鍵
- (IBAction)deleteButton:(UIButton *)sender {
    
    if ([self.calculationView.text isEqualToString:@""]) {
        return;
    }
    
    NSString *number = self.calculationView.text;
    NSLog(@"原始text = %@", number);
    
    if (number.length == 1 && self.operation == OperationTypeNone) {
        
        self.calculationView.text = @"";
        self.isCalculation = NO;
        self.isNeverInputNumber = YES;
        self.nowNumber = 0;
        self.canEnterNextNumber = YES;
    }
    else if ([number containsString:@"e"]) {
        
        self.calculationView.text = @"";
        self.isCalculation = NO;
        self.isNeverInputNumber = YES;
        self.nowNumber = 0;
    }
    else {
        
        NSString *deleteNumber = [number substringToIndex:[number length]-1];
        self.calculationView.text = deleteNumber;
        self.nowNumber = [deleteNumber doubleValue];
    }
    
}

#pragma mark 小數點
- (IBAction)pointButton:(UIButton *)sender {
    
    NSString *number = self.calculationView.text;
    if ([number containsString:@"."] || [self.calculationView.text isEqualToString:@""]) {
        return;
    }
    self.calculationView.text = [NSString stringWithFormat:@"%@%@", number, @"."];
    self.isNeverInputNumber = NO;
}

#pragma mark 數字鍵
- (IBAction)numberButton:(UIButton *)sender {
    
    NSInteger inputNumber = sender.tag;
    NSString *displayText = self.calculationView.text;
    
    if (self.isNeverInputNumber) {
        
        displayText = [NSString stringWithFormat:@"%zd", inputNumber];
        self.isNeverInputNumber = NO;
        self.canEnterNextNumber = NO;
    }
    else {
        if (self.canEnterNextNumber) {
            
            displayText = [NSString stringWithFormat:@"%zd", inputNumber];
            self.canEnterNextNumber = NO;
        }
        else {
            displayText = [NSString stringWithFormat:@"%@%zd", displayText, inputNumber];
        }
    }
    
    if (displayText.length > 15) {
        return;
    }
    self.calculationView.text = displayText;
    NSLog(@"displayText = %@", displayText);
    self.nowNumber = [displayText doubleValue];
}

#pragma mark - 計算鍵
//除
- (IBAction)divisionButton:(UIButton *)sender {
    
    if (self.isNeverInputNumber) {
        return;
    }
    [self calculate];
    self.canEnterNextNumber = YES;
    self.previousNunber = self.nowNumber;
    self.isCalculation = YES;
    self.isNeverInputNumber = NO;
    self.operation = OperationTypeDivision;
    
}

//乘
- (IBAction)multiplyButton:(UIButton *)sender {
    
    if (self.isNeverInputNumber) {
        return;
    }
    [self calculate];
    self.canEnterNextNumber = YES;
    self.previousNunber = self.nowNumber;
    self.isCalculation = YES;
    self.isNeverInputNumber = NO;
    self.operation = OperationTypeMultiply;
}

//減
- (IBAction)minusButton:(UIButton *)sender {
    
    if (self.isNeverInputNumber) {
        return;
    }
    [self calculate];
    self.canEnterNextNumber = YES;
    self.previousNunber = self.nowNumber;
    self.isCalculation = YES;
    self.isNeverInputNumber = NO;
    self.operation = OperationTypeMinus;
}

//加
- (IBAction)plusButton:(UIButton *)sender {
    
    if (self.isNeverInputNumber) {
        return;
    }
    [self calculate];
    self.canEnterNextNumber = YES;
    self.previousNunber = self.nowNumber;
    self.isCalculation = YES;
    self.isNeverInputNumber = NO;
    self.operation = OperationTypePlus;
}

//等於
- (IBAction)equalButton:(UIButton *)sender {
    
    if (self.isNeverInputNumber) {
        return;
    }
    NSLog(@"a=%f b=%f operation=%@", self.previousNunber, self.nowNumber, [self getOperationName:self.operation]);
    if (self.isCalculation == YES) {
        
        [self calculate];
        self.isCalculation = NO;
        self.canEnterNextNumber = YES;
    }
    self.previousNunber = 0;
}

#pragma mark - Private Methods
//計算
- (void)calculate {
    
    NSLog(@"\n計算：");
    NSLog(@"previousNunber: %f", self.previousNunber);
    NSLog(@"nowNumber: %f", self.nowNumber);
    NSLog(@"operation: %@", [self getOperationName:self.operation]);
    
    double inCalculation = 0;
    NSInteger number = self.nowNumber;
    
    switch (self.operation) {
            
        case OperationTypeDivision:
            if (self.nowNumber != 0) {
                inCalculation = self.previousNunber / number;
                [self displayHandle:inCalculation];
                self.nowNumber = inCalculation;
            }
            else {
                self.calculationView.text = @"不可除以0";
            }
            break;
        
        case OperationTypeMultiply:
            inCalculation = self.previousNunber * number;
            [self displayHandle:inCalculation];
            self.nowNumber = inCalculation;
            break;
            
        case OperationTypeMinus:
            inCalculation = self.previousNunber - number;
            [self displayHandle:inCalculation];
            self.nowNumber = inCalculation;
            break;
            
        case OperationTypePlus:
            inCalculation = self.previousNunber + number;
            [self displayHandle:inCalculation];
            self.nowNumber = inCalculation;
            break;
            
        
            
        default:
            break;
    }
    NSLog(@"calculate nowNumber = %f", self.nowNumber);
}

// 顯示 Number 的處理
- (void)displayHandle:(double)number {
    
    NSString *numberStr = [NSString stringWithFormat:@"%g", number];
    //超過15位以科學記號顯示
    if (numberStr.length > 15) {
        numberStr = [self transformScientificNotation:number];
    }
    self.calculationView.text = numberStr;
}

- (NSString *)transformScientificNotation:(double)number {
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    formatter.numberStyle = NSNumberFormatterScientificStyle;
    formatter.positiveFormat = @"0.###E+0";
    formatter.positiveFormat = @"0.###E-0";
    formatter.exponentSymbol = @"e";
    NSString *scientificFormatted = [NSString stringWithFormat:@"%f", number];
    return scientificFormatted;
}

- (NSString *)getOperationName:(OperationType)operation {
    switch (operation) {
        case OperationTypeDivision:
            return @"÷";
        case OperationTypeMultiply:
            return @"x";
        case OperationTypeMinus:
            return @"-";
        case OperationTypePlus:
            return @"+";
        default:
            return @"";
    }
}

@end
