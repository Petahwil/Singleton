//
//  ViewController.m
//  Singleton
//
//  Created by Petahwil on 10/22/13.
//  Copyright (c) 2013 Petahwil. All rights reserved.
//

#import "ViewController.h"
#import "teacherList.h"
#import "globalVar.h"

@interface ViewController ()

@end

@implementation ViewController
NSString *hey;
NSMutableArray *theTeacherList;
NSMutableArray *theTeacherList2;
- (void)viewDidLoad
{
    DataClass *obj=[DataClass getInstance];
    obj.URL= @"http://search.azlyrics.com/search.php?q=Hey+There+d&p=%1&w=songs";
    obj.printXML = @"";
    obj.changeParam = @"";
    obj.findParsString = @"<a href=\"";
    obj.startPars = @"<a href=\"";
    obj.endPars = @"\">";

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    theTeacherList = [[teacherList sharedTeacherList]teacherArray];

    int i;
    
    for (i = 0; i <[theTeacherList count]; i++) {
    NSLog(@"%@",[theTeacherList objectAtIndex:i]);
}
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
