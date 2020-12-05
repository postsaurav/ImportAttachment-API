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
                field(In64bitValue; In64bitValue)
                {
                    ApplicationArea = All;
                    Caption = 'Bit64';

                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        IF In64bitValue <> '' THEN
                            Rec.ImportAttachment(In64bitValue)
                        Else
                            Error('No Bith 64 value.');
                    end;
                }
                field(Out64bitValue; Out64bitValue)
                {
                    ApplicationArea = All;
                    Caption = '64-Bit Out';
                }
            }
        }
    }
    var
        In64bitValue: Text;
        Out64bitValue: Text;

    trigger OnAfterGetRecord()
    begin
        Out64bitValue := Rec.ConvertedTo64Value();
    end;
}
