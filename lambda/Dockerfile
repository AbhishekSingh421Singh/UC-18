FROM public.ecr.aws/lambda/python:3.9

# Install dependencies
RUN pip install pillow boto3

# Copy function code
COPY app.py ${LAMBDA_TASK_ROOT}

# Set the CMD to your handler
CMD ["app.handler"]
