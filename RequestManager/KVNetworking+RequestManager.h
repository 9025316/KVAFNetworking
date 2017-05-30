//
//  KVNetworking+RequestManager.h
//  KVNetworking
//
//  Created by Kevin_han on 2017/2/10.
//  Copyright © 2017年 Kevin_han. All rights reserved.
//

#import "KVNetworking.h"

@interface KVNetworking (RequestManager)
/**
 *  判断网络请求池中是否有相同的请求
 *
 *  @param task 网络请求任务
 *
 *  @return bool
 */
+ (BOOL)haveSameRequestInTasksPool:(KVURLSessionTask *)task;

/**
 *  如果有旧请求则取消旧请求
 *
 *  @param task 新请求
 *
 *  @return 旧请求
 */
+ (KVURLSessionTask *)cancleSameRequestInTasksPool:(KVURLSessionTask *)task;

@end
