//
//  PlayingCardDeck.m
//  appGameCarts
//
//  Created by Israel Castaneda Luna on 28/10/23.
//
//REPRESENTA 52 CARTAS 
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
@implementation PlayingCardDeck
-(instancetype)init
{
    self = [super init];
    
    if(self) {
        for(NSString *suit in [PlayingCard validSuits] ){
            for(NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++){
                PlayingCard *card = [[PlayingCard alloc]init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
