//
//  BusLineViewController.m
//  BeaBus
//
//  Created by Jason Wu on 2015/8/22.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

#import "BusLineViewController.h"

@interface BusStopInfo : NSObject

@property (strong, nonatomic) NSString *busStopName;
@property (strong, nonatomic) NSString *driverName;
@property (strong, nonatomic) NSString *licenseNumber;
@property (strong, nonatomic) NSString *remainingTime;

@end

@implementation BusStopInfo

- (id)initWithBusStopName:(NSString *)busStopName driverName:(NSString *)driverName licenseNumber:(NSString *)licenseNumber remainingTime:(NSString *)remainingTime
{
    self = [self init];
    
    self.busStopName = busStopName;
    self.driverName = driverName;
    self.licenseNumber = licenseNumber;
    self.remainingTime = remainingTime;
    
    return self;
}

@end


@interface BusStopCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *remainingTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *busStopNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *licenseNumberButton;
@property (weak, nonatomic) IBOutlet UIButton *reserveBusButton;

@end

@implementation BusStopCell

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    self.licenseNumberButton.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:160.0f/255.0f blue:0.0f/255.0f alpha:1.0];
}

@end


@interface BusLineViewController ()

@property (strong, nonatomic) NSMutableArray *busStopInfos;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation BusLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.busStopInfos = [NSMutableArray new];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"調度站錦繡站" driverName:@"林家豪" licenseNumber:@"356-FM" remainingTime:@"3分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"調度站錦繡站" driverName:@"林家豪" licenseNumber:nil remainingTime:@"3分"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - Action

- (IBAction)nextButtonAction:(id)sender {
    [self performSegueWithIdentifier:@"goToRankingView" sender:self];
}

- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)reserveBusButtonAction:(id)sender {
    NSInteger index = ((UIButton *)sender).tag;
    BusStopCell *cell = (BusStopCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
    cell.selected = YES;
    cell.licenseNumberButton.selected = YES;
    cell.reserveBusButton.selected = YES;
}

#pragma mark - UICollectionView data source

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:      (NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BusStopCell *cell = (BusStopCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"BusStopCell" forIndexPath:indexPath];
    
    BusStopInfo *info = (indexPath.item%2) ? self.busStopInfos[0] : self.busStopInfos[1];
    cell.licenseNumberButton.hidden = cell.reserveBusButton.hidden = !(info.licenseNumber && info.licenseNumber.length > 0);
    cell.licenseNumberButton.layer.borderColor = [UIColor colorWithRed:255.0f/255.0f green:160.0f/255.0f blue:0.0f/255.0f alpha:1.0].CGColor;
    cell.reserveBusButton.tag = indexPath.item;
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BusStopInfo *info = (indexPath.item%2) ? self.busStopInfos[0] : self.busStopInfos[1];
    if (info.licenseNumber && info.licenseNumber.length > 0) {
        return CGSizeMake(320, 80);
    } else {
        return CGSizeMake(320, 40);
    }
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
