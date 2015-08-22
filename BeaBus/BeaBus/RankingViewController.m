//
//  RankingViewController.m
//  BeaBus
//
//  Created by Jason Wu on 2015/8/22.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

#import "RankingViewController.h"

@interface RankingViewController ()

@property (nonatomic) IBOutlet UIView *likeImageView;

@end

@implementation RankingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onClickLike:(id)sender
{
    [self showLikeViewIn:0.8];
}

- (void)showLikeViewIn:(CGFloat)second
{
    self.likeImageView.center = self.view.center;
    self.likeImageView.alpha = 0;
    [self.view addSubview:self.likeImageView];
    [UIView animateWithDuration:0.2 animations:^{
        self.likeImageView.alpha = 1;
    } completion:^(BOOL finished) {
        self.likeImageView.alpha = 1;
        [NSTimer scheduledTimerWithTimeInterval:second target:self selector:@selector(timeOut:) userInfo:nil repeats:NO];
    }];
}

- (void)timeOut:(NSTimer *)timer
{
    [UIView animateWithDuration:0.2 animations:^{
        self.likeImageView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.likeImageView removeFromSuperview];
        self.likeImageView.alpha = 1;
    }];
}

-(BOOL)prefersStatusBarHidden{
    return YES;
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
