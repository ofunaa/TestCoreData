//
//  ViewController.m
//  TestCoreData
//
//  Created by takuji funao on 2015/10/22.
//  Copyright (c) 2015年 takuji funao. All rights reserved.
//

#import "ViewController.h"
#import "CoreData+MagicalRecord.h"
#import "User.h"

@interface ViewController(){
    NSArray* categories;
    int category_id;
    int save_or_delete;
}

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UITextField *id_text;
@property (weak, nonatomic) IBOutlet UITextField *name_text;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _id_text.delegate = self;
    
    _name_text.delegate = self;
    
    category_id = 0;
    
    save_or_delete = 1;
    
    _pickerView.delegate = self;
    
    _pickerView.dataSource = self;
    
    _pickerView.showsSelectionIndicator = YES;
    
    categories = [NSArray arrayWithObjects:@"サッカー",@"野球",@"バドミントン",@"水泳",@"ゴルフ",@"なにもしてないよ", nil];
    
    [self.view addSubview:_pickerView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    return 5;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [NSString stringWithFormat:@"%@", categories[row]];
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    category_id = [pickerView selectedRowInComponent:0];
    
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)segmentAction:(id)sender {
    
    switch (_segment.selectedSegmentIndex) {
            
        case 0:
            
            save_or_delete = 1;
            break;
            
        case 1:
            
            save_or_delete = 2;
            break;
            
        default:
            break;
            
    }
    
}

- (IBAction)go_btn:(id)sender {
    
    NSDate *now = [NSDate date];
    
    NSString *string_id = self.id_text.text;
    
    int int_id = [string_id intValue];
    
    NSNumber *number_id = [[NSNumber alloc] initWithInt:int_id];
    
    User *user = [User MR_findFirstByAttribute:@"id"
                                            withValue:number_id];
    
    if(save_or_delete == 1){
        
        if(user){
            
            user.name = self.name_text.text;
            user.category = categories[category_id];
            user.time = now;
        
        }else{
         
            User *new_user = [User MR_createEntity];
            
            new_user.id = number_id;
            new_user.name = self.name_text.text;
            new_user.category = categories[category_id];
            new_user.time = now;
            
        }
        
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        
    }else{
        
        User *delete_user = [User MR_findFirstByAttribute:@"id"
                                               withValue:number_id];
        
        [delete_user MR_deleteEntity];
        
    }
    
    
}


@end
