//
//  ZYYQuickSort.h
//  code
//
//  Created by zyy on 2024/7/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYYQuickSort : NSObject

+ (void)quickSort:(NSMutableArray<NSNumber *> *)array
         recusive:(BOOL)recusive;

@end

NS_ASSUME_NONNULL_END
