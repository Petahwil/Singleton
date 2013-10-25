//
//  teacherList.h
//  Singleton
//
//  Created by Petahwil on 10/22/13.
//  Copyright (c) 2013 Petahwil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface teacherList : NSObject {
    NSString *someProperty;
    NSMutableArray *teacherArray;
    NSString *myString;
}

@property (nonatomic, retain) NSString *someProperty;
@property (nonatomic, retain) NSMutableArray *teacherArray;
@property (nonatomic, retain) NSString *myString;

+ (teacherList *)sharedTeacherList;
@end

