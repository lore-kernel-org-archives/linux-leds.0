From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] led/led-class: Handle LEDs with the same name
Date: Fri, 26 Jun 2015 11:19:16 +0200
Message-ID: <CAMuHMdUPO+W=Fs+F1vo9+2EqRargK-XXO7+L=k5U8NXP=BHiEg@mail.gmail.com>
References: <1426287939-7596-1-git-send-email-ricardo.ribalda@gmail.com>
	<20150326233025.GR18321@valkosipuli.retiisi.org.uk>
	<CAPybu_1thjCfz3Xomzpvc3Hpw2j_z8rXpmp28WnuRBDE0DYAtA@mail.gmail.com>
	<CAK5ve-KLmETc1Ym1xvwTuvG7f5O1w6s=u3fgdGcYT8GHCWT+VA@mail.gmail.com>
	<20150328010705.GB3891@wfg-t540p.sh.intel.com>
	<CAGXu5jLPRS+0KOcb2g1y_1Yqg-NywshHiujxNghQJ5HdFVWo1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:33018 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751685AbbFZJTR (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 26 Jun 2015 05:19:17 -0400
In-Reply-To: <CAGXu5jLPRS+0KOcb2g1y_1Yqg-NywshHiujxNghQJ5HdFVWo1Q@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: Fengguang Wu <fengguang.wu@intel.com>, Bryan Wu <cooloney@gmail.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Sakari Ailus <sakari.ailus@iki.fi>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christopher Li <sparse@chrisli.org>

On Tue, Jun 9, 2015 at 12:55 AM, Kees Cook <keescook@chromium.org> wrote:
>> commit 95420c349194d1b570270ba1b1567d85461761c3
>> Author:     Kees Cook <keescook@chromium.org>
>> AuthorDate: Mon Sep 16 11:15:54 2013 -0700
>> Commit:     Kees Cook <keescook@chromium.org>
>> CommitDate: Wed Mar 4 14:07:18 2015 -0800
>>
>>     Make all format string problems fail the build
>>
>>     In an effort to stop format strings from leaking into various callers,
>>     have gcc stop the build when this gets detected.
>>
>>     Signed-off-by: Kees Cook <keescook@chromium.org>
>>
>> diff --git a/Makefile b/Makefile
>> index e6a9b1b..b7684d2 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -402,7 +402,6 @@ KBUILD_CPPFLAGS := -D__KERNEL__
>>  KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
>>                    -fno-strict-aliasing -fno-common \
>>                    -Werror-implicit-function-declaration \
>> -                  -Wno-format-security \
>>                    -std=gnu89
>>
>>  KBUILD_AFLAGS_KERNEL :=
>> @@ -752,6 +751,11 @@ endif
>>  NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
>>  CHECKFLAGS     += $(NOSTDINC_FLAGS)
>>
>> +# Enable format-security when it can stop the build, otherwise disable.
>> +KBUILD_CFLAGS  += $(call cc-option,\
>> +                       -Wformat -Wformat-security -Werror=format-security,\
>> +                       -Wno-format-security)
>> +
>>  # warn about C99 declaration after statement
>>  KBUILD_CFLAGS += $(call cc-option,-Wdeclaration-after-statement,)
>>
>
> The trouble is that gcc still has a terrible time with false positives
> on these warnings. It doesn't know to silence const char strings. For
> example:
>
> const char * version = "SomeThing driver v1.3\n";

While the contents of the string are const, the pointer isn't...

> ...
> printk(version);

... hence gcc cannot be sure version hasn't been changed to point
to something different.

> We don't care about this, since the string is not dynamic, but gcc
> still warns. My intention is that when gcc fixes this bug, then I'd
> upstream this patch. Right now I have to carry a patch to silence
> false positives. :(

Does it help if you change it to:

    const char * const version = "SomeThing driver v1.3\n";

???

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
