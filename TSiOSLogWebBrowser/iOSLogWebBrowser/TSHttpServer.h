//
//  TSHttpServer.h
//  TSiOSLogWebBrowser
//
//  Created by tunsuy on 16/6/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSHttpServer : NSObject

+ (instancetype)sharedTSHttpServer;
- (void)startServer;
- (void)stopServer;

@end
