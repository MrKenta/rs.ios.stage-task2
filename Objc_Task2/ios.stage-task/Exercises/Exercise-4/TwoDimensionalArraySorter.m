#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    if ([[array firstObject] isKindOfClass:[NSNumber class]]) {
        return  @[];
    }
    
        if (array != nil) {
            NSMutableArray *result = [NSMutableArray new];
            NSMutableArray *numberArraySeparate = [NSMutableArray new];
            NSMutableArray *stringArraySeparate = [NSMutableArray new];
            for (int i = 0; i<= array.count - 1 ; i++) {
                if ([[array objectAtIndex:i].firstObject isKindOfClass:[NSNumber class]]) {
                  //  [numberArraySeparate addObject:[array objectAtIndex:i]];
                    [numberArraySeparate addObjectsFromArray:[array objectAtIndex:i]];
                }
                if ([[array objectAtIndex:i].firstObject isKindOfClass:[NSString class]]) {
                    [stringArraySeparate addObjectsFromArray:[array objectAtIndex:i]];
                }
            }
                if (numberArraySeparate.count > 0 && stringArraySeparate.count == 0 ) {
                    [numberArraySeparate sortUsingSelector:@selector(compare:)];
                    return [NSArray arrayWithArray:numberArraySeparate];
                }
            
            if (stringArraySeparate.count > 0 && numberArraySeparate.count == 0){
                [stringArraySeparate sortUsingSelector:@selector(compare:)];
                return [NSArray arrayWithArray:stringArraySeparate];
                    }
            
                if (stringArraySeparate.count >0 && numberArraySeparate.count > 0) {
                        [numberArraySeparate sortUsingSelector:@selector(compare:)];
                        [result addObject:numberArraySeparate];
                        [result addObject:stringArraySeparate];
                    }
                    return [NSArray arrayWithArray:result];
        
    }
    return @[];
}

@end
