//
//  PlayingCard.h
//  appGameCarts
//
//  Created by Israel Castaneda Luna on 28/10/23.
//

#import "Card.h"


@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;//character de la carta
@property (nonatomic) NSUInteger rank;//representa el numero de la carta 

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;
@end

