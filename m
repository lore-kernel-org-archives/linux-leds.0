From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/1] leds: blinkm: Remove redundant break
Date: Thu, 12 Sep 2013 18:37:11 -0700
Message-ID: <CAK5ve-J9a5hf=8csb63rMVi9Ke2_kGA-SG64k2HC41-oK-z3gw@mail.gmail.com>
References: <1378959629-19523-1-git-send-email-sachin.kamat@linaro.org> <1410181.xU4E5WGzpD@aragorn.auenland.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f44.google.com ([209.85.215.44]:36518 "EHLO
	mail-la0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756862Ab3IMBhd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 12 Sep 2013 21:37:33 -0400
Received: by mail-la0-f44.google.com with SMTP id eo20so477921lab.17
        for <linux-leds@vger.kernel.org>; Thu, 12 Sep 2013 18:37:32 -0700 (PDT)
In-Reply-To: <1410181.xU4E5WGzpD@aragorn.auenland.lan>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?ISO-8859-1?Q?Jan=2DSimon_M=F6ller?= <dl9pf@gmx.de>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Thu, Sep 12, 2013 at 12:33 AM, Jan-Simon M=F6ller <dl9pf@gmx.de> wro=
te:
> Acked-by.
>
> --
>
> Dipl.-Ing.
> Jan-Simon M=F6ller
>
> jansimon.moeller@gmx.de
> On Thursday 12 September 2013 09:50:29 Sachin Kamat wrote:
>> 'break' after return is redundant. Remove it.
>>

Sure, I will merge that with Jan-Simon's Ack and queue it for 3.13 kern=
el.

Thanks,
-Bryan

>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  drivers/leds/leds-blinkm.c |    3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
>> index a502678..66d0a57 100644
>> --- a/drivers/leds/leds-blinkm.c
>> +++ b/drivers/leds/leds-blinkm.c
>> @@ -161,13 +161,10 @@ static ssize_t show_color_common(struct device=
 *dev,
>> char *buf, int color) switch (color) {
>>       case RED:
>>               return scnprintf(buf, PAGE_SIZE, "%02X\n", data->red);
>> -             break;
>>       case GREEN:
>>               return scnprintf(buf, PAGE_SIZE, "%02X\n", data->green=
);
>> -             break;
>>       case BLUE:
>>               return scnprintf(buf, PAGE_SIZE, "%02X\n", data->blue)=
;
>> -             break;
>>       default:
>>               return -EINVAL;
>>       }
>
--
To unsubscribe from this list: send the line "unsubscribe linux-leds" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
