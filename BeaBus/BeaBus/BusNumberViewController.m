//
//  BusNumberViewController.m
//  BeaBus
//
//  Created by Jason Wu on 2015/8/22.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

#import "BusNumberViewController.h"
#import <UIKit/UIKit.h>

@interface BusNumberKeyboardCell : UICollectionViewCell

@property (nonatomic) IBOutlet UILabel *label;

@end

@implementation BusNumberKeyboardCell

- (void)awakeFromNib
{
    self.layer.cornerRadius = 5;
}

@end

@interface BusNumberViewController () <UISearchControllerDelegate>

@property (nonatomic) NSArray *numberData;
@property (nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation BusNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initButtonData];
    // Do any additional setup after loading the view.
}

- (void)initButtonData
{
    self.numberData = @[@"紅",@"藍",@"1",@"2",@"3",
                        @"綠",@"棕",@"4",@"5",@"6",
                        @"菊",@"小",@"7",@"8",@"9",        // 不知道會不會有人發現 這裏是菊花的菊......
                        @"更多",@"F",@"重設",@"DEL",@"0"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}

- (void)goToBusLineView
{
    [self performSegueWithIdentifier:@"goToBusLineView" sender:self];
}

- (void)goBack
{
    [self showLauncherViewIn:0.8];
}

- (void)showLauncherViewIn:(CGFloat)second
{
    UIView *view = [[NSBundle mainBundle] loadNibNamed:@"LaunchScreen" owner:self options:nil][0];
    [self.view addSubview:view];
    [NSTimer scheduledTimerWithTimeInterval:second target:self selector:@selector(timeOut:) userInfo:view repeats:NO];
    
}

- (void)timeOut:(NSTimer *)timer
{
    UIView *view = timer.userInfo;
    [UIView animateWithDuration:0.2 animations:^{
        view.alpha = 0;
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
        view.alpha = 1;
    }];
}

- (IBAction)onClickDoneButton:(id)sender
{
    if (self.searchBar.text.length==3) {
        [self goToBusLineView];
    }
}

- (IBAction)onClickBackButton:(id)sender
{
    [self goBack];
}


-(BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *addText = self.numberData[indexPath.row];
    if ([addText isEqualToString:@"重設"]){
        self.searchBar.text = @"";
    }
    else if ([addText isEqualToString:@"DEL"]){
        if (self.searchBar.text.length!=0) {
            self.searchBar.text = [self.searchBar.text substringToIndex:[self.searchBar.text length]-1];
        }
    }
    else if (self.searchBar.text.length==0) {
        self.searchBar.text = [self.searchBar.text stringByAppendingString:@"6"];
    }
    else if (self.searchBar.text.length==1) {
        self.searchBar.text = [self.searchBar.text stringByAppendingString:@"4"];
    }
    else if (self.searchBar.text.length==2) {
        self.searchBar.text = [self.searchBar.text stringByAppendingString:@"3"];
    }
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}
#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.numberData.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BusNumberKeyboardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BusNumberKeyboardCell" forIndexPath:indexPath];
    cell.label.text = self.numberData[indexPath.row];
    return cell;
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
