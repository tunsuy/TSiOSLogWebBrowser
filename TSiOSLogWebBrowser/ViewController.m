//
//  ViewController.m
//  TSiOSLogWebBrowser
//
//  Created by tunsuy on 16/6/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "ViewController.h"
#import "TSHttpServer.h"

@interface ViewController () {
    BOOL serverOpened;
}

@property (nonatomic, strong) UIButton *httpServerBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    serverOpened = NO;
    
    _httpServerBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, [UIScreen mainScreen].bounds.size.width - 40, 50)];
    [_httpServerBtn setTitle:@"开启服务" forState:UIControlStateNormal];
    _httpServerBtn.backgroundColor = [UIColor blueColor];
    [_httpServerBtn addTarget:self action:@selector(httpServerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_httpServerBtn];
}

- (void)httpServerBtnClick:(UIButton *)button {
    if (serverOpened) {
        [[TSHttpServer sharedTSHttpServer] stopServer];
        serverOpened = NO;
        [_httpServerBtn setTitle:@"开启服务" forState:UIControlStateNormal];
    }
    else {
        [[TSHttpServer sharedTSHttpServer] startServer];
        serverOpened = YES;
        [_httpServerBtn setTitle:@"关闭服务" forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
