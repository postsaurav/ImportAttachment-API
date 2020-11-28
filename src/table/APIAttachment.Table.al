table 50001 "SDH API Attachment"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(2; "File Extension"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(3; Attachment; Blob)
        {
            DataClassification = CustomerContent;
            SubType = Bitmap;
        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
    procedure ImportAttachment(Textvalue: Text)
    var
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        TempOutstream: OutStream;
        Recref: RecordRef;
    begin
        If Textvalue = '' Then
            exit;
        Recref.Open(Database::"SDH API Attachment");
        Recref.GetTable(Rec);
        TempBlob.CreateOutStream(TempOutstream);
        Base64Convert.FromBase64(Textvalue, TempOutstream);

        TempBlob.ToRecordRef(Recref, Rec.FieldNo(Attachment));
        Recref.SetTable(Rec);
        Recref.Close();
    end;

    procedure ExportAttachment()
    var
        IStream: InStream;
        ExportFileName: Text;
    begin
        ExportFileName := Rec.code + '.' + Rec."File Extension";
        Rec.CalcFields(Attachment);
        If Not Rec.Attachment.HasValue then
            exit;
        Rec.Attachment.CreateInStream(IStream);
        DownloadFromStream(IStream, '', '', '', ExportFileName);
    end;
}