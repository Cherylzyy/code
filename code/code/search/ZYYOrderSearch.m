//
//  ZYYOrderSearch.m
//  code
//
//  Created by zyy on 2024/7/21.
//

#import "ZYYOrderSearch.h"

@implementation ZYYOrderSearch

//顺序查找: 顺序遍历数组中的每个元素，比较是否等于key，相等放回对应的位置index，找不到返回-1
+ (NSInteger)orderSearch:(NSArray<NSNumber *> *)array 
                     key:(NSInteger)key {
    if (array.count == 0) {
        return -1;
    }
    for (int i = 0; i < array.count; i ++) {
        if (array[i].integerValue == key) {
            return i;
        }
    }
    return -1;
}

@end
