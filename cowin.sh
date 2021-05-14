#/bin/bash
echo "Running on $(date)"
DISTRICT=230
TODAY=$(date +"%d-%m-%Y")
TOKEN="TOKEN_HERE"
curl -s "https://cdn-api.co-vin.in/api/v2/appointment/sessions/calendarByDistrict?district_id=$DISTRICT&date=$TODAY" \
  -H 'authority: cdn-api.co-vin.in' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="90", "Google Chrome";v="90"' \
  -H 'accept: application/json, text/plain, */*' \
  -H "authorization: Bearer $TOKEN" \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36' \
  -H 'origin: https://selfregistration.cowin.gov.in' \
  -H 'sec-fetch-site: cross-site' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://selfregistration.cowin.gov.in/' \
  -H 'accept-language: en-US,en;q=0.9' \
  -H 'if-none-match: W/"511-3B6icBzUI1i0/muoJMs1HQQ4lnw"' \
  --compressed | python3 ~/Desktop/cowin/cowin.py

if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
fi
