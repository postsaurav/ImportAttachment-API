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
}