//
//  ZYYBinarySearch.m
//  code
//
//  Created by zyy on 2024/7/21.
//

#import "ZYYBinarySearch.h"

@implementation ZYYBinarySearch

/**二分查找: 
 1 数组是有序的
 2 mid = （low + high）/ 2
 3 array[mid] == key, return mid;
 4 array[mid] > key, high = mid - 1, 回到2
 5 array[mid] < key, low = mid + 1, 回到2
 
 */
+ (NSInteger)binarySearch:(NSArray<NSNumber *> *)array
                      key:(NSInteger)key
                recursive:(BOOL)recursive {
    if (array.count == 0) {
        return -1;
    }
    if (recursive) {
        [self binarySearchRecursive:array key:key low:0 high:(array.count - 1)];
    }
    return [self binarySearchNonRecursive:array key:key low:0 high:(array.count - 1)];
}

+ (NSInteger)binarySearchRecursive:(NSArray<NSNumber *> *)array
                               key:(NSInteger)key
                               low:(NSInteger)low
                              high:(NSInteger)high {
    if (high < low) {
        return -1;
    }
    NSInteger mid = (low + high) / 2;
    if (array[mid].integerValue == key) {
        return mid;
    } else if (array[mid].integerValue > key) {
        high = mid - 1;
    } else {
        low = mid + 1;
    }
    return [self binarySearchRecursive:array key:key low:low high:high];
}

+ (NSInteger)binarySearchNonRecursive:(NSArray<NSNumber *> *)array
                                  key:(NSInteger)key
                                  low:(NSInteger)low
                                 high:(NSInteger)high {
    while (low <= high) {
        NSInteger mid = (low + high) / 2;
        if (array[mid].integerValue == key) {
            return mid;
        } else if (array[mid].integerValue > key) {
            high = mid - 1;
        } else {
            low = mid + 1;
        }
    }
    return -1;
}

@end
