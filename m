From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 2/5] leds: leds-mc13783: Use LED core PM functions
Date: Mon, 16 Dec 2013 12:10:53 -0800
Message-ID: <CAK5ve-KeB+tX33Wo-X+y1LEdy8+f-S_wrzqz_PpUi=y8q9S+Jw@mail.gmail.com>
References: <1387018850-6974-1-git-send-email-shc_work@mail.ru>
 <1387018850-6974-2-git-send-email-shc_work@mail.ru> <CAK5ve-J9Vwn=ACMPjQqw=WhJVGnR7ezLTpn+MokLn4jjMYsdKg@mail.gmail.com>
 <1387224404.165109904@f242.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f45.google.com ([209.85.215.45]:40627 "EHLO
	mail-la0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751991Ab3LPULO (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 Dec 2013 15:11:14 -0500
Received: by mail-la0-f45.google.com with SMTP id eh20so2898144lab.4
        for <linux-leds@vger.kernel.org>; Mon, 16 Dec 2013 12:11:13 -0800 (PST)
In-Reply-To: <1387224404.165109904@f242.i.mail.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Philippe Retornaz <philippe.retornaz@epfl.ch>

On Mon, Dec 16, 2013 at 12:06 PM, Alexander Shiyan <shc_work@mail.ru> wrote:
>> On Sat, Dec 14, 2013 at 3:00 AM, Alexander Shiyan <shc_work@mail.ru> wrote:
>> > Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
>> > ---
>> >  drivers/leds/leds-mc13783.c | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
>> > index e61bdb5..670b936 100644
>> > --- a/drivers/leds/leds-mc13783.c
>> > +++ b/drivers/leds/leds-mc13783.c
>> > @@ -184,6 +184,7 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
>> >                 leds->led[i].leds = leds;
>> >                 leds->led[i].cdev.name = name;
>> >                 leds->led[i].cdev.default_trigger = trig;
>> > +               leds->led[i].cdev.flags |= LED_CORE_SUSPENDRESUME;
>>
>> Looks good, I will merge that later.
>
> Now I see useless "|" (OR) in assignment. Can you drop it during merge?
>
Sure, please update this patchset. I will review it later.

-Bryan
