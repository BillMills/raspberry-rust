FROM rust:1.56.1 AS rust
RUN rustup target add arm-unknown-linux-musleabihf
RUN apt-get update && apt-get -y install gcc-arm-linux-gnueabihf
WORKDIR /app
COPY Cargo.toml .
COPY config ./.cargo/config
COPY src ./src
RUN cargo build --release --target arm-unknown-linux-musleabihf

FROM --platform=linux/arm alpine:3.12
WORKDIR /app
COPY --from=rust /app/target/arm-unknown-linux-musleabihf/release/hello ./
