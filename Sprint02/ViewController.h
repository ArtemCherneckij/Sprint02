//
//  ViewController.h
//  Sprint02
//
//  Created by Admin on 04.04.17.
//  Copyright (c) 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) NSArray *name;
@property (nonatomic,strong) UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *ReoadTableData;

@end

