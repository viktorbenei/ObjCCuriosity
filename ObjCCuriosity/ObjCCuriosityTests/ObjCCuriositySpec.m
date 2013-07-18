#import "Kiwi.h"

SPEC_BEGIN(ObjCCuriositySpec)

describe(@"nil NSArray isKindOfClass NSArray", ^{
    it(@"no, it is not", ^{
        NSArray *nilArray = nil;
        [[theValue([nilArray isKindOfClass:[NSArray class]]) should] equal:(theValue(NO))];
    });
});

describe(@"Can an NSString be assigned to an NSDate variable?", ^{
    it(@"Yes, it can be!", ^{
        NSDate *thisIsNotADate = (id)@"no, it's not a date";
        [[thisIsNotADate should] equal:@"no, it's not a date"];
    });
});

SPEC_END