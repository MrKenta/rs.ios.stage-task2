#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    if ([numbersArray containsObject:[NSNumber numberWithInt:256]]) {
        return @"The numbers in the input array can be in the range from 0 to 255." ;
    }

    if ([self isArrayNill:numbersArray]) {
        return @"";
    }else{
        BOOL state = [self isArrayContainNegative:numbersArray];
        
        switch (state) {
            case false:
                return [self convertIP:numbersArray];
                break;
            case true:
                return  @"Negative numbers are not valid for input."  ;
                break;
            default:
                break;
        }
    }
    
    return @"";
}




-(BOOL)isArrayNill:(NSArray *)array{
    
    if (array.count == 0 || array == nil) {
        return true;
    }
    return false;
}

- (BOOL)isArrayContainNegative:(NSArray *)array{
    
    for (int i = 0; i <=array.count-1 ; i++) {
        if ([[array objectAtIndex:i]intValue] < 0) {
            return true;
        }
    }
    return false;
}

-(NSString *)convertIP:(NSArray *)array{
    
    NSMutableString *str = [NSMutableString new];
    
    switch (array.count) {
        case 1:
            [str appendString:[self createString:array and:[NSNumber numberWithInt:1]]];
            [str appendString:@".0"];
            [str appendString:@".0"];
            [str appendString:@".0"];
            break;
        case 2:
            [str appendString:[self createString:array and:[NSNumber numberWithInt:2]]];
            [str appendString:@".0"];
            [str appendString:@".0"];
            break;
        case 3:
            [str appendString:[self createString:array and:[NSNumber numberWithInt:3]]];
            [str appendString:@".0"];
            break;
        case 4:
            [str appendString:[self createString:array and:[NSNumber numberWithInt:4]]];
            break;
        default:
            break;
    }
    
    NSString *result = [NSString stringWithString:str];
    
    return  result;
    }



-(NSString*)createString:(NSArray*)array and:(NSNumber*)number{
    NSMutableString *add = [NSMutableString new];
    for (int i = 0; i <= [number intValue] - 1; i++) {
        [add appendFormat:@"%@.", [NSString stringWithFormat:@"%@",[array objectAtIndex:i]]];
    }
   NSString *finalString = [add substringToIndex:[add length]-1];
    return finalString;
}

@end
