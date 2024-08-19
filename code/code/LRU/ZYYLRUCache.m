//
//  ZYYLRUCache.m
//  code
//
//  Created by zoezyyzhang on 2024/8/12.
//

#import "ZYYLRUCache.h"
#import "ZYYQueue.h"

@interface ZYYCacheItem : NSObject

@property (nonatomic, strong) NSString *cacheKey;

@property (nonatomic, strong) id cacheValue;

- (instancetype)initWithCacheKey:(NSString *)key value:(id)cacheValue;

@end

@implementation ZYYCacheItem

- (instancetype)initWithCacheKey:(NSString *)key value:(id)cacheValue {
    self = [super init];
    if (self) {
        self.cacheKey = cacheValue;
        self.cacheValue = cacheValue;
    }
    return self;
}

@end



@interface ZYYLRUCache()

@property (nonatomic, strong) NSMutableDictionary<NSString *, ZYYCacheItem *> *cacheItems;

@property (nonatomic, assign) NSInteger capacity;

@property (nonatomic, strong) NSMutableArray<ZYYCacheItem *> *queue;

@end

@implementation ZYYLRUCache

- (instancetype)initWithCapacity:(NSInteger)capacity {
    self = [super init];
    if (self) {
        self.capacity = capacity;
        self.cacheItems = [[NSMutableDictionary alloc] initWithCapacity:self.capacity];
        self.queue = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)putCacheValue:(id)value forKey:(NSString *)key {
    ZYYCacheItem *oldCacheItem = self.cacheItems[key];
    ZYYCacheItem *newCacheItem = [[ZYYCacheItem alloc] initWithCacheKey:key
                                                                  value:value];
    if (oldCacheItem) {
        [self removeQueueCacheItem:oldCacheItem];
    } else {
        if ([self isCacheFull]) {
            [self removeQueueHead];
        }
    }
    
    [self addQueueTail:newCacheItem];
}

- (id)getCacheValueWithKey:(NSString *)key {
    ZYYCacheItem * cacheItem = self.cacheItems[key];
    if (cacheItem) {
        //借助put 将这个（key ， cacheValue）更新为最新访问
        [self putCacheValue:cacheItem.cacheValue forKey:key];
    }
    return cacheItem.cacheValue;
}

- (BOOL)isCacheFull {
    return (self.cacheItems.count == self.capacity);
}

- (void)removeQueueHead {
    if (self.queue.count > 0) {
        ZYYCacheItem *removeCacheItem = self.queue[0];
        [self.cacheItems removeObjectForKey:removeCacheItem.cacheKey];
        [self.queue removeObjectAtIndex:0];
    }
}

- (void)addQueueTail:(ZYYCacheItem *)cacheItem {
    [self.queue addObject:cacheItem];
    self.cacheItems[cacheItem.cacheKey] = cacheItem;
}

- (void)removeQueueCacheItem:(ZYYCacheItem *)cacheItem {
    [self.cacheItems removeObjectForKey:cacheItem.cacheKey];
    [self.queue removeObject:cacheItem];
}

@end
