FROM python:3.9.0

WORKDIR /home/

RUN echo 'asdf'

RUN git clone https://github.com/PR-Juyoung/GJAI_web_stu.git

WORKDIR /home/GJAI_web_stu/

RUN echo "SECRET_KEY='django-insecure-7r!g#!@ms7-q*5qzba+)2d2dpil!l1+xi)msz$i^m+ithl%w#5'" > .env

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN python manage.py migrate

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["gunicorn", "GJAI_web_2.wsgi", "--bind", "0.0.0.0:8000"]