FROM --platform=linux/amd64 python:3.8-slim-buster as build 

# RUN apt-get update && apt-get install -y build-essential python3-dev

# 작업 디렉터리 설정
WORKDIR /usr/src/app 
#의존성 설치
COPY requirements.txt ./ 

RUN pip install django
RUN pip install djangorestframework
#전체 소스 복사 
COPY . . 
#포트 노출
EXPOSE 80 
#Django 서버 실행
CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]