# Begin become
become() {
    eval $(auth "$1" "$2")
}

unbecome() {
    unset AWS_SESSION_TOKEN
    unset AWS_SECRET_ACCESS_KEY
    unset AWS_ACCESS_KEY_ID
}
# End become
