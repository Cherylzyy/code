//
//  ZYYInsertionSort.m
//  code
//
//  Created by zyy on 2024/7/21.
//

#import "ZYYInsertionSort.h"

@implementation ZYYInsertionSort

/** 插入排序：
 * 外部循环：次数(array.count - 1) ; i = [1, array.count - 1]
 * 内部循环：
 */

+ (void)insertionSort:(NSMutableArray<NSNumber *> *)array {
    if (array.count <= 1) {
        return;
    }
    for (int i = 1; i < array.count; i ++) {
        NSNumber *temp = array[i];
        int j = i - 1;
        while (j >= 0 && array[j].integerValue > temp.integerValue) {
            array[j + 1] = array[j];
            j --;
        }
        array[j + 1] = temp;
    }
}

@end
