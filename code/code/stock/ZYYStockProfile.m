//
//  ZYYStockProfile.m
//  code
//
//  Created by zoezyyzhang on 2024/8/12.
//

#import "ZYYStockProfile.h"

@implementation ZYYStockProfile

/** 给定股票的价格数组，只进行一次买入和卖出操作时，可以获取的最大利润是多伤
 
 */

+ (NSInteger)maxStockProfileforOneTransaction:(NSArray <NSNumber *> *)prices {
    if (prices.count < 2) {
        return 0;
    }
    /*假定股票在prices[i]卖出，那么如果想获得最大利润，就需要在prices[0]-prices[i - 1]中找到最小值来买入
     这个差值就是股票的最大利润
     */
    NSInteger min = prices[0].integerValue;
    NSInteger maxProfile = prices[1].integerValue - min;
    for (int i = 2; i < prices.count; i ++) {
        if (min > prices[i - 1].integerValue) {
            min = prices[i - 1].integerValue;
        }
        NSInteger curProfile = prices[i].integerValue - min;
        if (maxProfile < curProfile) {
            maxProfile = curProfile;
        }
    }
    if (maxProfile < 0) {
        maxProfile = 0;
    }
    return maxProfile;
}

/**
 默认手里有现金数为0
 dp[i][0] 在第i天持有股票的时候，手里最大现金数
 dp[i][1] 在第i天不持有股票的时候，手里最大现金数
 */

+ (NSInteger)dpMaxStockProfileforOneTransaction:(NSArray <NSNumber *> *)prices {
    if (prices.count < 2) {
        return 0;
    }
    NSInteger count = prices.count;
    NSMutableArray<NSMutableArray<NSNumber *> *> *dp = [[NSMutableArray alloc] initWithCapacity:count];
    for (int i = 0; i < prices.count; i ++) {
        dp[i] = @[@0, @0].mutableCopy;
    }
    dp[0][0] =  @(0 - prices[0].integerValue);
    dp[0][1] = @0;
    for (int i = 1; i < prices.count; i ++) {
        //dp[i][0] = max(dp[i-1][0], - prices[i]);
        //dp[i][1] = max(dp[i-1][1], dp[i-1][0] + prices[i])
        dp[i][0] = @(MAX(dp[i-1][0].integerValue, - prices[i].integerValue));
        dp[i][1] = @(MAX(dp[i-1][1].integerValue, dp[i-1][0].integerValue + prices[i].integerValue));
    }
    return dp[count - 1][1].integerValue;
}

/**
 默认手里有现金数为0
 dp[i][0] 在第i天持有股票的时候，手里最大现金数
 dp[i][1] 在第i天不持有股票的时候，手里最大现金数
 */

+ (NSInteger)dpMaxStockProfileforMultipleTransaction:(NSArray <NSNumber *> *)prices {
    if (prices.count < 2) {
        return 0;
    }
    NSInteger count = prices.count;
    NSMutableArray<NSMutableArray<NSNumber *> *> *dp = [[NSMutableArray alloc] initWithCapacity:count];
    for (int i = 0; i < prices.count; i ++) {
        dp[i] = @[@0, @0].mutableCopy;
    }
    dp[0][0] =  @(0 - prices[0].integerValue);
    dp[0][1] = @0;
    for (int i = 1; i < prices.count; i ++) {
        //dp[i][0] = max(dp[i-1][0],dp[i-1][1] - prices[i]);
        //dp[i][1] = max(dp[i-1][1], dp[i-1][0] + prices[i])
        dp[i][0] = @(MAX(dp[i-1][0].integerValue, dp[i-1][1].integerValue - prices[i].integerValue));
        dp[i][1] = @(MAX(dp[i-1][1].integerValue, dp[i-1][0].integerValue + prices[i].integerValue));
    }
    return dp[count - 1][1].integerValue;
}

/**
 最多尽行两次交易
 默认手里有现金数为0
 dp[i][0] 在第i天处于没有尽行任何操作的时候，手里最大现金数
 dp[i][1] 在第i天处于第一次持有股票的时候，手里最大现金数
 dp[i][2] 在第i天处于第一次不持有股票的时候，手里最大现金数
 dp[i][3] 在第i天处于第二次持有股票的时候，手里最大现金数
 dp[i][4] 在第i天处于第二次不持有股票的时候，手里最大现金数
 */

+ (NSInteger)dpMaxStockProfileforAtMostTwiceTransaction:(NSArray <NSNumber *> *)prices {
    if (prices.count < 2) {
        return 0;
    }
    NSInteger count = prices.count;
    NSMutableArray<NSMutableArray<NSNumber *> *> *dp = [[NSMutableArray alloc] initWithCapacity:count];
    for (int i = 0; i < prices.count; i ++) {
        dp[i] = @[@0, @0, @0, @0, @0].mutableCopy;
    }
    dp[0][0] = @0;
    dp[0][1] = @(0 - prices[0].integerValue);
    dp[0][2] = @0;
    dp[0][3] = @(0 - prices[0].integerValue);
    dp[0][4] = @0;
    
    for (int i = 1; i < prices.count; i ++) {
        //dp[i][0] = 0;
        //dp[i][1] = max(dp[i-1][1], dp[i-1][0] - prices[i])
        //dp[i][2] = max(dp[i-1][2], dp[i-1][1] + prices[i])
        //dp[i][3] = max(dp[i-1][3], dp[i-1][2] - prices[i])
        //dp[i][4] = max(dp[i-1][4], dp[i-1][3] + prices[i])
        
        dp[i][0] = @0;
        dp[i][1] = @(MAX(dp[i-1][1].integerValue, dp[i-1][0].integerValue - prices[i].integerValue));
        dp[i][2] = @(MAX(dp[i-1][2].integerValue, dp[i-1][1].integerValue + prices[i].integerValue));
        dp[i][3] = @(MAX(dp[i-1][3].integerValue, dp[i-1][2].integerValue - prices[i].integerValue));
        dp[i][4] = @(MAX(dp[i-1][4].integerValue, dp[i-1][3].integerValue + prices[i].integerValue));
    }
    return dp[count - 1][4].integerValue;
}

@end
