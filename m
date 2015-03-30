From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] leds/class: Set naming index as unsigned
Date: Mon, 30 Mar 2015 10:59:47 +0200
Message-ID: <CAMuHMdWxyP=okznpcCi6YROzKkfr8MT9V0vGyEouz68=L1LhTw@mail.gmail.com>
References: <1427705712-18083-1-git-send-email-ricardo.ribalda@gmail.com>
	<1427705712-18083-4-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:35511 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752800AbbC3I7r (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Mar 2015 04:59:47 -0400
In-Reply-To: <1427705712-18083-4-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Mar 30, 2015 at 10:55 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> -       int i = 0;
> +       unsigned int i = 0;

That won't help, as you forgot to replace "%d" by "%u" in the snprintf()
call.

>         int ret = 0;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
