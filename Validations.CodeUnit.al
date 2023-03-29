codeunit 50111 Validations
{
    local procedure CheckForPlusSign(TexToVerify: Text)
    var
        myInt: Integer;
    begin
        if (StrPos(TexToVerify, '+') > 0) then 
        begin
            Message('Plus sign found');
        end;
    end;
    [EventSubscriber(ObjectType::Page, Page::"Customer Card", 'OnBeforeValidateEvent', 'Address', false, false)]
    local procedure OnBeforeValidateAddress(Rec: Record Customer; xRec: Record Customer)
    begin
       CheckForPlusSign(Rec.Address);         
    end;
}