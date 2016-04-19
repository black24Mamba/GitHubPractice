//
//  ZYMessageViewController.m
//  TeamWork
//
//  Created by 章鱼 on 16/3/15.
//  Copyright © 2016年 章鱼. All rights reserved.
//

#import "ZYMessageViewController.h"
#import "ZYModel.h"
@interface ZYMessageViewController ()
//添加一个webView的属性
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation ZYMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建webView
    self.webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    [self.webView setupAutoWidthWithRightView:self.view rightMargin:0];
    NSURL *url = [NSURL URLWithString:self.model.fromurl];
    NSLog(@"%@",url);
    NSURLRequest *requset = [[NSURLRequest alloc]initWithURL:url];
    //使用webView 加载请求内容
    [self.webView loadRequest:requset];
    [self.view addSubview:self.webView];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('bottomAd')[0].style.display = 'NONE'"];
    [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('header')[0].style.display = 'NONE'"];
    [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('top')[0].style.display = 'NONE'"];
    [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('mar6')[0].style.display = 'NONE'"];
 }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
}

@end
