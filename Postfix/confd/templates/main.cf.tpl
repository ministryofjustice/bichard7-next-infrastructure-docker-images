soft_bounce = no
queue_directory = /var/spool/postfix
command_directory = /usr/sbin
daemon_directory = /usr/libexec/postfix
data_directory = /var/lib/postfix
mail_owner = postfix
myhostname = {{ getv "/cjsm/mail/hostname" "localhost.localdomain" }}
mydomain = {{ getv "/cjsm/mail/domain" "localdomain" }}
#myorigin = $myhostname
#myorigin = $mydomain
inet_interfaces = all
inet_protocols = all

mydestination = $myhostname localhost.$mydomain localhost eu-west-2.compute.internal
unknown_local_recipient_reject_code = 550
mynetworks = {{ getv "/cjsm/allowed/cidrs" "" }} {{ getv "/cjsm/postfix/cidrs" "" }} 127.0.0.0/8
relay_domains = $mydestination
relayhost = {{ getv "/cjsm/hostname" "localhost" }}:4545

#relay_recipient_maps = hash:/etc/postfix/relay_recipients
#in_flow_delay = 1s
alias_maps = hash:/etc/aliases
alias_database = hash:/etc/aliases
#recipient_delimiter = +
#home_mailbox = Maildir/
#mail_spool_directory = /var/spool/mail
#mailbox_command = /some/where/procmail -a "$EXTENSION"
# mailbox_transport = lmtp:unix:/var/lib/imap/socket/lmtp
# local_destination_recipient_limit = 300
# local_destination_concurrency_limit = 5
#mailbox_transport = cyrus
#fallback_transport =
#luser_relay = admin+$local
#header_checks = regexp:/etc/postfix/header_checks
#fast_flush_domains = $relay_domains
#smtpd_banner = $myhostname ESMTP $mail_name
#smtpd_banner = $myhostname ESMTP $mail_name ($mail_version)
#local_destination_concurrency_limit = 2
#default_destination_concurrency_limit = 20
debug_peer_level = 2
#debug_peer_list = 127.0.0.1
#debug_peer_list = some.domain
debugger_command = PATH=/bin:/usr/bin:/usr/local/bin:/usr/X11R6/bin ddd $daemon_directory/$process_name $process_id & sleep 5
sendmail_path = /usr/sbin/sendmail.postfix
newaliases_path = /usr/bin/newaliases.postfix
mailq_path = /usr/bin/mailq.postfix
setgid_group = postdrop
html_directory = no
manpage_directory = /usr/share/man
readme_directory = /usr/share/doc/postfix-2.10.1/README_FILES

# TLS Config
tls_random_source = dev:/dev/urandom
smtp_tls_key_file = /etc/pki/tls/private/postfix.pem
smtp_tls_cert_file = /etc/pki/tls/certs/postfix.crt
smtp_tls_CAfile = /etc/pki/ca-trust/source/anchors/cjsm_root_cert.pem
smtp_tls_security_level = may
smtp_tls_note_starttls_offer = yes
smtp_tls_mandatory_protocols=!SSLv2,!SSLv3
smtp_tls_protocols=!SSLv2,!SSLv3
smtp_tls_loglevel = 1
smtp_tls_session_cache_database = btree:/var/lib/postfix/smtp_tls_session_cache
smtp_sasl_auth_enable = yes
smtp_sasl_security_options = noanonymous
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_use_tls = yes
smtpd_sasl_path = smtpd
smtpd_relay_restrictions = permit_mynetworks, reject
# END TLS Config
