function command_ping {
    helptext="Test connection" # shellcheck disable=SC2034

    if ! is_connected; then
        print_text 'Not connected'
        return 1
    fi

    echo -e 'ping\n' >&3
    print_client_text "ping"
}

