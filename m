From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] leds: add driver for the iPAQ micro
Date: Wed, 23 Jul 2014 14:32:04 +0200
Message-ID: <CACRpkdZ88siWX8O1zP3apUG-6XSYwTCr7KArURREdAvXALnojA@mail.gmail.com>
References: <1405157551-10480-1-git-send-email-linus.walleij@linaro.org>
	<CAK5ve-L8vY-DozPhEp1FTSq2vxb0ya3JEJB5WYaOqshK=BCOOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:36393 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751047AbaGWMix (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 23 Jul 2014 08:38:53 -0400
Received: by mail-oa0-f48.google.com with SMTP id m1so1470972oag.21
        for <linux-leds@vger.kernel.org>; Wed, 23 Jul 2014 05:38:52 -0700 (PDT)
In-Reply-To: <CAK5ve-L8vY-DozPhEp1FTSq2vxb0ya3JEJB5WYaOqshK=BCOOg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Tue, Jul 15, 2014 at 2:46 AM, Bryan Wu <cooloney@gmail.com> wrote:
> On Sat, Jul 12, 2014 at 2:32 AM, Linus Walleij <linus.walleij@linaro.org> wrote:

>> +       if (*delay_off >= IPAQ_LED_MAX_DUTY)
>> +               msg.tx_data[3] = 0;
>> +       else
>> +               msg.tx_data[3] = (u8) DIV_ROUND_CLOSEST(*delay_off, 100);
>> +       return ipaq_micro_tx_msg_sync(micro, &msg);
>
> Do we need to use workqueue for both .brightness_set and .blink_set?

The LED message is basically just that you send a message
and this sync function waits for an ACK to be returned
from a completion after an interrupt. It really does not involve
a workqueue, it's a message queue.

Fixed up the rest, sending v2 soon...

Yours,
Linus Walleij
