 //
//  ZYXmlTool.m
//  Test
//
//  Created by 章鱼 on 16/3/14.
//  Copyright © 2016年 章鱼. All rights reserved.
//

#import "ZYXmlTool.h"
#import "ZYModel.h"
#import "GDataXMLNode.h"
@implementation ZYXmlTool
/** XML数据请求 */
+ (void)requestXMLDataWithUrlStr:(NSString *)urlStr passValueBlock:(PassValueBlock)passValueBlock{
NSURL *url = [NSURL URLWithString:urlStr];
NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    ZYlog(@"%@",url);
//3.准备
NSURLSession *session = [NSURLSession sharedSession];
    NSMutableArray *arr = [NSMutableArray array];
//4.创建一个请求任务
NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (nil == error) {
        GDataXMLDocument *document = [[GDataXMLDocument alloc]initWithData:data options:0 error:nil];
        // 5.获取根节点
        GDataXMLElement *rootElement = [document rootElement];
        NSArray * array = [rootElement elementsForName:@"article"];
        for (GDataXMLElement *ele in array) {
            ZYModel *model = [ZYModel new];
            GDataXMLNode *t = [ele attributeForName:@"t"];//字符串
            model.t= t.stringValue;
            GDataXMLNode *n = [ele attributeForName:@"n"];//字符串
            model.n= n.stringValue;
            GDataXMLNode *p = [ele attributeForName:@"p"];//字符串
            model.p= p.stringValue;
            GDataXMLNode *date = [ele attributeForName:@"date"];//字符串
            model.date= date.stringValue;
            GDataXMLNode *fromurl = [ele attributeForName:@"fromurl"];//字符串
            model.fromurl= fromurl.stringValue;
            [arr addObject:model];
        }
       /** 回调刷新 */
        dispatch_async(dispatch_get_main_queue(), ^{//控件的刷新都必须在主线程做
            passValueBlock(arr);
        });
    }else{
        NSLog(@"请求数据失败！！错误信息：%@", error);
    }
}];
      //5.执行请求任务
        [task resume];
}

@end
