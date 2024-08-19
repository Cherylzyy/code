//
//  ZYYMergeSort.h
//  code
//
//  Created by zyy on 2024/7/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYYMergeSort : NSObject

+ (void)mergeSort:(NSMutableArray<NSNumber *> *)array
        recursive:(BOOL)recursive;

@end

NS_ASSUME_NONNULL_END
