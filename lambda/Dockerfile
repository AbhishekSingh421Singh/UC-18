FROM public.ecr.aws/lambda/python:3.9

RUN pip install pillow

COPY app.py .

CMD [ "app.lambda_handler" ]