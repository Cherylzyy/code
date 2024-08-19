//
//  ZYYSelectionSort.m
//  code
//
//  Created by zyy on 2024/7/21.
//

#import "ZYYSelectionSort.h"

@implementation ZYYSelectionSort

/** 选择排序：
 * 外部循环：次数(array.count - 1) ; i = [0, array.count - 1)
 * 内部循环：每次 从j = [i + 1, array.count - 1) 这些数同minIndex = i中的数比较，a[minIndex] > a[j],则minIndex = j; 结束内部循环的时候交换a[minIndex]中和a[i]
 */

+ (void)selectionSort:(NSMutableArray<NSNumber *> *)array {
    if (array.count <= 1) {
        return;
    }
    
    for (int i = 0; i < array.count - 1; i ++) {
        NSInteger minIndex = i;
        for (int j = i + 1; j < array.count; j ++) {
            if (array[minIndex].integerValue > array[j].integerValue) {
                minIndex = j;
            }
        }
        NSNumber *temp = array[i];
        array[i] = array[minIndex];
        array[minIndex] = temp;
    }
}

@end
