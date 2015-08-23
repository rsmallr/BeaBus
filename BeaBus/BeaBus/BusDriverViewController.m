//
//  BusDriverViewController.m
//  BeaBus
//
//  Created by 福氣啦 \囧/ on 2015/8/23.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

#import "BusDriverViewController.h"

@interface BusDriverViewController ()

@property (weak, nonatomic) IBOutlet UIButton *waitingPeopleButton;
@property (nonatomic) NSInteger waitingPeople;

@end

@implementation BusDriverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self updateWaitingStatus];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (IBAction)bakcButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)refreshButtonAction:(id)sender {
    self.waitingPeople += 1;
    
    [self updateWaitingStatus];
}

- (void)updateWaitingStatus
{
    if (self.waitingPeople > 0) {
        self.waitingPeopleButton.backgroundColor = [UIColor colorWithRed:255.0f/255.f green:102.0f/255.f blue:102.0f/255.f alpha:1.0f];
    } else {
        self.waitingPeopleButton.backgroundColor = [UIColor colorWithRed:51.0f/255.f green:153.0f/255.f blue:51.0f/255.f alpha:1.0f];
    }
    
    [self.waitingPeopleButton setTitle:[NSString stringWithFormat:@"候車人數：%ld", (long)self.waitingPeople] forState:UIControlStateNormal];
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
