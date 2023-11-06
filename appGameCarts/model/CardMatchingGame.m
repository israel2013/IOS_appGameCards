//
//  CardMatchingGame.m
//  appGameCarts
//
//  Created by Israel Castaneda Luna on 28/10/23.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,readwrite) NSString *coincidencia;

@property (nonatomic, strong) NSMutableArray *cards;
@end
@implementation CardMatchingGame

-(NSMutableArray *)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}
-(instancetype)initWhitCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if(self){
        for(int i = 0; i< count; i++){
            Card *card =[deck drawRandomCard];
            [self.cards addObject:card];
        }
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index<[self.cards count]) ? self.cards[index]:nil;
}
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;

static const int COST_TO_CHOOSE = 1;


-(void)chooseCardAtIndex:(NSUInteger)index
{
    
    Card *card = [self cardAtIndex:index];
    //elegimos cartas que no coincidan, una vez coinciden y quedan fuera del juego
    if(!card.isMatched) {
        if(card.isChosen) {
            card.chosen = NO;
        } else {//comparamos con otra carta seleccionada

            //match against oother chosen cards
            
            
//            Así que simplemente recorreremos todas las cartas del juego, buscando las que no coincidan y ya estén elegidas.
            for(Card *otherCard in self.cards){
               // Si encontramos otra carta elegida que no coincide, comprobamos si coincide con la carta recién elegida.
               // usando tarjeta
                if(otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    /*
                     othercard
                     coincidencia: toma un NSArray de otras tarjetas en caso de que una subclase pueda coincidir con varias tarjetas.
                     Dado que nuestro juego de combinación es solo de 2 cartas, simplemente creamos una matriz con una carta.
                     */
                    /*
                     Si hay una coincidencia (de cualquier tipo), ¡aumenta nuestra puntuación!
                     De lo contrario, se impondrá una penalización por elegir cartas que no coincidan.
                     */
                    if(matchScore){
                        self.score += matchScore *MATCH_BONUS;//Incluso podemos dar un bono a los partidos si queremos.
                        //Si coincide, marca ambos.tarjetas coincidentes como coincidentes
                        self.coincidencia = @"Coincidencia 🎖";
                        
                         
                        otherCard.matched =YES;
                        card.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;//Si no coincide, “deselige” la otra tarjeta que no coincide
                        self.coincidencia = @"No coincide ❌";
                        /*
                         Si permitimos más de 2 coincidencias de cartas, es posible que no necesariamente hagamos esto. También se podría imaginar deseleccionar ambas cartas que no coinciden,
                         pero eso requeriría un retraso para no elegir el segundo y realmente no hemos aprendido cómo animar retrasos en la interfaz de usuario de esa manera, de ahí
                         
                         */
                    }
                    //Dado que solo permitimos hacer coincidir 2 cartas y hemos encontrado 2 cartas elegidas en este punto, podemos salir del bucle for.
                    break; //can only choose 2 cards for now
                    
                }
            }
            self.score -= COST_TO_CHOOSE;//Hagamos que elegir cartas no sea “gratuito” imponiendo un coste para elegir.
            card.chosen = YES;//marcamos como elegida
        }
    }
    
}

@end
