//
//  ShowViewController.m
//  TestCoreData
//
//  Created by takuji funao on 2015/10/22.
//  Copyright (c) 2015年 takuji funao. All rights reserved.
//

#import "ShowViewController.h"
#import "CoreData+MagicalRecord.h"
#import "User.h"

@interface ShowViewController ()

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *users = [User MR_findAllSortedBy:@"name"
                                     ascending:YES];
    
    int count_user = [users count];
    
    for (int i = 0; i < count_user; i++) {
    
        NSLog(@"id:%@",[users[i] id]);
        
        NSLog(@"name:%@",[users[i] name]);
        
        NSLog(@"category:%@",[users[i] category]);
        
        NSLog(@"time:%@",[users[i] time]);
        
    }
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)back_btn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
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
