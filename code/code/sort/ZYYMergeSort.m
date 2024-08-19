//
//  ZYYMergeSort.m
//  code
//
//  Created by zyy on 2024/7/21.
//

#import "ZYYMergeSort.h"

@implementation ZYYMergeSort

/** 归并排序：
 *
 *
 */

+ (void)mergeSort:(NSMutableArray<NSNumber *> *)array
        recursive:(BOOL)recursive {
    if (recursive) {
        [self mergeSortRecursive:array low:0 high:array.count - 1];
    } else {
        [self mergeSortNonRecursive:array];
    }
}



+ (void)mergeSortRecursive:(NSMutableArray<NSNumber *> *)array
                       low:(NSInteger)low
                      high:(NSInteger)high {
    
    if (low >= high) {
        return;
    }
    
    NSInteger mid = (low + high) / 2;
    [self mergeSortRecursive:array low:low high:mid];
    [self mergeSortRecursive:array low:(mid + 1) high:high];
    [self merge:array low:low mid:mid high:high];
    
}

+ (void)mergeSortNonRecursive:(NSMutableArray<NSNumber *> *)array {
    if (array.count <= 1) {
        return;
    }
    NSInteger length = 1;
    NSInteger low = 0;
    
    //(low + length)是第二个数组的第一个元素index，如果第二个数字的第一个元素index已经越界，说明没有第二个数组需要和第一个合并了
    while (low + length <= array.count - 1) {
        while (low + length <= array.count - 1) {
            NSInteger mid = low + length - 1;
            NSInteger high = mid + length;
            if (high > array.count - 1) {
                high = array.count - 1;
            }
            [self merge:array low:low mid:mid high:high];
            low = high + 1;
        }
        low = 0;
        length = length * 2;
    }
}

+ (void)merge:(NSMutableArray<NSNumber *> *)array
          low:(const NSInteger)low
          mid:(const NSInteger)mid
         high:(const NSInteger)high {
    NSInteger left = low;
    NSInteger right = mid + 1;
    NSInteger temp = 0;
    NSMutableArray<NSNumber *> *tempArray = [[NSMutableArray alloc] initWithCapacity:(high - low + 1)];
    while (left <= mid && right <= high) {
        if (array[left].integerValue <= array[right].integerValue) {
            tempArray[temp++] = array[left ++];
        } else {
            tempArray[temp++] = array[right ++];
        }
    }
    
    while (left <= mid) {
        tempArray[temp ++] = array[left ++];
    }
    while (right <= high) {
        tempArray[temp ++] = array[right ++];
    }
    
    temp = 0;
    NSInteger temp1 = low;
    while (temp1 <= high) {
        array[temp1 ++] = tempArray[temp ++];
    }
}

@end
