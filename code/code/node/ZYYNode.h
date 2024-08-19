//
//  ZYYNode.h
//  code
//
//  Created by zoezyyzhang on 2024/8/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYYNode : NSObject

@property (nonatomic, assign) NSInteger value;

@property (nonatomic, strong) ZYYNode *next;

@end

NS_ASSUME_NONNULL_END
