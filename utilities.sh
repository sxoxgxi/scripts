generate_password() {
    local length=$1
    local char_set='A-Za-z0-9!@#$%^&*()-_=+[]{}|;:,.<>?'
    tr -dc "$char_set" < /dev/urandom | head -c "$length"
    echo
}
