//
//  ViewController.m
//  TipCalculator
//
//  Created by Jeffrey Okamoto on 1/9/17.
//  Copyright © 2017 Jeffrey Okamoto. All rights reserved.
//

#import "TippeViewController.h"

@interface TippeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@end

@implementation TippeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    [self.billTextField becomeFirstResponder];
    
    // Grab initial value from defaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.tipControl.selectedSegmentIndex = [defaults integerForKey:@"tipPercentDefault"];
    float savedBill = [defaults floatForKey:@"billAmount"];
    NSLog(@"viewDidLoad retrieved %f", savedBill);
    if (savedBill != 0.0) {
        self.billTextField.text = [NSString stringWithFormat:@"%f", [defaults floatForKey:@"billAmount"]];
    }

    [self updateValues];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapAction:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (IBAction)onValueChanged:(UISegmentedControl *)sender {
    [self updateValues];
}

- (void)updateValues {
    // Get bill amount
    float billAmount = [self.billTextField.text floatValue];
    
    // Compute tip and total
    NSArray *tipValues = @[ @(0.15), @(0.20), @(0.25)];
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;

    // Update UI
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
    
    // Store bill amount
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:[self.billTextField.text floatValue] forKey:@"billAmount"];
    [defaults synchronize];
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.tipControl.selectedSegmentIndex = [defaults integerForKey:@"tipPercentDefault"];
    
    float savedBill = [defaults floatForKey:@"billAmount"];
    NSLog(@"viewWillAppear retrieved %f", savedBill);
    if (savedBill != 0.0) {
        self.billTextField.text = [NSString stringWithFormat:@"%.2f", [defaults floatForKey:@"billAmount"]];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    float savedBill = [defaults floatForKey:@"billAmount"];
    NSLog(@"viewDidAppear retrieved %f", savedBill);
    if (savedBill != 0.0) {
        self.billTextField.text = [NSString stringWithFormat:@"%.2f", [defaults floatForKey:@"billAmount"]];
    }
}

- (IBAction)valueChanged:(id)sender {
    [self updateValues];
}



@end
