# Clone our private GitHub Repository
RUN git clone -b docker https://<token>:x-oauth-basic@github.com/StackPointCloud/myapp.git /myapp/
RUN cp -R /myapp/* /home/app/
RUN chown app:app -R /home/app/
RUN "python3 -m pip -r requirements.txt"
RUN "curl -X POST https://api.flock.com/hooks/sendMessage/d96c1836-8bf4-47f2-b10e-2c7dce866671 -H "Content-Type: application/json" -d '{
"text": "This is a test message"
}'"
