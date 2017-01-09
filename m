From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1 RFC] gpio: Pass GPIO label down to gpiod_request when
 using get_gpiod_from_child
Date: Mon, 9 Jan 2017 15:53:06 +0100
Message-ID: <CACRpkdb1gyXH0+O6P5scVD5_go07fbc3ydp61rG=7CypdXvJ2A@mail.gmail.com>
References: <20161215085321.20337-1-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:32791 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758176AbdAIOxI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Jan 2017 09:53:08 -0500
Received: by mail-qt0-f181.google.com with SMTP id v23so137507215qtb.0
        for <linux-leds@vger.kernel.org>; Mon, 09 Jan 2017 06:53:07 -0800 (PST)
In-Reply-To: <20161215085321.20337-1-alexander.stein@systec-electronic.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Pavel Machek <pavel@ucw.cz>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On Thu, Dec 15, 2016 at 9:53 AM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:

> Currently all users of fwnode_get_named_gpiod() have no way to specify a
> label for the GPIO. So GPIOs listed in debugfs are shown with label "?".
> With this change a proper label is used.
> Also adjust all users so they can pass a label, properly retrieved from
> device tree properties.
>
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
> ---
> This patchset addresses the problem described in
> https://www.spinics.net/lists/linux-leds/msg07233.html
>
> I can only verify leds-gpio usage, but changes to gpio_keys_polled and
> amba-clcd-nomadik seem pretty straight forward.

I I like this, I have been annoyed by this too. Thank you for
looking into this.

> If this is the right thing to do, I need to know who I shall CC for
> patch approval.

I can simply test and merge the CLCD patch myself.

Ideally I'd like Dmitry Torokhov to ACK the input patch
and Jacek to ACK the LEDs patch and I will merge it.

Yours,
Linus Walleij
