//
//  ZYYBinarySearch.h
//  code
//
//  Created by zyy on 2024/7/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYYBinarySearch : NSObject

+ (NSInteger)binarySearch:(NSArray<NSNumber *> *)array
                      key:(NSInteger)key
                recursive:(BOOL)recursive;

@end

NS_ASSUME_NONNULL_END
