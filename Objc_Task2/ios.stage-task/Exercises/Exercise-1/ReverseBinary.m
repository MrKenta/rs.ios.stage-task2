#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
   
    if (n == 0) {
        return n ;
    }
    
    int input = n;

    UInt8 result = 0;
    
    NSMutableArray *arrayNumber = [NSMutableArray new];
    
    while (input != 0) {
        
        int remaning  = input % 2;
            [arrayNumber addObject:[NSNumber numberWithInt:remaning]];
        int value = input / 2;
        input = value;
    }
    int myltiplyer = 128;
        for (int i = 0; i <= arrayNumber.count -1 ; i++) {
            int number = [[arrayNumber objectAtIndex:i]intValue] * myltiplyer;
            result += number;
            myltiplyer /= 2;
        }
    return  result;
}
