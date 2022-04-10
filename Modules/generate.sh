cd $(dirname $0)
openapi-generator generate -i "TheNewsAPI.yaml" -g swift5 -o "api-mobile" -c "config.yaml"
rm -r "TheNewsAPI/Sources/TheNewsAPI"
cp -R "api-mobile/OpenAPIClient/Classes/OpenAPIs/." "TheNewsAPI/Sources/TheNewsAPI"
rm -r "api-mobile"

#find . -name "*API.swift" -print0 | xargs -0 sed -i "" -e "s/?.encodeToJSON(),/,/g"
#find . -name "*API.swift" -print0 | xargs -0 sed -i "" -e "s/.encodeToJSON(),/,/g"
find . -path "*/APIs/*API.swift" |
while read i
    do sed -i "" -e "s/?.encodeToJSON(),/,/g" $i
       sed -i "" -e "s/.encodeToJSON(),/,/g" $i
done
