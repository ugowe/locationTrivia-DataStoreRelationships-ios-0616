//  FISTrivium.h

#import <Foundation/Foundation.h>

@interface FISTrivium : NSObject

@property (strong, nonatomic) NSString *content;
@property (nonatomic) NSUInteger likes;

- (instancetype)initWithContent:(NSString *)content
                          likes:(NSUInteger)likes;

@end
