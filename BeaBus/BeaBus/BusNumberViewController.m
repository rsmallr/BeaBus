//
//  BusNumberViewController.m
//  BeaBus
//
//  Created by Jason Wu on 2015/8/22.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

#import "BusNumberViewController.h"
#import <UIKit/UIKit.h>

@interface BusNumberViewController () <UISearchControllerDelegate>


@end

@implementation BusNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}

- (void)goToBusLineView
{
    [self performSegueWithIdentifier:@"goToBusLineView" sender:self];
}

- (IBAction)onClickDoneButton:(id)sender
{
    [self goToBusLineView];
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
