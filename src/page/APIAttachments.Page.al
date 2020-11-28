page 50003 "SDH API Attachments"
{
    PageType = List;
    Caption = 'API Attachments';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "SDH API Attachment";
    CardPageId = "SDH API Attachment";
    layout
    {
        area(Content)
        {
            repeater(Control)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field("File Extension"; Rec."File Extension")
                {
                    ApplicationArea = All;
                }
                field(Attachment; Rec.Attachment)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Export Attachment")
            {
                ApplicationArea = All;
                Caption = 'Download Attachment';
                Promoted = true;
                PromotedCategory = Process;
                Image = Export;
                trigger OnAction()
                begin
                    rec.ExportAttachment();
                end;
            }
        }
    }
}