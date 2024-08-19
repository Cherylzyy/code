//
//  ZYYStack.m
//  code
//
//  Created by zyy on 2024/7/21.
//

#import "ZYYStack.h"

@interface ZYYStack ()

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation ZYYStack

- (instancetype)init {
    self = [super init];
    if (self) {
        self.items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)push:(NSObject *)item {
    [self.items addObject:item];
}

- (NSObject *)top {
    return self.items.lastObject;
}

- (void)pop {
    [self.items removeLastObject];
}

- (BOOL)empty {
    return (self.items.count == 0);
}

@end
