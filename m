From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH/RFC v5 25/57] leds: pca963x: Remove work queue
Date: Tue, 11 Aug 2015 12:00:32 +0200
Message-ID: <CAPybu_3Wt8QCk1oZeNx_0jSLgapLOyyeOfxW3zVkc08mXsgP9A@mail.gmail.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com> <1439285890-27329-26-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:33142 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933882AbbHKKAx (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 11 Aug 2015 06:00:53 -0400
In-Reply-To: <1439285890-27329-26-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Peter Meerwald <p.meerwald@bct-electronic.com>

Hello Jacek

Sorry for the late reply.

On Tue, Aug 11, 2015 at 11:37 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:


>  struct pca963x_led {
>         struct pca963x *chip;
> -       struct work_struct work;
>         enum led_brightness brightness;
>         struct led_classdev led_cdev;
>         int led_num; /* 0 .. 15 potentially */
> -       enum pca963x_cmd cmd;
>         char name[32];
>         u8 gdc;
>         u8 gfrq;
>  };

Maybe you want to remove also brightness, gdc and gfrq and pass them
as arguments to the functions.

> -static void pca963x_blink_work(struct pca963x_led *pca963x)
> +static void pca963x_blink(struct pca963x_led *pca963x)

something like: blink(pca963x, gdc, gfrq)


Big disclaimer: i havent tested it on real hardware. Maybe next week I
can get hold of a board with a pca chip.


BTW: great thing that the work queue is implemented in the core :)


Cheers!

-- 
Ricardo Ribalda
