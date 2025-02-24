URL=http://172.18.0.2:9000
BUCKET=lasegunda
KEY=readme
FILE=README.md

aws --endpoint-url $URL s3api put-object \
    --bucket $BUCKET \
    --key $KEY \
    --body $FILE