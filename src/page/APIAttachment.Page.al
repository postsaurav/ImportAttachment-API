page 50001 "SDH API Attachment"
{
    PageType = Card;
    SourceTable = "SDH API Attachment";
    Caption = 'API Attachment';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                    ToolTip = 'Stores the Code.';
                }
                field("Base 64 Value"; TextValue)
                {
                    ApplicationArea = All;
                    Caption = 'Base 64 Value';
                    ToolTip = 'Used for inputting Bit 64 value';
                    MultiLine = true;
                }
                field("File Extension"; Rec."File Extension")
                {
                    ApplicationArea = All;
                    Caption = 'File Extension';
                    ToolTip = 'Stores File Extension.';
                }
                field(Attachment; Rec.Attachment)
                {
                    ApplicationArea = All;
                    Caption = 'Attachment';
                    ToolTip = 'stores the attachment.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
        }
    }
    var
        TextValue: Text;
}