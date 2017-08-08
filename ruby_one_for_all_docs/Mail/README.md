# Mail

(from gem mail-2.6.6)
---



























# Mail Envelope

The Envelope class provides a field for the first line in an mbox file, that
looks like "From mikel@test.lindsaar.net DATETIME"

This envelope class reads that line, and turns it into an Envelope.from and
Envelope.date for your use.

encoding: utf-8





# Comments Field

The Comments field inherits from UnstructuredField and handles the Comments:
header field in the email.

Sending comments to a mail message will instantiate a Mail::Field object that
has a CommentsField as its field type.

An email header can have as many comments fields as it wants.  There is no
upper limit, the comments field is also optional (that is, no comment is
needed)

## Examples:

    mail = Mail.new
    mail.comments = 'This is a comment'
    mail.comments    #=> 'This is a comment'
    mail[:comments]  #=> '#<Mail::Field:0x180e5e8 @field=#<Mail::CommentsField:0x180e1c4
    mail['comments'] #=> '#<Mail::Field:0x180e5e8 @field=#<Mail::CommentsField:0x180e1c4
    mail['comments'] #=> '#<Mail::Field:0x180e5e8 @field=#<Mail::CommentsField:0x180e1c4

    mail.comments = "This is another comment"
    mail[:comments].map { |c| c.to_s } 
    #=> ['This is a comment', "This is another comment"]
















keywords        =       "Keywords:" phrase *("," phrase) CRLF




trace           =       [return]
    1*received

return          =       "Return-Path:" path CRLF

path            =       ([CFWS] "<" ([CFWS] / addr-spec) ">" [CFWS]) /
    obs-path

received        =       "Received:" name-val-list ";" date-time CRLF

name-val-list   =       [CFWS] [name-val-pair *(CFWS name-val-pair)]

name-val-pair   =       item-name CFWS item-value

item-name       =       ALPHA *(["-"] (ALPHA / DIGIT))

item-value      =       1*angle-addr / addr-spec /
    atom / domain / msg-id













subject         =       "Subject:" unstructured CRLF




This is an almost cut and paste from ActiveSupport v3.0.6, copied in here so
that Mail itself does not depend on ActiveSupport to avoid versioning
conflicts





















line 10
"/home/bpot/src/gh/bpot/mail/lib/mail/parsers/ragel/ruby/machines/address_list
s_machine.rb.rl"

line 10
"/home/bpot/src/gh/bpot/mail/lib/mail/parsers/ragel/ruby/machines/content_disp
osition_machine.rb.rl"

line 10
"/home/bpot/src/gh/bpot/mail/lib/mail/parsers/ragel/ruby/machines/content_loca
tion_machine.rb.rl"

line 10
"/home/bpot/src/gh/bpot/mail/lib/mail/parsers/ragel/ruby/machines/content_tran
sfer_encoding_machine.rb.rl"

line 10
"/home/bpot/src/gh/bpot/mail/lib/mail/parsers/ragel/ruby/machines/content_type
_machine.rb.rl"

line 10
"/home/bpot/src/gh/bpot/mail/lib/mail/parsers/ragel/ruby/machines/date_time_ma
chine.rb.rl"

line 10
"/Users/raindrift/workspace/mail/lib/mail/parsers/ragel/ruby/machines/envelope
_from_machine.rb.rl"

line 10
"/home/bpot/src/gh/bpot/mail/lib/mail/parsers/ragel/ruby/machines/message_ids_
machine.rb.rl"

line 10
"/home/bpot/src/gh/bpot/mail/lib/mail/parsers/ragel/ruby/machines/mime_version
_machine.rb.rl"

line 10
"/home/bpot/src/gh/bpot/mail/lib/mail/parsers/ragel/ruby/machines/phrase_lists
_machine.rb.rl"

line 10
"/home/bpot/src/gh/bpot/mail/lib/mail/parsers/ragel/ruby/machines/received_mac
hine.rb.rl"






---
# Constants:

RANDOM_TAG
:   [not documented]
RubyVer
:   [not documented]


# Class methods:

    all
    connection
    defaults
    delete_all
    deliver
    delivery_method
    eager_autoload!
    find
    find_and_delete
    first
    inform_interceptors
    inform_observers
    last
    new
    random_tag
    read
    read_from_string
    register_autoload
    register_interceptor
    register_observer
    retriever_method
    something_random
    uniq
    unregister_interceptor
    unregister_observer

# Mail::all

(from gem mail-2.6.6)
---
    all(*args, &block)

---

Receive all emails from the default retriever See Mail::Retriever for a
complete documentation.


# Mail::connection

(from gem mail-2.6.6)
---
    connection(&block)

---


# Mail::defaults

(from gem mail-2.6.6)
---
    defaults(&block)

---

Sets the default delivery method and retriever method for all new Mail
objects. The delivery_method and retriever_method default to :smtp and :pop3,
with defaults set.

So sending a new email, if you have an SMTP server running on localhost is as
easy as:

    Mail.deliver do
      to      'mikel@test.lindsaar.net'
      from    'bob@test.lindsaar.net'
      subject 'hi there!'
      body    'this is a body'
    end

If you do not specify anything, you will get the following equivalent code set
in every new mail object:

    Mail.defaults do
      delivery_method :smtp, { :address              => "localhost",
                               :port                 => 25,
                               :domain               => 'localhost.localdomain',
                               :user_name            => nil,
                               :password             => nil,
                               :authentication       => nil,
                               :enable_starttls_auto => true  }

      retriever_method :pop3, { :address             => "localhost",
                                :port                => 995,
                                :user_name           => nil,
                                :password            => nil,
                                :enable_ssl          => true }
    end

    Mail.delivery_method.new  #=> Mail::SMTP instance
    Mail.retriever_method.new #=> Mail::POP3 instance

Each mail object inherits the default set in Mail.delivery_method, however, on
a per email basis, you can override the method:

    mail.delivery_method :sendmail

Or you can override the method and pass in settings:

    mail.delivery_method :sendmail, { :address => 'some.host' }

You can also just modify the settings:

    mail.delivery_settings = { :address => 'some.host' }

The passed in hash is just merged against the defaults with `merge!` and the
result assigned the mail object.  So the above example will change only the
:address value of the global smtp_settings to be 'some.host', keeping all
other values


# Mail::delete_all

(from gem mail-2.6.6)
---
    delete_all(*args, &block)

---

Delete all emails from the default retriever See Mail::Retriever for a
complete documentation.


# Mail::deliver

(from gem mail-2.6.6)
---
    deliver(*args, &block)

---

Send an email using the default configuration.  You do need to set a default
configuration first before you use self.deliver, if you don't, an appropriate
error will be raised telling you to.

If you do not specify a delivery type, SMTP will be used.

    Mail.deliver do
     to 'mikel@test.lindsaar.net'
     from 'ada@test.lindsaar.net'
     subject 'This is a test email'
     body 'Not much to say here'
    end

You can also do:

    mail = Mail.read('email.eml')
    mail.deliver!

And your email object will be created and sent.


# Mail::delivery_method

(from gem mail-2.6.6)
---
    delivery_method()

---

Returns the delivery method selected, defaults to an instance of Mail::SMTP


# Mail::eager_autoload!

(from gem mail-2.6.6)
---
    eager_autoload!()

---

This runs through the autoload list and explictly requires them for you.
Useful when running mail in a threaded process.

Usage:

    require 'mail'
    Mail.eager_autoload!


# Mail::find

(from gem mail-2.6.6)
---
    find(*args, &block)

---

Find emails from the default retriever See Mail::Retriever for a complete
documentation.


# Mail::find_and_delete

(from gem mail-2.6.6)
---
    find_and_delete(*args, &block)

---

Finds and then deletes retrieved emails from the default retriever See
Mail::Retriever for a complete documentation.


# Mail::first

(from gem mail-2.6.6)
---
    first(*args, &block)

---

Receive the first email(s) from the default retriever See Mail::Retriever for
a complete documentation.


# Mail::inform_interceptors

(from gem mail-2.6.6)
---
    inform_interceptors(mail)

---


# Mail::inform_observers

(from gem mail-2.6.6)
---
    inform_observers(mail)

---


# Mail::last

(from gem mail-2.6.6)
---
    last(*args, &block)

---

Receive the first email(s) from the default retriever See Mail::Retriever for
a complete documentation.


# Mail::new

(from gem mail-2.6.6)
---
    new(*args, &block)

---

Allows you to create a new Mail::Message object.

You can make an email via passing a string or passing a block.

For example, the following two examples will create the same email message:

Creating via a string:

    string = "To: mikel@test.lindsaar.net\r\n"
    string << "From: bob@test.lindsaar.net\r\n"
    string << "Subject: This is an email\r\n"
    string << "\r\n"
    string << "This is the body"
    Mail.new(string)

Or creating via a block:

    message = Mail.new do
      to 'mikel@test.lindsaar.net'
      from 'bob@test.lindsaar.net'
      subject 'This is an email'
      body 'This is the body'
    end

Or creating via a hash (or hash like object):

    message = Mail.new({:to => 'mikel@test.lindsaar.net',
                        'from' => 'bob@test.lindsaar.net',
                        :subject => 'This is an email',
                        :body => 'This is the body' })

Note, the hash keys can be strings or symbols, the passed in object does not
need to be a hash, it just needs to respond to :each_pair and yield each key
value pair.

As a side note, you can also create a new email through creating a
Mail::Message object directly and then passing in values via string, symbol or
direct method calls.  See Mail::Message for more information.

    mail = Mail.new
    mail.to = 'mikel@test.lindsaar.net'
    mail[:from] = 'bob@test.lindsaar.net'
    mail['subject'] = 'This is an email'
    mail.body = 'This is the body'


# Mail::read

(from gem mail-2.6.6)
---
    read(filename)

---

Reads in an email message from a path and instantiates it as a new
Mail::Message


# Mail::read_from_string

(from gem mail-2.6.6)
---
    read_from_string(mail_as_string)

---

Instantiates a new Mail::Message using a string


# Mail::register_autoload

(from gem mail-2.6.6)
---
    register_autoload(name, path)

---


# Mail::register_interceptor

(from gem mail-2.6.6)
---
    register_interceptor(interceptor)

---

You can register an object to be given every mail object that will be sent,
before it is sent.  So if you want to add special headers or modify any email
that gets sent through the Mail library, you can do so.

Your object needs to respond to a single method #delivering_email(mail) which
receives the email that is about to be sent.  Make your modifications directly
to this object.


# Mail::register_observer

(from gem mail-2.6.6)
---
    register_observer(observer)

---

You can register an object to be informed of every email that is sent through
this method.

Your object needs to respond to a single method #delivered_email(mail) which
receives the email that is sent.


# Mail::retriever_method

(from gem mail-2.6.6)
---
    retriever_method()

---

Returns the retriever method selected, defaults to an instance of Mail::POP3


# Mail::unregister_interceptor

(from gem mail-2.6.6)
---
    unregister_interceptor(interceptor)

---

Unregister the given interceptor, allowing mail to resume operations without
it.


# Mail::unregister_observer

(from gem mail-2.6.6)
---
    unregister_observer(observer)

---

Unregister the given observer, allowing mail to resume operations without it.


# Mail::random_tag

(from gem mail-2.6.6)
---
    random_tag()

---


# Mail::something_random

(from gem mail-2.6.6)
---
    something_random()

---


# Mail::uniq

(from gem mail-2.6.6)
---
    uniq()

---


