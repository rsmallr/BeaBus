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

@end

@implementation BusStopCell

@end


@interface BusLineViewController ()

@property (strong, nonatomic) NSMutableArray *busStopInfos;

@end

@implementation BusLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.busStopInfos = [NSMutableArray new];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"調度站錦繡站" driverName:@"林家豪" licenseNumber:@"356-FM" remainingTime:@"3分"]];
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
