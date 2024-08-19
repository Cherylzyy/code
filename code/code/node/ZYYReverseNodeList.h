//
//  ZYYReverseNodeList.h
//  code
//
//  Created by zoezyyzhang on 2024/8/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ZYYNode;

@interface ZYYReverseNodeList : NSObject

+ (ZYYNode *)reverseNodeList:(ZYYNode *)head
                   recursive:(BOOL)recursive;

+ (ZYYNode *)createNodeListWithArray:(NSArray<NSNumber *> *)array;

+ (void)showNodeList:(ZYYNode *)head;

@end

NS_ASSUME_NONNULL_END
