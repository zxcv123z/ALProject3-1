page 50111 "Expressions Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Expressions Card';
    
    layout
    {
        area(Content)
        {
            group(Input)
            {
                Caption = 'Input';
                field(Value1; Value1)
                {
                    ApplicationArea = All;
                    Caption = 'Value1';
                }
                field(Value2; Value2)
                {
                    ApplicationArea = All;
                    caption = 'Value2';
                }
            }
            group(Output)
            {
                Caption = 'Output';
                field(Result; Result)
                {
                    ApplicationArea = All;
                    Caption = 'Result';
                    Editable = false;
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(Execute)
            {
                ApplicationArea = All;
                Caption = 'Execute';
                Image = ExecuteBatch;
                trigger OnAction()
                begin
                    Result := Value1 > Value2;
                end;
            }
        }
    }
    
    var
        Value1: Integer;
        Value2: Integer;
        Result: Boolean;
}