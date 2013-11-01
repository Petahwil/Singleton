//
//  globalVar.h
//  Singleton
//
//  Created by Petahwil on 10/23/13.
//  Copyright (c) 2013 Petahwil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataClass : NSObject {
    
    NSString *URL;
    NSString *printXML;
    NSMutableArray *changeParam;
    NSMutableArray *findParsString;
    NSMutableArray *startPars;
    NSMutableArray *dimentionArraySize;
    NSMutableArray *endPars;
}
@property(nonatomic,retain)NSString *URL;
@property(nonatomic,retain)NSString *printXML;
@property(nonatomic,retain)NSMutableArray *changeParam;
@property(nonatomic,retain)NSMutableArray *findParsString;
@property(nonatomic,retain)NSMutableArray *startPars;
@property(nonatomic,retain)NSMutableArray *endPars;
@property(nonatomic,retain)NSMutableArray *dimentionArraySize;
+(DataClass*)getInstance;
@end


