#!/bin/bash

# 파일들이 저장되어 있는 디렉터리
FILE_DIR="./files"

# 폴더들이 위치한 디렉터리
FOLDER_DIR="."

# files 폴더 내 모든 .txt 파일들을 순회
for file in "$FILE_DIR"/*.txt; do
    if [ -f "$file" ]; then
        # 파일명의 첫 번째 문자를 추출하고 소문자로 변환
        first_char=$(basename "$file" | cut -c 1 | tr '[:upper:]' '[:lower:]')
        
        # 해당 문자로 시작하는 폴더가 존재하는 경우 파일을 이동
        if [ -d "$FOLDER_DIR/$first_char" ]; then
            mv "$file" "$FOLDER_DIR/$first_char/"
        # 만약 존재하지 않는 경우 에러 메시지 반환
        else
            echo "Error: Directory $FOLDER_DIR/$first_char does not exist!"
        fi
    fi
done

#폴더들이 모여있는 -main 작업환경에서 실행 시 정렬되는 것 확인 완료 0920