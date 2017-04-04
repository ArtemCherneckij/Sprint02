//
//  ViewController.m
//  Sprint02
//
//  Created by Admin on 04.04.17.
//  Copyright (c) 2017 Admin. All rights reserved.
//

#import "ViewController.h"
#import "UITaTableViewCell.h"
#import "AppInfo.h"
#import "DetailViewController.h"

@interface ViewController ()
{
    NSURLSession *session;
    NSArray *tableData;
    NSMutableArray *array;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    array = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",nil];
    [self reloadDataFromNet];
}
-(void) reloadDataFromNet
{
    NSURL *url = [NSURL URLWithString:@"https://www.ralfebert.de/examples/fruits.json"];
    [[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if(error){
            NSLog(@"Not load data(error)");
        }else{
            NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSMutableArray *appArr = [NSMutableArray new];
            for (NSDictionary *dic in arr) {
                [appArr addObject:[[AppInfo alloc]initWithDictionary:dic]];
            }
            tableData = appArr;
            dispatch_sync(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
    }]resume];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    AppInfo *info = tableData[indexPath.row];
    cell.title.text = info.title;
    cell.subtitle.text = info.subtitle;
    return  cell;
}
- (IBAction)ReloadDataFromTable:(id)sender {
    [self reloadDataFromNet];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showdetail"]) {
        
        NSIndexPath *indexPath = nil;
        NSString *eventTitle=nil;
        
        indexPath =[self.tableView indexPathForSelectedRow];
        
        eventTitle =[array objectAtIndex:indexPath.row];
        
        [[segue destinationViewController] setEventName:eventTitle];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
