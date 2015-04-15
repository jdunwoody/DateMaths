#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "Parser.h"
#import "ParseItem.h"
#import "ParserTestUtils.h"

SpecBegin(Parser)

    describe(@"Parser", ^{
        __block ParserTestUtils *parserTestUtils = [[ParserTestUtils alloc] init];

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

        describe(@"Single Digits and Operators", ^{

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

            it(@"should parse simple multiplication", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:@[
                    [[ParseItem alloc] initWithCharacter:'8'],
                    [[ParseItem alloc] initWithCharacter:'*'],
                    [[ParseItem alloc] initWithCharacter:'9'],
                ]];
                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(72);
            });

            it(@"should parse simple division", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:@[
                    [[ParseItem alloc] initWithCharacter:'1'],
                    [[ParseItem alloc] initWithCharacter:'2'],
                    [[ParseItem alloc] initWithCharacter:'/'],
                    [[ParseItem alloc] initWithCharacter:'3'],
                ]];
                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(4);
            });
        });

        describe(@"Multiple Digits", ^{

            it(@"should parse multiple digits", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:@[
                    [[ParseItem alloc] initWithCharacter:'1'],
                    [[ParseItem alloc] initWithCharacter:'2'],
                    [[ParseItem alloc] initWithCharacter:'3'],
                ]];
                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(123);
            });

            it(@"should parse addition of multiple digits", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:@[
                    [[ParseItem alloc] initWithCharacter:'1'],
                    [[ParseItem alloc] initWithCharacter:'2'],
                    [[ParseItem alloc] initWithCharacter:'+'],
                    [[ParseItem alloc] initWithCharacter:'3'],
                    [[ParseItem alloc] initWithCharacter:'4'],
                    [[ParseItem alloc] initWithCharacter:'+'],
                    [[ParseItem alloc] initWithCharacter:'2'],
                ]];
                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(48);
            });

            it(@"should parse multiple and division of multiple digits", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:@[
                    [[ParseItem alloc] initWithCharacter:'1'],
                    [[ParseItem alloc] initWithCharacter:'2'],
                    [[ParseItem alloc] initWithCharacter:'*'],
                    [[ParseItem alloc] initWithCharacter:'2'],
                    [[ParseItem alloc] initWithCharacter:'/'],
                    [[ParseItem alloc] initWithCharacter:'8'],
                ]];
                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(3);
            });

            it(@"should parse multiple operators with of multiple digits", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:@[
                    [[ParseItem alloc] initWithCharacter:'1'],
                    [[ParseItem alloc] initWithCharacter:'2'],
                    [[ParseItem alloc] initWithCharacter:'*'],
                    [[ParseItem alloc] initWithCharacter:'2'],
                    [[ParseItem alloc] initWithCharacter:'-'],
                    [[ParseItem alloc] initWithCharacter:'4'],
                ]];
                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(20);
            });

        });

        describe(@"Parenthesis", ^{

            it(@"should parse with parenthesis", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:@[
                    [[ParseItem alloc] initWithCharacter:'('],
                    [[ParseItem alloc] initWithCharacter:'2'],
                    [[ParseItem alloc] initWithCharacter:'+'],
                    [[ParseItem alloc] initWithCharacter:'3'],
                    [[ParseItem alloc] initWithCharacter:')'],
                    [[ParseItem alloc] initWithCharacter:'*'],
                    [[ParseItem alloc] initWithCharacter:'2'],
                ]];
                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(10);
            });

            it(@"should parse with parenthesis", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:@[
                    [[ParseItem alloc] initWithCharacter:'5'],
                    [[ParseItem alloc] initWithCharacter:'*'],
                    [[ParseItem alloc] initWithCharacter:'('],
                    [[ParseItem alloc] initWithCharacter:'2'],
                    [[ParseItem alloc] initWithCharacter:'+'],
                    [[ParseItem alloc] initWithCharacter:'1'],
                    [[ParseItem alloc] initWithCharacter:')'],
                ]];
                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(15);
            });

            it(@"should parse with parenthesis", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:@[
                    [[ParseItem alloc] initWithCharacter:'('],
                    [[ParseItem alloc] initWithCharacter:'2'],
                    [[ParseItem alloc] initWithCharacter:'+'],
                    [[ParseItem alloc] initWithCharacter:'1'],
                    [[ParseItem alloc] initWithCharacter:')'],
                ]];
                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(3);
            });

            it(@"should parse number in parenthesis", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:[parserTestUtils parseItemsFromString:@"(2)"]];

                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(2);
            });

            it(@"should parse number in parenthesis", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:[parserTestUtils parseItemsFromString:@"(2+1)"]];

                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(3);
            });

            it(@"should parse number in parenthesis", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:[parserTestUtils parseItemsFromString:@"(2*2)"]];

                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(4);
            });

            it(@"should parse a really complex expression", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:[parserTestUtils parseItemsFromString:@"(2+78)/4"]];

                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(20);
            });


            it(@"should parse a really complex expression", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:[parserTestUtils parseItemsFromString:@"(2+78)+4-(2+1)"]];

                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(81);
            });

            it(@"should parse a really complex expression", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:[parserTestUtils parseItemsFromString:@"(2+78)/4*(2+1)"]];

                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(60);
            });

            pending(@"should parse nested parenthesis", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:[parserTestUtils parseItemsFromString:@"3*(2*(3+1))/4/(2)"]];

                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(1);
            });

            it(@"should parse nested parenthesis", ^{
                Parser *parser = [[Parser alloc] initWithParseItems:[parserTestUtils parseItemsFromString:@"2*(3+1)/4/(2)"]];

                double actualTotal = [parser expression];

                expect(actualTotal).to.equal(1);
            });
        });
    });

SpecEnd
