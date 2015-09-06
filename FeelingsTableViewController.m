//
//  FeelingsTableViewController.m
//  demo3
//
//  Created by 郑涵 on 15/8/28.
//  Copyright © 2015年 nick. All rights reserved.
//

#import "FeelingsTableViewController.h"
#import "Feeling.h"
#import "AddFeelingsViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "AppDelegate.h"


@interface FeelingsTableViewController ()

@property NSMutableArray *toDoItems;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *motionButton;
@property(nonatomic,strong)CLLocationManager *locationManager;

@end

@implementation FeelingsTableViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.motionButton) return;
    self.toDoItem = [[Motion alloc] init];
    self.toDoItem.speed = @"0";//just for test
}

#pragma mark-懒加载
//-(CLLocationManager *)locMgr
//{
//    if (_locationManager==nil) {
//    //1.创建位置管理器（定位用户的位置）
//    self.locationManager=[[CLLocationManager alloc]init];
//    //2.设置代理
//    self.locationManager.delegate=self;
//    }
//    return _locationManager;
//}
//
//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
//{
//       //locations数组里边存放的是CLLocation对象，一个CLLocation对象就代表着一个位置
//    AppDelegate *delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
//    CLLocation *loc = locations.lastObject;
//    double Speed = loc.speed;
//    NSString *SpeedString = [NSString stringWithFormat:@"%f", Speed];
//    NSDate* eventDate = loc.timestamp;
//    [delegate.MoveSpeed addObject:SpeedString];
//    NSLog(@"%f", Speed);
//   
//      //停止更新位置（如果定位服务不需要实时更新的话，那么应该停止位置的更新）
//     //    [self.locMgr stopUpdatingLocation];
//    
// }


#pragma mark - feelings:add-feeling

- (IBAction)unwindToFeelings:(UIStoryboardSegue *)segue{
    AddFeelingsViewController *source = [segue sourceViewController];
    Feeling *item = source.toDoItem;
    if (item != nil) {
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    }
}



- (void)loadInitialData {
    /*
    Feeling   *item1 = [[Feeling  alloc] init];
    item1.itemName = @"Buy milk";
    [self.toDoItems addObject:item1];
    Feeling *item2 = [[Feeling alloc] init];
    item2.itemName = @"Buy eggs";
    [self.toDoItems addObject:item2];
    Feeling *item3 = [[Feeling alloc] init];
    item3.itemName = @"Read a book";
    [self.toDoItems addObject:item3];
     */
    //Do something to init the view table
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoItems = [[NSMutableArray alloc] init];
  //  [self loadInitialData];
 //   NSLog(@"come here");
//    if ([CLLocationManager locationServicesEnabled]) {
//        [self.locMgr requestWhenInUseAuthorization];
//        //每隔多少米定位一次（这里的设置为任何的移动）
//        self.locMgr.distanceFilter=5;
//        //设置定位的精准度，一般精准度越高，越耗电（这里设置为精准度最高的，适用于导航应用）
//        self.locMgr.desiredAccuracy=kCLLocationAccuracyBestForNavigation;
//        [self.locMgr startUpdatingLocation];
//    } else {
//        NSLog(@"Location services are not enabled");
//    }

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
// return the number of rows
    return [self.toDoItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *CellIdentifier = @"ListPrototypeCell";
    // Configure the cell...
    UITableViewCell *cell = [tableView
    dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Feeling *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    return cell;
 
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
