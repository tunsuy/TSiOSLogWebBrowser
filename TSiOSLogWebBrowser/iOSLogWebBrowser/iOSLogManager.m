//
//  iOSLogManager.m
//  TSiOSLogWebBrowser
//
//  Created by tunsuy on 16/6/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "iOSLogManager.h"

@implementation iOSLogManager

+ (NSMutableArray<iOSLogMessage *> *)allLogMessagesForCurrentProcess {
    asl_object_t query = asl_new(ASL_TYPE_QUERY);
    
    // Filter for messages from the current process. Note that this appears to happen by default on device, but is required in the simulator.
    NSString *pidString = [NSString stringWithFormat:@"%d", [[NSProcessInfo processInfo] processIdentifier]];
    asl_set_query(query, ASL_KEY_PID, [pidString UTF8String], ASL_QUERY_OP_EQUAL);
    
    aslresponse response = asl_search(NULL, query);
    aslmsg aslMessage = NULL;
    
    NSMutableArray *logMessages = [NSMutableArray array];
    while ((aslMessage = asl_next(response))) {
        [logMessages addObject:[iOSLogMessage logMessageFromASLMessage:aslMessage]];
    }
    asl_release(response);
    
    return logMessages;
}

+ (NSArray<iOSLogMessage *> *)allLogAfterTime:(double) time {
    NSMutableArray<iOSLogMessage *>  *allMsg = [self allLogMessagesForCurrentProcess];
    NSArray *filteredLogMessages = [allMsg filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(iOSLogMessage *logMessage, NSDictionary *bindings) {
        if (logMessage.timeInterval > time) {
            return  YES;
        }
        return NO;
    }]];
    
    return filteredLogMessages;
    
    
}

@end
