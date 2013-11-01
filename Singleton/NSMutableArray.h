//
//  NSMutableArray.h
//  Singleton
//
//  Created by Petahwil on 10/29/13.
//  Copyright (c) 2013 Petahwil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (NullInit)
+(NSMutableArray *)mutableNullArrayWithSize:(NSUInteger)size;
+(NSMutableArray *)mutableNullArraysWithVisualFormat:(NSString *)string;
@end
