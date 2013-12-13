# hehe

## Introduction
Hehe, not [Bantu language](http://en.wikipedia.org/wiki/Hehe_language), is the encrypt program and security mechanism that allows you to put password on the Internet.

## How it works
Take my proxy configuation for example, the config.json looks like:

    {
        "server":["106.187.93.241"],
        "server_port":15216,
        "local_port":1080,
        "password":"oh_my_password",
        "timeout":60,
        "method":"aes-256-cfb"
    }
	
You may notice that my password is exposed, but I hope to put all my configurations on github while not remembering the password. That's the common suitiation and Hehe gives you an elegant solution:

1. First you need a universal [passphrase](http://en.wikipedia.org/wiki/Passphrase) to encrypt your password.
2. Then replace the real password with your generated password, and rename your file with suffix ".hehe"
3. For me, I get the config.json.hehe which looks like below.
<pre><code>
    {
        "server":["106.187.93.241"],
        "server_port":15216,
        "local_port":1080,
        "password":"heilkaklmthe",
        "timeout":60,
        "method":"aes-256-cfb"
    }
</code></pre>	
4. Now it's safe to upload on github and nobody can figure out what your password is(the encrypt algorithm [RSA](http://en.wikipedia.org/wiki/RSA_(algorithm)) is irreversible even though the program is open source).
5. So when you checkout the file from github, you can use the `hehe` tool to restore your password and automatically generate the original file without suffix ".hehe".
6. All can be done without manual control. Checkout your configurations from github, make the soft link and `hehe` to generate the uncrypted files.

## Usage
encrypt the password:

    hehe "the passphrase i always remember" "the password"

restore the hehe file:

    hehe "the passphrase i always remember" config.json.hehe
	# generate uncrypted config.json
						
## Who use this
* [tobegit3hub](https://github.com/tobegit3hub)
* (Will you be the next...)
