//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Jeffrey Okamoto on 1/10/17.
//  Copyright © 2017 Jeffrey Okamoto. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipSettings;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.tipSettings.selectedSegmentIndex = [defaults integerForKey:@"tipPercentDefault"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)saveSettings:(UIButton *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.tipSettings.selectedSegmentIndex forKey:@"tipPercentDefault"];
    [defaults synchronize];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
