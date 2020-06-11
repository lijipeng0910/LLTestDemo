//
//  NSObject+LLModel.m
//  LLTest
//
//  Created by lijipeng on 2020/6/4.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "NSObject+LLModel.h"
#import <objc/runtime.h>

@implementation NSObject (LLModel)
/*
 * 把字典中所有value给模型中属性赋值,
 * KVC:遍历字典中所有key,去模型中查找
 * Runtime:根据模型中属性名去字典中查找对应value,如果找到就给模型的属性赋值.
 */
// 字典转模型
+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    id objc = [[self alloc] init];
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(self, &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *key = [ivarName substringFromIndex:1];
        id value = dict[key];
        if (value == nil) continue;
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        if ([value isKindOfClass:[NSDictionary class]] && ![ivarType containsString:@"NS"]) {// value是字典
            ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
            ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
            Class modalClass = NSClassFromString(ivarType);
            if (modalClass) {
                value = [modalClass modelWithDict:value];
            }
        } else if ([value isKindOfClass:[NSArray class]]) {// value是数组
            if ([self respondsToSelector:@selector(arrayContainModelClass)]) {
                id idSelf = self;
                NSString *type =  [idSelf arrayContainModelClass][key];
                Class classModel = NSClassFromString(type);
                NSMutableArray *arrM = [NSMutableArray array];
                for (NSDictionary *dict in value) {
                    id model =  [classModel modelWithDict:dict];
                    [arrM addObject:model];
                }
                value = arrM;
            }
        }
        if (value) {
            [objc setValue:value forKey:key];
        }
    }
    free(ivarList);
    return objc;
}

+ (NSDictionary *)arrayContainModelClass
{
    //return @{@"cellMdlArr" : @"CellModel"};
    return nil;
}
@end
