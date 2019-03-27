From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 1/6] leds: netdev trigger: use memcpy in
 device_name_store
Date: Wed, 27 Mar 2019 22:45:33 +0100
Message-ID: <0cfbe06c-8d5b-5e94-21d9-15cf7b3ed022@gmail.com>
References: <20190313202615.22883-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-2-linux@rasmusvillemoes.dk>
 <987c3e60-edb3-44f0-be28-434c70bb8659@gmail.com>
 <d1fccd75-c48b-d585-1170-1c1b76e1e098@rasmusvillemoes.dk>
 <21193aab-7880-d116-64e8-dd08afe5a47f@gmail.com>
 <5871d2bd-1a9d-9cf0-e8bd-6d691ea94415@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5871d2bd-1a9d-9cf0-e8bd-6d691ea94415@rasmusvillemoes.dk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 3/27/19 10:31 PM, Rasmus Villemoes wrote:
> On 27/03/2019 22.20, Jacek Anaszewski wrote:
> 
>> Thanks for the heads-up. I must admit I'm hitting into that for the
>> first time. After "git am" it was all OK, but it got screwed up after
>> "git rebase -i". And having "commit.cleanup = scissors" set globally all
>> the time is annoying if one extensively uses interactive rebase for
>> rewording commit messages. It entails the need for manual removal of
>> the whole stuff that appears then after actual commit message prepended
>> with "#" comment characters.
> 
> Eh, no? At least, whenever I do commit or rebase -i, git automatically
> inserts a trailer starting with the magic scissor line
> 
> # ------------------------ >8 ------------------------
> # Do not modify or remove the line above.
> # Everything below it will be ignored.
> 
> Maybe there's some other config option to get that, or it depends on git
> version. But I certainly don't do anything at all other than write or
> modify the commit message.

I don't have this "#-- >8 --" line. Will have to find out the reason.
I'm using git version 2.11.0 btw.

> Never had a problem myself since I set commit.cleanup = scissors, but I
> have had lots of my commit messages mangled, which is why I'm reacting.
> 
>> This is probably the reason why people use often other characters
>> for command prompt (see the other fix for ledtrig-netdev).
> 
> Command prompt char is not the only problem; C snippets with #include or
> other preprocessor directives also regularly gets mangled, as does shell
> snippets with a bit of commentary.

True. I certainly will have to get my git config fixed.

-- 
Best regards,
Jacek Anaszewski
