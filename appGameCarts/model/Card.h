//
//  Card.h
//  appGameCarts
//
//  Created by Israel Castaneda Luna on 28/10/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Card : NSObject
@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;
@end

NS_ASSUME_NONNULL_END
