//
//  ZYYQueue.m
//  code
//
//  Created by zyy on 2024/7/22.
//

#import "ZYYQueue.h"

@interface ZYYQueue ()

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation ZYYQueue

- (instancetype)init {
    self = [super init];
    if (self) {
        self.items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)enqueue:(NSObject *)item {
    [self.items addObject:item];
}

- (void)dequeue {
    if (!self.empty) {
        [self.items removeObjectAtIndex:0];
    }
}

- (NSObject *)head {
    return self.items.firstObject;
}

- (BOOL)empty {
    return self.items.count == 0;
}

- (NSInteger)size {
    return self.items.count;
}


@end
