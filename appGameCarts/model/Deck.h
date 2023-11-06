//
//  Deck.h
//  appGameCarts
//
//  Created by Israel Castaneda Luna on 28/10/23.
//

//ESTA CLASE REPRESENTA UNA BARAJA DE CARTAS
#import <Foundation/Foundation.h>
#import "Card.h"
NS_ASSUME_NONNULL_BEGIN

@interface Deck : NSObject

//AGREGA UNA CARTA
-(void)addCard:(Card *)card atTop:(BOOL)atTop;

//DEVUELVE UNA CARTA
-(void)addCard:(Card *)card;

-(Card *)drawRandomCard;

@end

NS_ASSUME_NONNULL_END
