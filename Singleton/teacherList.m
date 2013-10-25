//
//  teacherList.m
//  Singleton
//
//  Created by Petahwil on 10/22/13.
//  Copyright (c) 2013 Petahwil. All rights reserved.
//

#import "teacherList.h"
#import "globalVar.h"

@interface teacherList()
@end
static teacherList *_instance;
@implementation teacherList

@synthesize myString;
@synthesize someProperty;
@synthesize teacherArray;
#pragma mark Singleton Methods

+ (teacherList *)sharedTeacherList {
    static teacherList *sharedTeacherList = nil;
    if (! sharedTeacherList) {
        sharedTeacherList = [[super allocWithZone:nil]init];
    }
    return sharedTeacherList;
}

+(id) allocWithZone:(struct _NSZone *)zone{
    return [self sharedTeacherList];
}

- (id)init {
    self = [super init];
    if (self) {
        NSString *str = [[DataClass getInstance]startPars];
        int startLength = str.length;
        NSString *myStringChange;
        NSArray *newString;
        NSURL *website;
        
        if (![[[DataClass getInstance]URL] isEqualToString:@""]) {
            website = [NSURL URLWithString:[[DataClass getInstance]URL]];
            
            NSURLRequest *request = [NSURLRequest requestWithURL:website];
            
            NSURLResponse* response = nil;
            
            NSError *error = nil;
            
            NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            
            //storing data in a string
            
            myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        }
        else{
            NSLog(@"Insert URL (http//:)");
        }
        
        if ([[[DataClass getInstance]printXML] isEqualToString:@"Print XML"]) {
            NSLog(@"%@",myString);
        }
        
        //Seperate String By Recurring Char
        if (![[[DataClass getInstance]changeParam] isEqualToString:@""]) {
            myStringChange = [myString stringByReplacingOccurrencesOfString:[[DataClass getInstance]changeParam] withString:@"\n"];
            newString = [myStringChange componentsSeparatedByString:@"\n"];
        }
        else{
             newString = [myString componentsSeparatedByString:@"\n"];
        }
        //putting it into an array to be
        
        //able to working wiht string or array
        teacherArray = [[NSMutableArray alloc]init];
        NSMutableString *curLineNum;
        NSString *curLine;
        if (![[[DataClass getInstance]findParsString] isEqualToString:@""]&&![[[DataClass getInstance]startPars] isEqualToString:@""]&&![[[DataClass getInstance]endPars] isEqualToString:@""]) {

            
            int i;
            
            for (i = 0; i <[newString count]; i++) {
                
                curLine = [newString objectAtIndex:i];
                
                if ([curLine rangeOfString:[[DataClass getInstance]findParsString]].location != NSNotFound) {
                    
                    NSScanner *theScanner = [NSScanner scannerWithString:curLine];
                    
                    [theScanner scanUpToString:[[DataClass getInstance]startPars] intoString:NULL];
                    
                    [theScanner setScanLocation: [theScanner scanLocation]+startLength];
                    
                    [theScanner scanUpToString:[[DataClass getInstance]endPars] intoString:&curLineNum];
                    
                    [teacherArray addObject:curLineNum];
                    
                    
                }
                
            }
        }
        else{
            NSLog(@"Did Not Input Right Amount Of Param");
        }
       
        
    }
    return self;
}

@end
