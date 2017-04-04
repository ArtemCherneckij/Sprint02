//
//  DetailViewController.h
//  Sprint02
//
//  Created by Admin on 05.04.17.
//  Copyright (c) 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titledetail;
@property(nonatomic,strong) NSString *eventName;

@end
