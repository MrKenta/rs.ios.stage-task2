#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    int count = 0;
        for (int i = 0; i < array.count; i++) {
            for (int e = i + 1; e < array.count; e++) {
                if (array[e].intValue - array[i].intValue == number.intValue) {
                    count += 1;
                }
            }
        }
        return count;
    }
@end
