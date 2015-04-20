//
//  NSDictionary+ARTDictionaryUtil.m
//  ably-ios
//
//  Created by Jason Choy on 09/12/2014.
//  Copyright (c) 2014 Ably. All rights reserved.
//

#import "NSDictionary+ARTDictionaryUtil.h"
#import "NSDate+ARTUtil.h"

@implementation NSDictionary (ARTDictionaryUtil)

- (NSString *)artString:(id)key {
    return [self artTyped:[NSString class] key:key];
}

- (NSNumber *)artNumber:(id)key {
    return [self artTyped:[NSNumber class] key:key];
}

- (NSDate *)artDate:(id)key {
    NSNumber *ms = [self artNumber:key];
    if (ms) {
        return [NSDate artDateFromNumberMs:ms];
    } else {
        return nil;
    }
}

- (NSArray *)artArray:(id)key {
    return [self artTyped:[NSArray class] key:key];
}

- (NSDictionary *)artDictionary:(id)key {
    return [self artTyped:[NSDictionary class] key:key];
}

- (id)artTyped:(Class)cls key:(id)key {
    id obj = [self objectForKey:key];
    if ([obj isKindOfClass:cls]) {
        return obj;
    }
    return nil;
}

@end