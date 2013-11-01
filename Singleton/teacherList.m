//
//  teacherList.m
//  Singleton
//
//  Created by Petahwil on 10/22/13.
//  Copyright (c) 2013 Petahwil. All rights reserved.
//

#import "teacherList.h"
#import "globalVar.h"
#import "NSMutableArray.h"

@interface teacherList()
@end
static teacherList *_instance;
@implementation teacherList

@synthesize myString;
@synthesize someProperty;
@synthesize tree;

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
            NSString *myStringChange;
            NSArray *newString;
            NSURL *website;
        NSString *Height = [[[DataClass getInstance]dimentionArraySize]objectAtIndex:0];
        NSString *Width = [[[DataClass getInstance]dimentionArraySize]objectAtIndex:1];
        // 2-Dimensional Array
        tree = [NSMutableArray mutableNullArraysWithVisualFormat:[NSString stringWithFormat:@"[%@][%@]",Height, Width]];
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
        int j = 0;
        while (j<[[DataClass getInstance]findParsString].count) {
        if (![[[[DataClass getInstance]changeParam] objectAtIndex:j] isEqualToString:@""]) {
            myStringChange = [myString stringByReplacingOccurrencesOfString:[[[DataClass getInstance]changeParam] objectAtIndex:j] withString:@"\n"];
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
        if (![[[[DataClass getInstance]findParsString] objectAtIndex:j] isEqualToString:@""]&&![[[[DataClass getInstance]startPars] objectAtIndex:j] isEqualToString:@""]&&![[[[DataClass getInstance]endPars] objectAtIndex:j] isEqualToString:@""]) {

            
            int i = 0;
            int collum = 0;
            for (i = 0; i <[newString count]; i++) {
                curLine = [newString objectAtIndex:i];
                int row = -1;
                if ([curLine rangeOfString:[[[DataClass getInstance]findParsString] objectAtIndex:j]].location != NSNotFound) {
                    row++;
                    NSScanner *theScanner = [NSScanner scannerWithString:curLine];
                        NSString *str = [[[DataClass getInstance]startPars] objectAtIndex:j];
                        int long startLength = str.length;
                    
                                       [theScanner scanUpToString:[[[DataClass getInstance]startPars] objectAtIndex:j] intoString:NULL];
                        
                    [theScanner setScanLocation: [theScanner scanLocation]+startLength];
                    
                    [theScanner scanUpToString:[[[DataClass getInstance]endPars] objectAtIndex:j] intoString:&curLineNum];
                    tree [collum][row] = curLineNum;

                   NSLog(@"LOOP 1 = \n collum: %d \n row: %d",collum,row);
                    //Starts over if you want to find more on that line till break is input
                    int p = 1;
                    while(![[[[DataClass getInstance] startPars] objectAtIndex:p] isEqual: @"Break"]){
                        NSString *str = [[[DataClass getInstance]startPars] objectAtIndex:p];
                         row++;
                        int long startLength = str.length;
                        [theScanner scanUpToString:[[[DataClass getInstance]startPars] objectAtIndex:p] intoString:NULL];
                        
                        [theScanner setScanLocation: [theScanner scanLocation]+startLength];
                        
                        [theScanner scanUpToString:[[[DataClass getInstance]endPars] objectAtIndex:p] intoString:&curLineNum];
                       tree [collum][row] = curLineNum;
                        
                        p++;
                        NSLog(@"LOOP 2 = \n collum: %d \n row: %d ",collum,row);
                    }
                    row++;
                    collum++;
                }
            }
            //NSLog(@"Start: %d \n end: %d",i,keepTrack);
               //NSLog(@"Start: %@ \n end: %@",[[DataClass getInstance]startPars],[[DataClass getInstance]endPars]);
        }
            
        else{
            NSLog(@"Did Not Input Right Amount Of Param");
        }
       
j++;
    }
    }
    return self;
}

@end
