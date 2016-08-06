//
//  iOSLogManager.h
//  TSiOSLogWebBrowser
//
//  Created by tunsuy on 16/6/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iOSLogMessage.h"

@interface iOSLogManager : NSObject

/**
 *  利用ASL提供的接口获取日志
 *
 *  @param time 指定的时间
 *
 *  @return 获取到的日志
 */
+ (NSArray<iOSLogMessage *> *)allLogAfterTime:(CFAbsoluteTime) time;

@end
