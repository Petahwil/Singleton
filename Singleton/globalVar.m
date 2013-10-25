//
//  globalVar.m
//  Singleton
//
//  Created by Petahwil on 10/23/13.
//  Copyright (c) 2013 Petahwil. All rights reserved.
//

#import "globalVar.h"


@implementation DataClass
@synthesize URL;
@synthesize printXML;
@synthesize changeParam;
@synthesize startPars;
@synthesize endPars;
@synthesize findParsString;
static DataClass *instance =nil;
+(DataClass *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            
            instance= [DataClass new];
        }
    }
    return instance;
}
@end
