//
//  CardMatchingGame.h
//  appGameCarts
//
//  Created by Israel Castaneda Luna on 28/10/23.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
NS_ASSUME_NONNULL_BEGIN

@interface CardMatchingGame : NSObject

//designated initializer
-(instancetype)initWhitCardCount:(NSUInteger)count usingDeck:(Deck *)deck;//inicializa un nuevo juego

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;//obtener carta

@property (nonatomic, readonly) NSInteger score;//marcador
@property (nonatomic, readonly) NSString *coincidencia;//marcador

@end

NS_ASSUME_NONNULL_END
