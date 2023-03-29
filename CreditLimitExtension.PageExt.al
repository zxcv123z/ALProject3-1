pageextension 50130 CreditLimitExtension extends "Customer Card"
{
    actions
    {
        // Add changes to page actions here
        addAfter("F&unctions")
        {
            group(ActionItems)
            {
                action(UpdateCreditLimit)
                {
                    ApplicationArea = All;
                    Caption = 'Update Credit Limit';
                    Image = CalculateCost;
                    trigger OnAction()
                    begin
                        CallUpdateLimit();
                    end;
                }                
            }

        }
    }
    local procedure CallUpdateLimit()
    var
        CreditLimitCalculated: Decimal;
        CreditLimitActual: Decimal;
    begin
        CreditLimitCalculated := Rec.CalculateCreditLimit();
        if CreditLimitCalculated = Rec."Credit Limit (LCY)" then begin
            Message(CreditLimitUpToDateTxt);
            exit;
        end;

        if GuiAllowed() then
            if not Confirm(AreYouSureQst, false, Rec.FieldCaption("Credit Limit (LCY)"),CreditLimitCalculated) then
                exit;

        CreditLimitActual := CreditLimitCalculated;
        Rec.UpdateCreditLimit(CreditLimitActual);
        if CreditLimitActual <> CreditLimitCalculated then
            Message(CreditLimitROundedTxt, CreditLimitActual);
    end;
    var
        AreYouSureQst: Label 'Are you sure that you want to set the %1 to %2?';
        CreditLimitRoundedTxt: Label 'The credit limit was rounded to %1 to comply with company policies.';
        CreditLimitUpToDateTxt: Label 'The credit limit is up to date.';
}