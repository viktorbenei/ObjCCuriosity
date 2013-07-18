#import "Kiwi.h"

#import "DefaultValues.h"

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
    
    it(@"What about isKindOfClass? Fortunately that works as expected.", ^{
        NSDate *thisIsNotADate = (id)@"no, it's not a date";
        [[thisIsNotADate should] beKindOfClass:[NSString class]];
    });
});

describe(@"What are the default value?", ^{
    it(@"For any id object it's nil", ^{
        NSString *aString;
        [[aString should] beNil];
        
        NSDate *aDate;
        [[aDate should] beNil];
        
        NSArray *anArray;
        [[anArray should] beNil];
        
        NSDictionary *aDictionary;
        [[aDictionary should] beNil];
    });
    
    it(@"For a BOOL it's NO", ^{
        [[theValue([[DefaultValues new] aBool]) should] equal:theValue(NO)];
        [[theValue([[DefaultValues new] aBool]) shouldNot] equal:theValue(YES)];
    });
    
    it(@"For a int, NSInteger, NSUInteger it's 0", ^{
        [[theValue([[DefaultValues new] anInt]) should] equal:theValue(0)];
        [[theValue([[DefaultValues new] anNSInteger]) should] equal:theValue(0)];
        [[theValue([[DefaultValues new] anNSUInteger]) should] equal:theValue(0)];
    });
});

describe(@"Is a Mutable object kindOf non-mutable?", ^{
    it(@"Generally: Yes, it is - when you use the standard Foundation classes", ^{
        NSMutableArray *mutableArray = [NSMutableArray new];
        [[mutableArray should] beKindOfClass:[NSArray class]];
    });
});

describe(@"Is a Non-Mutable object kindOf mutable?", ^{
    it(@"Generally: No - when you use the standard Foundation classes", ^{
        NSArray *nonMutableArray = [NSArray new];
        [[nonMutableArray shouldNot] beKindOfClass:[NSMutableArray class]];
    });
});

describe(@"A general rookie mistake: don't forget to instantiate mutable container classes!", ^{
    it(@"Yes, it is completely acceptable (won't throw any exceptions, won't break and won't even warn you about it) to 'addObject' to a nil or non initialized mutable container object, but you probably just forgot to instantiate it.", ^{
        NSMutableDictionary *nonInitializedMutableDictionary;
        [nonInitializedMutableDictionary setObject:@YES forKey:@"aKey"];
        // but you won't get it back unless you initialize the dictionary first
        [[[nonInitializedMutableDictionary objectForKey:@"aKey"] should] beNil];
    });
});

describe(@"And generaly you can message any nil object with any acceptable message", ^{
    it(@"and it will return the default value for the return type - but it won't throw any exception, won't crash and won't warn you about", ^{
        NSArray *nonInitializedArray;
        [[theValue([nonInitializedArray count]) should] equal:theValue(0)];
        //
        NSString *nonInitializedString;
        [[theValue([nonInitializedString length]) should] equal:theValue(0)];
        //
        NSNumber *nonInitializedNumberOne;
        NSNumber *nonInitializedNumberTwo;
        [[theValue([nonInitializedNumberOne isEqualToNumber:nonInitializedNumberTwo]) should] equal:theValue(NO)];
    });
});

SPEC_END