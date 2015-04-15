#import <Specta/Specta.h>
#import <Expecta/Expecta.h>

SpecBegin(Expression)

    describe(@"Expression", ^{

        it(@"should exp a single digit", ^{
            NSExpression *expression = [NSExpression expressionWithFormat:@"4 * (3-1) + (5 * 3 - (1 + 2))"];
            id value = [expression expressionValueWithObject:nil context:nil];

            expect(value).to.equal(20);

        });

    });

SpecEnd
