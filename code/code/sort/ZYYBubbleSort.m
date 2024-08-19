//
//  ZYYBubbleSort.m
//  code
//
//  Created by zyy on 2024/7/21.
//

#import "ZYYBubbleSort.h"

@implementation ZYYBubbleSort

/** 冒泡排序：
 * 外部循环：次数(array.count - 1) ; i = [0, array.count - 1)
 * 内部循环：每次比较相邻两个位置的数字，如果a[j] > a[j + 1],交换 j = [0, array.count - 1 - i)
 */

+ (void)bubbleSort:(NSMutableArray<NSNumber *> *)array {
    if (array.count <= 1) {
        return;
    }
    for (int i = 0; i < array.count - 1; i ++) {
        for (int j = 0; j < array.count - 1 - i; j ++) {
            if (array[j].integerValue > array[j + 1].integerValue) {
                NSNumber* temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
            }
        }
    }
}

@end
