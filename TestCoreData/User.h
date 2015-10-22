//
//  User.h
//  TestCoreData
//
//  Created by takuji funao on 2015/10/22.
//  Copyright (c) 2015年 takuji funao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * time;

@end
