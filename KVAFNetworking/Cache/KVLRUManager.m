//
//  KVLRUManager.m
//  KVNetworking
//
//  Created by Kevin_han on 2017/2/10.
//  Copyright © 2017年 Kevin_han. All rights reserved.
//

#import "KVLRUManager.h"

static KVLRUManager *manager = nil;

static NSMutableArray *operationQueue = nil;

static NSString *const KVLRUManagerName = @"KVLRUManagerName";

@implementation KVLRUManager

+ (KVLRUManager *)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[KVLRUManager alloc] init];
        if ([[NSUserDefaults standardUserDefaults] objectForKey:KVLRUManagerName]) {
            operationQueue = [NSMutableArray arrayWithArray:(NSArray *)[[NSUserDefaults standardUserDefaults] objectForKey:KVLRUManagerName]];
        }else {
            operationQueue = [NSMutableArray array];
        }
    });
    return manager;
}
- (void)addFileNode:(NSString *)filename {
    NSArray *array = [operationQueue copy];
    
    //优化遍历
    NSArray *reverseArray = [[array reverseObjectEnumerator] allObjects];
    
    [reverseArray enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj[@"fileName"] isEqualToString:filename]) {
            [operationQueue removeObjectAtIndex:idx];
            *stop = YES;
        }
        
    }];
    
    NSDate *date = [NSDate date];
    
    NSDictionary *newDic = @{@"fileName":filename,@"date":date};
    
    [operationQueue addObject:newDic];
    
    [[NSUserDefaults standardUserDefaults] setObject:[operationQueue copy] forKey:KVLRUManagerName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)refreshIndexOfFileNode:(NSString *)filename {
    [self addFileNode:filename];
}

- (NSArray *)removeLRUFileNodeWithCacheTime:(NSTimeInterval)time {
    NSMutableArray *result = [NSMutableArray array];
    
    if (operationQueue.count > 0) {
        
        NSArray *tmpArray = [operationQueue copy];
        
        [tmpArray enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSDate *date = obj[@"date"];
            NSDate *newDate = [date dateByAddingTimeInterval:time];
            if ([[NSDate date] compare:newDate] == NSOrderedDescending) {
                [result addObject:obj[@"fileName"]];
                [operationQueue removeObjectAtIndex:idx];
            }
        }];
        
        if (result.count == 0) {
            NSString *removeFileName = [operationQueue firstObject][@"fileName"];
            [result addObject:removeFileName];
            [operationQueue removeObjectAtIndex:0];
        }
        
        [[NSUserDefaults standardUserDefaults] setObject:[operationQueue copy] forKey:KVLRUManagerName];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    return [result copy];
    
}

- (NSArray *)currentQueue {
    return [operationQueue copy];
}


@end
