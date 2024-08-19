//
//  ZYYQuickSort.m
//  code
//
//  Created by zyy on 2024/7/21.
//

#import "ZYYQuickSort.h"
#import "ZYYStack.h"

@implementation ZYYQuickSort


/** 快速排序：
 *
 *
 */
+ (void)quickSort:(NSMutableArray<NSNumber *> *)array
         recusive:(BOOL)recusive {
    if (recusive) {
        [self quickSortRecusive:array low:0 high:array.count - 1];
    } else {
        [self quickSortNonRecusive:array];
    }
}

+ (void)quickSortRecusive:(NSMutableArray<NSNumber *> *)array
                      low:(NSInteger)low
                     high:(NSInteger)high{
    if (low >= high) {
        return;
    }
    NSInteger keyIndex = [self partition:array low:low high:high];
    [self quickSortRecusive:array low:low high:(keyIndex - 1)];
    [self quickSortRecusive:array low:(keyIndex + 1) high:high];
}

+ (void)quickSortNonRecusive:(NSMutableArray<NSNumber *> *)array {
    if (array.count <= 0) {
        return;
    }
    
    ZYYStack *stack = [[ZYYStack alloc] init];
    [stack push:@(0)];
    [stack push:@(array.count - 1)];
    while (![stack empty]) {
        NSInteger high = ((NSNumber *)[stack top]).integerValue;
        [stack pop];
        NSInteger low = ((NSNumber *)[stack top]).integerValue;
        [stack pop];
        
        NSInteger keyIndex = [self partition:array low:low high:high];
        
        
        if (keyIndex - 1 > low) {
            [stack push:@(low)];
            [stack push:@(keyIndex - 1)];
        }
        
        if (keyIndex + 1 < high) {
            [stack push:@(keyIndex + 1)];
            [stack push:@(high)];
        }
    }
}

+ (NSInteger)partition:(NSMutableArray<NSNumber *> *)array 
                   low:(NSInteger)low
                  high:(NSInteger)high {
    NSNumber *temp = array[low];
    while (low < high) {
        while (low < high && array[high].integerValue >= temp.integerValue) {
            high --;
        }
        array[low] = array[high];
        
        while (low < high && array[low].integerValue <= temp.intValue) {
            low ++;
        }
        array[high] = array[low];
    }
    array[low] = temp;
    return low;
}

@end
