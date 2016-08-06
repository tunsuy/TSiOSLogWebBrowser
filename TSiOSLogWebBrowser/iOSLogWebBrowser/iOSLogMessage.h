//
//  iOSLogMessage.h
//  TSiOSLogWebBrowser
//
//  Created by tunsuy on 16/6/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <asl.h>

@interface iOSLogMessage : NSObject

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, assign) NSTimeInterval timeInterval;
@property (nonatomic, copy) NSString *sender;
@property (nonatomic, copy) NSString *messageText;
@property (nonatomic, assign) long long messageID;


+ (instancetype)logMessageFromASLMessage:(aslmsg)aslMessage;

- (NSString *)displayedTextForLogMessage;
+ (NSString *)logTimeStringFromDate:(NSDate *)date;

@end
