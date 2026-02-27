FROM alpine:latest

# V2Ray core ကို install လုပ်မယ်
RUN apk add --no-cache curl unzip
RUN curl -L -o /tmp/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip /tmp/v2ray.zip -d /usr/bin && \
    chmod +x /usr/bin/v2ray && \
    rm /tmp/v2ray.zip

WORKDIR /etc/v2ray
COPY config.json .

# Wasmer အတွက် port ဖွင့်ပေးမယ်
EXPOSE 3000

CMD ["v2ray", "run", "-config", "config.json"]
