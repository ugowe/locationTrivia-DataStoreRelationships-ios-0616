//  FISTriviumSpec.m

#import "Specta.h"
#import "FISTrivium.h"
#define EXP_SHORTHAND
#import <Expecta.h>


SpecBegin(FISTrivium)

describe(@"FISTrivium", ^{
    
    __block FISTrivium *trivium;
    __block FISTrivium *joeIsAmazing;
    __block FISTrivium *markIsJustAlright;
    __block FISTrivium *mossIsTheBoss;
    
    beforeEach(^{
        trivium = [[FISTrivium alloc] init];
        joeIsAmazing = [[FISTrivium alloc] initWithContent:@"Joe is amazing!"
                                                     likes:5];
        markIsJustAlright = [[FISTrivium alloc] initWithContent:@"Mark is just alright."
                                                          likes:1];
        mossIsTheBoss = [[FISTrivium alloc] initWithContent:@"The boss is Moss."
                                                      likes:112358];
    });
    
    describe(@"default initializer", ^{
        it(@"should set content to an empty string", ^{
            expect(trivium.content).to.equal(@"");
        });
        
        it(@"should set likes to 0", ^{
            expect(trivium.likes).to.equal(0);
        });
    });
    
    describe(@"designated initializer", ^{
        it(@"should set content to the submitted string argument", ^{
            expect(joeIsAmazing.content).to.equal(@"Joe is amazing!");
            expect(markIsJustAlright.content).to.equal(@"Mark is just alright.");
            expect(mossIsTheBoss.content).to.equal(@"The boss is Moss.");
        });
        
        it(@"should set likes to the submitted integer argument", ^{
            expect(joeIsAmazing.likes).to.equal(5);
            expect(markIsJustAlright.likes).to.equal(1);
            expect(mossIsTheBoss.likes).to.equal(112358);
        });
    });
});

SpecEnd
