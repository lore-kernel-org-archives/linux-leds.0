From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH v3] led/led-class: Handle LEDs with the same name
Date: Mon, 30 Mar 2015 10:35:10 +0200
Message-ID: <CAPybu_06RGNvEqfyy7RNmbzuDjRMjGim1RuB_VuHCbr0PicbbQ@mail.gmail.com>
References: <1426287939-7596-1-git-send-email-ricardo.ribalda@gmail.com> <CAMuHMdUKos-vWP0Ok0=a7B2g5EjnRH12hqS0vm2wUDgu-b0QHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:37176 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753201AbbC3Ifc (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Mar 2015 04:35:32 -0400
In-Reply-To: <CAMuHMdUKos-vWP0Ok0=a7B2g5EjnRH12hqS0vm2wUDgu-b0QHQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hello Geert:

Thanks for your comments!

On Mon, Mar 30, 2015 at 9:59 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> What's the maximum length of init_name?

It is "driver defined", this is why the initial patch used kasprintf,
but the Maintainer preferred to avoid the memory handling.

> strncpy() is _not_ guaranteed to zero-terminate the destination buffer.

Good catch. I will fix this.

>
> There are two ways to fix this:
>   1. Use strlcpy() instead of strncpy(),
>   2. Explicitly set name[len-1] to 0 after the call to strncpy().
>
> As we don't need the "security" feature of strncpy() that fills the remaining
> part of the buffer with zeroes, I think using strlcpy() is the best solution.
>
>> +       while (class_find_device(leds_class, NULL, name, match_name))
>> +               snprintf(name, len, "%s_%d", init_name, ++i);
>
> This will become an infinite loop once the resulting string no longer fits in
> the target buffer. Hence the loop should be terminated, and an error code
> should be returned, once snprintf() returns a value >= len.
>

Will send a patch right away. Thanks

>> +
>> +       return i;
>> +}
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds



-- 
Ricardo Ribalda
