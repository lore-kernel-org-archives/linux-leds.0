From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v3] led/led-class: Handle LEDs with the same name
Date: Mon, 8 Jun 2015 15:55:45 -0700
Message-ID: <CAGXu5jLPRS+0KOcb2g1y_1Yqg-NywshHiujxNghQJ5HdFVWo1Q@mail.gmail.com>
References: <1426287939-7596-1-git-send-email-ricardo.ribalda@gmail.com>
	<20150326233025.GR18321@valkosipuli.retiisi.org.uk>
	<CAPybu_1thjCfz3Xomzpvc3Hpw2j_z8rXpmp28WnuRBDE0DYAtA@mail.gmail.com>
	<CAK5ve-KLmETc1Ym1xvwTuvG7f5O1w6s=u3fgdGcYT8GHCWT+VA@mail.gmail.com>
	<20150328010705.GB3891@wfg-t540p.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-vn0-f54.google.com ([209.85.216.54]:38579 "EHLO
	mail-vn0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932205AbbFHWzq (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 8 Jun 2015 18:55:46 -0400
Received: by vnbf190 with SMTP id f190so273156vnb.5
        for <linux-leds@vger.kernel.org>; Mon, 08 Jun 2015 15:55:46 -0700 (PDT)
In-Reply-To: <20150328010705.GB3891@wfg-t540p.sh.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Bryan Wu <cooloney@gmail.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Sakari Ailus <sakari.ailus@iki.fi>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christopher Li <sparse@chrisli.org>

On Fri, Mar 27, 2015 at 6:07 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> + Kees Cook
>
> On Fri, Mar 27, 2015 at 10:24:53AM -0700, Bryan Wu wrote:
>> On Fri, Mar 27, 2015 at 1:09 AM, Ricardo Ribalda Delgado
>> <ricardo.ribalda@gmail.com> wrote:
>> > Hi Sakari
>> >
>> > cc: adding Greg (core and FormatGuard) and Chistopher (sparse)
>> >>
>> >> I just realised there was another issue --- the name is now interpreted as
>> >> format string. Bad things will happen if there's e.g. %s in the name itself
>> >> --- perhaps unlikely, but possible.
>> >
>> > Good catch!
>> >
>> > Would it be possible to add a sparse check to avoid this in all the kernel?
>> >
>> > And what about a macro protection like FormatGuard?
>> >
>> > https://www.usenix.org/legacy/events/sec01/full_papers/cowanbarringer/cowanbarringer.pdf
>> >
>> >
>>
>> I think Fengguang's 0-DAY kernel test infrastructure can help this.
>
> Kees' format-security branch has a check on dynamic printf format
> string, which has been effective in finding errors like:
>
>    drivers/tty/serial/sb1250-duart.c: In function 'sbd_map_port':
>>> drivers/tty/serial/sb1250-duart.c:680:3: error: format not a string literal and no format arguments [-Werror=format-security]
>       printk(err);
>       ^
>
> I wonder if Kees has the plan to include the patch into upstream and
> make it a kconfig option. For your convenience, the patch is pasted
> below.
>
> Thanks,
> Fengguang
> ---
>
> commit 95420c349194d1b570270ba1b1567d85461761c3
> Author:     Kees Cook <keescook@chromium.org>
> AuthorDate: Mon Sep 16 11:15:54 2013 -0700
> Commit:     Kees Cook <keescook@chromium.org>
> CommitDate: Wed Mar 4 14:07:18 2015 -0800
>
>     Make all format string problems fail the build
>
>     In an effort to stop format strings from leaking into various callers,
>     have gcc stop the build when this gets detected.
>
>     Signed-off-by: Kees Cook <keescook@chromium.org>
>
> diff --git a/Makefile b/Makefile
> index e6a9b1b..b7684d2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -402,7 +402,6 @@ KBUILD_CPPFLAGS := -D__KERNEL__
>  KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
>                    -fno-strict-aliasing -fno-common \
>                    -Werror-implicit-function-declaration \
> -                  -Wno-format-security \
>                    -std=gnu89
>
>  KBUILD_AFLAGS_KERNEL :=
> @@ -752,6 +751,11 @@ endif
>  NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
>  CHECKFLAGS     += $(NOSTDINC_FLAGS)
>
> +# Enable format-security when it can stop the build, otherwise disable.
> +KBUILD_CFLAGS  += $(call cc-option,\
> +                       -Wformat -Wformat-security -Werror=format-security,\
> +                       -Wno-format-security)
> +
>  # warn about C99 declaration after statement
>  KBUILD_CFLAGS += $(call cc-option,-Wdeclaration-after-statement,)
>

The trouble is that gcc still has a terrible time with false positives
on these warnings. It doesn't know to silence const char strings. For
example:

const char * version = "SomeThing driver v1.3\n";
...
printk(version);

We don't care about this, since the string is not dynamic, but gcc
still warns. My intention is that when gcc fixes this bug, then I'd
upstream this patch. Right now I have to carry a patch to silence
false positives. :(

You can see it here:
http://git.kernel.org/cgit/linux/kernel/git/kees/linux.git/log/?h=format-security

-Kees

-- 
Kees Cook
Chrome OS Security
