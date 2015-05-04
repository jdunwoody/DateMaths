#import "DataItemView.h"
#import <Specta/Specta.h>
#import "LevelItem.h"
#import "Digit.h"
#import <Expecta/Expecta.h>
#import "NumberWrappingLayoutCalculator.h"
#import "Operator.h"

SpecBegin(NumberWrappingLayoutCalculator)

    describe(@"NumberWrappingLayoutCalculator", ^{
        describe(@"calculate", ^{

            describe(@"Single Row", ^{

                it(@"should layout on one row", ^{
                    Digit *digit1 = [[Digit alloc] initWithDigit:1];
                    Digit *digit2 = [[Digit alloc] initWithDigit:2];

                    NSArray *items = @[
                        digit1,
                        digit2,
                    ];

                    CGSize size = CGSizeMake(0.0, 100.0);
                    NumberWrappingLayoutCalculator *calculator = [[NumberWrappingLayoutCalculator alloc] init];

                    [calculator calculateLayoutSizesForDataItems:items inSize:size];
                    NSArray *dataItems = calculator.dataItems;

                    expect(dataItems.count).to.equal(2);
                    expect(((DataItemView *)dataItems[0]).rect).to.equal(CGRectMake(0.0, 0.0, 50.0, 50.0));
                    expect(((DataItemView *)dataItems[1]).rect).to.equal(CGRectMake(50.0, 0.0, 50.0, 50.0));
                });

            });

            describe(@"Multiple Row", ^{

                it(@"should split digits and operators", ^{
                    Digit *digit1 = [[Digit alloc] initWithDigit:1.0];
                    Operator *anOperator = [[Operator alloc] initWithSymbol:@"+"];

                    Digit *digit2 = [[Digit alloc] initWithDigit:2.0];
                    NSArray *items = @[
                        digit1,
                        anOperator,
                        digit2,
                    ];

                    CGSize size = CGSizeMake(100.0, 100.0);

                    NumberWrappingLayoutCalculator *calculator = [[NumberWrappingLayoutCalculator alloc] init];
                    [calculator calculateLayoutSizesForDataItems:items inSize:size];
                    NSArray *calculated = calculator.dataItems;

                    expect(calculated.count).to.equal(3);
                    expect(((DataItemView *)calculated[0]).rect).to.equal(CGRectMake(0, 0, 50, 50));
                    expect(((DataItemView *)calculated[1]).rect).to.equal(CGRectMake(50.0, 0, 50, 50));
                    expect(((DataItemView *)calculated[2]).rect).to.equal(CGRectMake(0, 50.0, 50, 50));
                });

                it(@"should not split digits, wrapping them to the next line", ^{
                    Digit *digit1 = [[Digit alloc] initWithDigit:1.0];
                    Operator *anOperator = [[Operator alloc] initWithSymbol:@"+"];
                    Digit *digit2 = [[Digit alloc] initWithDigit:2.0];
                    Digit *digit3 = [[Digit alloc] initWithDigit:3.0];
                    NSArray *items = @[
                        digit1,
                        anOperator,
                        digit2,
                        digit3,
                    ];

                    CGSize size = CGSizeMake(150.0, 100.0);

                    NumberWrappingLayoutCalculator *calculator = [[NumberWrappingLayoutCalculator alloc] init];
                    [calculator calculateLayoutSizesForDataItems:items inSize:size];
                    NSArray *calculated = calculator.dataItems;

                    expect(calculated.count).to.equal(4);
                    expect(((DataItemView *)calculated[0]).rect).to.equal(CGRectMake(0, 0, 50, 50));
                    expect(((DataItemView *)calculated[1]).rect).to.equal(CGRectMake(50.0, 0, 50, 50));
                    expect(((DataItemView *)calculated[2]).rect).to.equal(CGRectMake(0, 50.0, 50, 50));
                    expect(((DataItemView *)calculated[3]).rect).to.equal(CGRectMake(50.0, 50.0, 50, 50));
                });

                it(@"should split digits when whole number wont fit on entire row", ^{
                    Digit *digit1 = [[Digit alloc] initWithDigit:1.0];
                    Operator *anOperator = [[Operator alloc] initWithSymbol:@"+"];
                    Digit *digit2 = [[Digit alloc] initWithDigit:2.0];
                    Digit *digit3 = [[Digit alloc] initWithDigit:3.0];
                    Digit *digit4 = [[Digit alloc] initWithDigit:4.0];
                    Digit *digit5 = [[Digit alloc] initWithDigit:5.0];
                    NSArray *items = @[
                        digit1,
                        anOperator,
                        digit2,
                        digit3,
                        digit4,
                        digit5,
                    ];

                    CGSize size = CGSizeMake(150.0, 100.0);

                    NumberWrappingLayoutCalculator *calculator = [[NumberWrappingLayoutCalculator alloc] init];
                    [calculator calculateLayoutSizesForDataItems:items inSize:size];
                    NSArray *calculated = calculator.dataItems;

                    expect(((DataItemView *)calculated[0]).rect).to.equal(CGRectMake(0, 0, 50, 50));
                    expect(((DataItemView *)calculated[1]).rect).to.equal(CGRectMake(50, 0, 50, 50));
                    expect(((DataItemView *)calculated[2]).rect).to.equal(CGRectMake(100, 0, 50, 50));
                    expect(((DataItemView *)calculated[3]).rect).to.equal(CGRectMake(0, 0, 50, 50));
                    expect(((DataItemView *)calculated[4]).rect).to.equal(CGRectMake(50, 50, 50, 50));
                    expect(((DataItemView *)calculated[5]).rect).to.equal(CGRectMake(0, 100, 50, 50));
                });
            });
        });
    });

SpecEnd;
