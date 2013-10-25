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
    NSString *changeParam;
    NSString *findParsString;
    NSString *startPars;
    int startLength;
    NSString *endPars;
}
@property(nonatomic,retain)NSString *URL;
@property(nonatomic,retain)NSString *printXML;
@property(nonatomic,retain)NSString *changeParam;
@property(nonatomic,retain)NSString *findParsString;
@property(nonatomic,retain)NSString *startPars;
@property(nonatomic,retain)NSString *endPars;
+(DataClass*)getInstance;
@end


