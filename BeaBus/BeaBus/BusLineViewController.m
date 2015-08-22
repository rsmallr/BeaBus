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
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"調度站錦繡站" driverName:@"林家豪" licenseNumber:@"356-FW" remainingTime:@"進站中"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"錦繡站" driverName:nil licenseNumber:nil remainingTime:@"將到站"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"美墅家" driverName:nil licenseNumber:nil remainingTime:@"7分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"錦繡(一)" driverName:nil licenseNumber:nil remainingTime:@"8分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"碧瑤" driverName:nil licenseNumber:nil remainingTime:@"8分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"日興圖書館" driverName:nil licenseNumber:nil remainingTime:@"9分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"三城" driverName:nil licenseNumber:nil remainingTime:@"9分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"建業路" driverName:nil licenseNumber:nil remainingTime:@"9分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"二城" driverName:nil licenseNumber:nil remainingTime:@"10分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"中央印製廠" driverName:nil licenseNumber:nil remainingTime:@"10分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"中央新城" driverName:nil licenseNumber:nil remainingTime:@"11分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"頭城" driverName:nil licenseNumber:nil remainingTime:@"11分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"頭城(一)" driverName:nil licenseNumber:nil remainingTime:@"11分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"大茅埔" driverName:nil licenseNumber:nil remainingTime:@"12分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"康樂新村" driverName:nil licenseNumber:nil remainingTime:@"13分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"安康路二段" driverName:nil licenseNumber:nil remainingTime:@"13分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"薏仁坑" driverName:nil licenseNumber:nil remainingTime:@"14分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"車子路" driverName:nil licenseNumber:nil remainingTime:@"14分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"台北菸廠" driverName:nil licenseNumber:nil remainingTime:@"16分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"浪漫貴族" driverName:@"吳江鳥" licenseNumber:@"225-FU" remainingTime:@"進站中"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"公崙新村" driverName:nil licenseNumber:nil remainingTime:@"將到站"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"安康派出所" driverName:nil licenseNumber:nil remainingTime:@"將到站"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"光華新村" driverName:nil licenseNumber:nil remainingTime:@"將到站"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"下城社區" driverName:nil licenseNumber:nil remainingTime:@"4分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"下城里" driverName:nil licenseNumber:nil remainingTime:@"4分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"頂城" driverName:nil licenseNumber:nil remainingTime:@"5分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"大坪頂" driverName:nil licenseNumber:nil remainingTime:@"5分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"溪頭" driverName:nil licenseNumber:nil remainingTime:@"6分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"碧潭橋頭" driverName:nil licenseNumber:nil remainingTime:@"8分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"檳榔路" driverName:nil licenseNumber:nil remainingTime:@"9分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"捷運新店區公所站" driverName:nil licenseNumber:nil remainingTime:@"10分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"七張" driverName:nil licenseNumber:nil remainingTime:@"11分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"捷運七張站" driverName:nil licenseNumber:nil remainingTime:@"14分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"新店郵局" driverName:nil licenseNumber:nil remainingTime:@"15分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"大坪林" driverName:nil licenseNumber:nil remainingTime:@"16分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"捷運大坪林站" driverName:nil licenseNumber:nil remainingTime:@"17分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"滬江中學" driverName:nil licenseNumber:nil remainingTime:@"19分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"捷運景美站" driverName:nil licenseNumber:nil remainingTime:@"20分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"三福街口" driverName:nil licenseNumber:nil remainingTime:@"22分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"萬隆" driverName:nil licenseNumber:nil remainingTime:@"22分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"捷運萬隆站" driverName:nil licenseNumber:nil remainingTime:@"22分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"武功國小(羅斯福)" driverName:nil licenseNumber:nil remainingTime:@"24分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"師大分部" driverName:nil licenseNumber:nil remainingTime:@"26分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"捷運公館站" driverName:nil licenseNumber:nil remainingTime:@"27分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"臺大" driverName:nil licenseNumber:nil remainingTime:@"31分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"臺大綜合體育館" driverName:nil licenseNumber:nil remainingTime:@"32分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"龍安國小(公務人力發展中心)" driverName:nil licenseNumber:nil remainingTime:@"34分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"金華新生路口" driverName:nil licenseNumber:nil remainingTime:@"35分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"信義新生路口" driverName:@"吳大德" licenseNumber:@"357-FW" remainingTime:@"37分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"仁愛新生路口" driverName:nil licenseNumber:nil remainingTime:@"將到站"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"捷運忠孝新生站" driverName:nil licenseNumber:nil remainingTime:@"將到站"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"光華商場" driverName:nil licenseNumber:nil remainingTime:@"3分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"長安松江路口" driverName:@"葉佩雯" licenseNumber:@"672-FU" remainingTime:@"5分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"捷運松江南京站" driverName:nil licenseNumber:nil remainingTime:@"將到站"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"長春松江路口" driverName:nil licenseNumber:nil remainingTime:@"將到站"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"捷運行天宮站" driverName:nil licenseNumber:nil remainingTime:@"4分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"行天宮" driverName:nil licenseNumber:nil remainingTime:@"6分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"新生公園(林安泰)" driverName:nil licenseNumber:nil remainingTime:@"7分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"臺北魚市" driverName:nil licenseNumber:nil remainingTime:@"9分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"第二果菜市場" driverName:nil licenseNumber:nil remainingTime:@"11分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"下埤里" driverName:nil licenseNumber:nil remainingTime:@"12分"]];
    [self.busStopInfos addObject:[[BusStopInfo alloc] initWithBusStopName:@"復興北村" driverName:@"李大仁" licenseNumber:@"675-FU" remainingTime:@"進站中"]];
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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.busStopInfos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BusStopCell *cell = (BusStopCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"BusStopCell" forIndexPath:indexPath];
    
    BusStopInfo *info = self.busStopInfos[indexPath.row];
    cell.licenseNumberButton.hidden  = cell.reserveBusButton.hidden = !(info.licenseNumber && info.licenseNumber.length > 0);
    cell.licenseNumberButton.layer.borderColor = [UIColor colorWithRed:255.0f/255.0f green:160.0f/255.0f blue:0.0f/255.0f alpha:1.0].CGColor;
    [cell.licenseNumberButton setTitle:info.licenseNumber forState:UIControlStateNormal];
    cell.busStopNameLabel.text = info.busStopName;
    cell.remainingTimeLabel.text = info.remainingTime;
    cell.reserveBusButton.tag = indexPath.item;
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BusStopInfo *info = self.busStopInfos[indexPath.row];
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
