//
//  ZYYStack.h
//  code
//
//  Created by zyy on 2024/7/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYYStack : NSObject

- (void)push:(NSObject *)item;

- (void)pop;

- (NSObject *)top;

- (BOOL)empty;

@end

NS_ASSUME_NONNULL_END
