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
    obj.URL= @"http://search.azlyrics.com/search.php?q=Hey+There+D&p=1&w=songs";
    obj.printXML = @"";
    obj.dimentionArraySize =[NSMutableArray arrayWithObjects:@"20",@"3",nil];
    obj.changeParam = [NSMutableArray arrayWithObjects:@"",nil];
    obj.findParsString =[NSMutableArray arrayWithObjects:@"<a href=\"http://www.azlyrics.com/lyrics/",nil];
    obj.startPars = [NSMutableArray arrayWithObjects:@"<a href=",@">",@"<b>",@"Break",nil];
    obj.endPars =[NSMutableArray arrayWithObjects:@">",@"</a>",@"</b>",nil];
    

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    theTeacherList = [[teacherList sharedTeacherList]tree];

    int i;
    int p = 0;
    for (i = 0; i <20; i++) {
    NSLog(@" \n %i) %@ ,\n %@ ,\n %@",i +1,[[teacherList sharedTeacherList]tree][p][0], [[teacherList sharedTeacherList]tree][p][1], [[teacherList sharedTeacherList]tree][p][2]);
         p++;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
