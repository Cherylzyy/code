//
//  ZYYQueue.h
//  code
//
//  Created by zyy on 2024/7/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYYQueue : NSObject

- (void)enqueue:(NSObject *)item;

- (void)dequeue;

- (NSObject *)head;

- (BOOL)empty;

- (NSInteger)size;

@end

NS_ASSUME_NONNULL_END
