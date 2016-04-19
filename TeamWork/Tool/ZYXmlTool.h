//
//  ZYXmlTool.h
//  Test
//
//  Created by 章鱼 on 16/3/14.
//  Copyright © 2016年 章鱼. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^PassValueBlock) (NSArray *arr);
@class ZYModel;
@interface ZYXmlTool : NSObject
/** XML数据请求 */
+ (void)requestXMLDataWithUrlStr:(NSString *)urlStr passValueBlock:(PassValueBlock)passValueBlock;
@end
