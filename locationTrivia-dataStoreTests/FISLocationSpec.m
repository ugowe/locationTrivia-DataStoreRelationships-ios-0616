//  FISLocationSpec.m

#import "Specta.h"
#define EXP_SHORTHAND
#import <Expecta.h>
#import "FISLocation.h"


SpecBegin(FISLocation)

describe(@"FISLocation", ^{
    
    __block FISLocation *defaultLocation;
    __block FISLocation *empireState;
    __block FISLocation *flatiron;
    __block FISLocation *ladyLiberty;
    
    __block FISTrivium *joeIsAmazing;
    __block FISTrivium *markIsJustAlright;
    __block FISTrivium *mossIsTheBoss;
    
    beforeEach(^{
        defaultLocation = [[FISLocation alloc] init];
        
        empireState = [[FISLocation alloc] initWithName:@"Empire State Building"
                                               latitude:40.748729
                                              longitude:-73.985779  ];
        
        flatiron = [[FISLocation alloc] initWithName:@"Flatiron School"
                                            latitude:40.705545
                                           longitude:-74.013975];
        
        ladyLiberty = [[FISLocation alloc] initWithName:@"Statue of Liberty"
                                               latitude:40.689481
                                              longitude:-74.044441];
        
        joeIsAmazing = [[FISTrivium alloc] initWithContent:@"Joe is amazing!"
                                                     likes:5];
        markIsJustAlright = [[FISTrivium alloc] initWithContent:@"Mark is just alright."
                                                          likes:1];
        mossIsTheBoss = [[FISTrivium alloc] initWithContent:@"The boss is Moss."
                                                      likes:112358];
        flatiron.trivia = [[NSMutableArray alloc] initWithObjects:joeIsAmazing, markIsJustAlright, mossIsTheBoss, nil];
    });
    
    describe(@"default initializer", ^{
        it(@"should set all properties to default values", ^{
            expect(defaultLocation.name).to.equal(@"");
            expect(defaultLocation.latitude).to.equal(0.0);
            expect(defaultLocation.longitude).to.equal(0.0);
            expect(defaultLocation.trivia).to.equal([[NSMutableArray alloc] init]);
        });
    });
    
    describe(@"designated initializer", ^{
        it(@"should set all properties to submitted values", ^{
            expect(empireState.name).to.equal(@"Empire State Building");
            expect(empireState.latitude).to.equal(40.748729);
            expect(empireState.longitude).to.equal(-73.985779);
            expect(empireState.trivia).to.equal([[NSMutableArray alloc] init]);
        });
    });
    
    describe(@"hasValidData", ^{
        it(@"should return YES for a location with valid data", ^{
            expect([empireState hasValidData]).to.beTruthy();
        });
        
        it(@"should return NO for a latitude greater than 90.0", ^{
            empireState.latitude = 90.01;
            expect([empireState hasValidData]).to.beFalsy();
        });
        
        it(@"should return NO for a latitude less than -90.0", ^{
            empireState.latitude = -90.01;
            expect([empireState hasValidData]).to.beFalsy();
        });
        
        it(@"should return NO for a longitude greater than 180.0", ^{
            empireState.longitude = 180.01;
            expect([empireState hasValidData]).to.beFalsy();
        });
        
        it(@"should return NO for a longitude less than -180.0", ^{
            empireState.longitude = -180.01;
            expect([empireState hasValidData]).to.beFalsy();
        });
        
        it(@"should return NO for a longitude equal to -180.0", ^{
            empireState.longitude = -180.0;
            expect([empireState hasValidData]).to.beFalsy();
        });
        
        it(@"should return NO for a name containing an empty string", ^{
            empireState.name = @"";
            expect([empireState hasValidData]).to.beFalsy();
        });
        
        it(@"should return NO for a name set to 'nil'", ^{
            empireState.name = nil;
            expect([empireState hasValidData]).to.beFalsy();
        });
    });
    
    describe(@"stringByTruncatingNameToLength:", ^{
        it(@"should return a 6-letter substring of the location's name when length equals 6", ^{
            NSString *truncatedName = [empireState stringByTruncatingNameToLength:6];
            expect(truncatedName).to.equal(@"Empire");
        });
        
        it(@"should return an 8-letter substring of the location's name when length equals 8", ^{
            NSString *truncatedName = [flatiron stringByTruncatingNameToLength:8];
            expect(truncatedName).to.equal(@"Flatiron");
        });
        
        it(@"should handle an integer argument that exceeds the length of the location's name", ^{
            NSString *truncatedName = [flatiron stringByTruncatingNameToLength:17];
            expect(truncatedName).to.equal(@"Flatiron School");
        });
    });
    
    describe(@"triviumWithMostLikes", ^{
        it(@"should return 'nil' if the 'trivia' array is empty", ^{
            expect([defaultLocation triviumWithMostLikes]).to.beNil();
        });
        
        it(@"should return the FISTrivium object in the 'trivia' array that has the highest value for the 'likes' property", ^{
            expect([flatiron triviumWithMostLikes]).to.equal(mossIsTheBoss);
        });
    });
});

SpecEnd
