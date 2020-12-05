page 50002 APIAttachment
{
    PageType = API;
    Caption = 'apiattachments';
    APIVersion = 'v1.0';
    APIPublisher = 'sauravdhyani';
    APIGroup = 'demo';
    EntityName = 'apiattachment';
    EntitySetName = 'apiattachments';
    ODataKeyFields = SystemId;
    SourceTable = "SDH API Attachment";
    Extensible = false;
    DelayedInsert = true;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; rec.SystemId)
                {
                    ApplicationArea = All;
                    Caption = 'id';
                    Editable = false;
                }
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                }
                field("Extension"; Rec."File Extension")
                {
                    ApplicationArea = All;
                    Caption = 'File Extension';
                }
                field(InputText; InputText)
                {
                    ApplicationArea = All;
                    Caption = 'Bit64';

                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        IF InputText <> '' THEN
                            Rec.ImportAttachment(InputText)
                        Else
                            Error('No Bith 64 value.');
                    end;
                }
            }
        }
    }
    var
        InputText: Text;
}
