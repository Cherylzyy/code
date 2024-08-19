//
//  ZYYStockProfile.h
//  code
//
//  Created by zoezyyzhang on 2024/8/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYYStockProfile : NSObject

+ (NSInteger)maxStockProfileforOneTransaction:(NSArray <NSNumber *> *)prices;

+ (NSInteger)dpMaxStockProfileforOneTransaction:(NSArray <NSNumber *> *)prices;

+ (NSInteger)dpMaxStockProfileforMultipleTransaction:(NSArray <NSNumber *> *)prices;

+ (NSInteger)dpMaxStockProfileforAtMostTwiceTransaction:(NSArray <NSNumber *> *)prices;

@end

NS_ASSUME_NONNULL_END
