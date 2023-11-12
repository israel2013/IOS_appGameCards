//
//  ViewController.m
//  appGameCarts
//
//  Created by Israel Castaneda Luna on 28/10/23.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UILabel *label_coincidencia;
@property (strong,nonatomic)Deck *deck;
@property (strong,nonatomic)CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
- (IBAction)buttonAcerca:(UIButton *)sender;

@end

@implementation ViewController
-(CardMatchingGame *)game
{
    if(!_game) _game = [[CardMatchingGame alloc] initWhitCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}
//-(Deck *)deck{
//    if(! _deck)_deck=[self createDeck];
//    return _deck;
//}
-(Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];
}
- (IBAction)touchCardButton:(UIButton *)sender {
//    if([sender.currentTitle length]){
//        [sender setBackgroundImage:[UIImage imageNamed:@"Back-card-itl"] forState:UIControlStateNormal];
//        [sender setTitle:@"" forState:UIControlStateNormal];
//    }else{
//        Card *randomCard=[self.deck drawRandomCard];
//        if(randomCard){
//            [sender setBackgroundImage:[UIImage imageNamed:@"Blank-card"] forState:UIControlStateNormal];
//            [sender setTitle:randomCard.contents forState:UIControlStateNormal];
//        }
//    }
    //obtenemos el indice la carta que se presiono 
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
   // self.flipCount++;
}
/*
 Actualizar la interfaz de usuario es bastante sencillo.
 Simplemente vamos a recorrer todos los botones de tarjeta y, según la tarjeta correspondiente en nuestro modelo...
 */
-(void)updateUI
{
    for(UIButton *cardButton in self.cardButtons){
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backGroundImageForCard:card] forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;//Si una tarjeta coincidepodemos desactivar el botón de tarjeta correspondiente
        
     
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.game.score ];//Actualizar la puntuación(usando el mismo código que usamos para Flips) cada vez que actualizamos el resto de la interfaz de usuario.
        
        //ponemos en el label cuando exista una coincidencia
        self.label_coincidencia.text=self.game.coincidencia;
        
        // SI EL USUARIO TUVO 5 COINCIDENCIAS SALDRA UN ALERT
        if(self.game.ncoincidencias == 5)
        {
            UIAlertController *alerta=[UIAlertController alertControllerWithTitle:@"GANASTE" message:@"Coincidieron minimo 5 cartas" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action=[UIAlertAction actionWithTitle: @"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];
            [alerta addAction: action];
            [self presentViewController:alerta animated:YES completion:nil];
            //[self.game setNcoincidencias:0];

        }
    }
}
/*
 El título y la imagen de fondo sólo dependen de si la tarjeta es "elegida" (la elegida está boca arriba,
 no elegido está boca abajo).
 */
-(NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backGroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"Blank-card-hd" : @"img_cartaReves2"];
}

//-(void)setFlipCount:(int)flipCount{
//    _flipCount=flipCount;
//    self.flipsLabel.text=[NSString stringWithFormat:@"FLips: %d", self.flipCount];
//    NSLog(@"flipCount changed to %d",self.flipCount);
//}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//}
//-(void)didReceiveMemoryWarning{
//    [super didReceiveMemoryWarning];
//}

- (IBAction)buttonAcerca:(UIButton *)sender {
    UIAlertController *alerta=[UIAlertController alertControllerWithTitle:@"Juego de cartas" message:@"Israel Castaneda Luna" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action=[UIAlertAction actionWithTitle: @"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];
    [alerta addAction: action];
    [self presentViewController:alerta animated:YES completion:nil];
}
@end
