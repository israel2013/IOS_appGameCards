//
//  Deck.m
//  appGameCarts
//
//  Created by Israel Castaneda Luna on 28/10/23.
//

#import "Deck.h"
@interface Deck()
@property (strong,nonatomic) NSMutableArray *cards;//almacena las cartas
@end
@implementation Deck
//---------
//me duvuelve las cartas
//si cards es nulo , se le asigna un objeto array
-(NSMutableArray *)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}
//--------
//agrega cartas
//cards siempre valdra un array mutablle
-(void)addCard:(Card *)card atTop:(BOOL)atTop
{
    //insertamos una carta en el arreglo cards
    if(atTop) {
        [self.cards insertObject:card atIndex:0];
    }else {
        [self.cards addObject:card];
    }
}
//-----
-(void)addCard:(Card *)card
    {
            [self.cards addObject:card];
    }
//---------
//toma una carta aleatoria
-(Card *)drawRandomCard
    {
        Card *randomCard = nil;
        if([self.cards count]){
            unsigned index = arc4random() % [self.cards count];
            randomCard = self.cards[index];
            [self.cards removeObjectAtIndex:index];
        }
        return randomCard;
    }

@end
