#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "Parser.h"
#import "ParseItem.h"


SpecBegin(Parser)
    describe(@"Parser", ^{

        describe(@"Digits", ^{

            it(@"should exp a single digit", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:@[
                    [[ParseItem alloc] initWithCharacter:'1'],
                ]];
                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(1);
            });

            it(@"should exp a multiple digits", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:@[
                    [[ParseItem alloc] initWithCharacter:'1'],
                    [[ParseItem alloc] initWithCharacter:'2'],
                    [[ParseItem alloc] initWithCharacter:'3'],
                ]];
                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(123);
            });

        });

        describe(@"Digits and Operators", ^{

            it(@"should parse simple addition", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:@[
                    [[ParseItem alloc] initWithCharacter:'1'],
                    [[ParseItem alloc] initWithCharacter:'+'],
                    [[ParseItem alloc] initWithCharacter:'2'],
                ]];
                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(3);
            });

            it(@"should parse simple subtraction", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:@[
                    [[ParseItem alloc] initWithCharacter:'3'],
                    [[ParseItem alloc] initWithCharacter:'-'],
                    [[ParseItem alloc] initWithCharacter:'1'],
                ]];
                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(2);
            });

        });
    });

SpecEnd
