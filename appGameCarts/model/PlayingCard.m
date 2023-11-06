//
//  PlayingCard.m
//  appGameCarts
//
//  Created by Israel Castaneda Luna on 28/10/23.
//

//CARTA DE JUEGO
#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if([otherCards count] == 1){
        PlayingCard *otherCard = [otherCards firstObject];
        if(otherCard.rank == self.rank){
            score = 4;//Da 4 puntos por igualar el rango.
        } else if([otherCard.suit isEqualToString:self.suit]){
            score = 1;//Y solo 1 punto por combinar el traje..
            /*
             Sólo hay 3 cartas que coincidirán con el rango de una carta determinada, pero 12 coincidirán con su palo, por lo que esto tiene cierto sentido.
             */
        }
    }
    return score;
}
//crea el numero de la carta
-(NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    
}

@synthesize suit = _suit;//directiva


+(NSArray *)validSuits
{
    return @[@"♠︎",@"♣︎",@"♥︎",@"♦︎"];
    
}
//concatena un valor al numero de la carta
-(void)setSuit:(NSString *)suit
{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}
-(NSString *)suit
{
    return _suit ? _suit : @"?";
}

//NUMEROS DE LAS CARTAS
+(NSArray *)rankStrings
{
    return  @[@"?",@"A",@"2",@"3",@"4",@"5",@"6"
              ,@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

//agrege estas 2 cosas
+(NSUInteger)maxRank{
    return [[self rankStrings] count]-1;
}

@end
