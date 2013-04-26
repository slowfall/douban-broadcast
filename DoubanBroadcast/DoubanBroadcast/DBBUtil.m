//
//  DBBUtil.m
//  DoubanBroadcast
//
//  Created by Zack on 26/4/13.
//  Copyright (c) 2013 Banana Inc. All rights reserved.
//

#import "DBBUtil.h"

@implementation DBBUtil

+ (NSArray *) dictionaryWithJSONFile:(NSString *)fileName
{
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:jsonPath];
    NSError *error;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
    return array;
}
@end
