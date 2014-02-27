From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 5/5] leds: blinkm: remove unnecessary spaces
Date: Thu, 27 Feb 2014 10:22:08 -0800
Message-ID: <CAK5ve-Kg3xb2Uu=Aftw10u65VVmn8bSt_teSkyzYnHZsSEWhCw@mail.gmail.com>
References: <000b01cf32b0$eb62fe40$c228fac0$%han@samsung.com>
 <000f01cf32b1$dd460ef0$97d22cd0$%han@samsung.com> <2477568.SBlftA00dv@samweis.auenland.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:63810 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751773AbaB0SW3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 27 Feb 2014 13:22:29 -0500
Received: by mail-lb0-f171.google.com with SMTP id w7so1949012lbi.16
        for <linux-leds@vger.kernel.org>; Thu, 27 Feb 2014 10:22:28 -0800 (PST)
In-Reply-To: <2477568.SBlftA00dv@samweis.auenland.lan>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?ISO-8859-1?Q?Jan=2DSimon_M=F6ller?= <dl9pf@gmx.de>
Cc: Jingoo Han <jg1.han@samsung.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>

On Tue, Feb 25, 2014 at 10:25 PM, Jan-Simon M=F6ller <dl9pf@gmx.de> wro=
te:
> Acked-by: Jan-Simon M=F6ller <dl9pf@gmx.de>
>

Thanks, applied,
-Bryan

> --
>
> Dipl.-Ing.
> Jan-Simon M=F6ller
>
> jansimon.moeller@gmx.de
> Am Mittwoch, 26. Februar 2014, 14:16:11 schrieb Jingoo Han:
>> Remove unnecessary space in order to fix the following
>> checkpatch issues.
>>
>>   WARNING: space prohibited before semicolon
>>
>> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
>> ---
>>  drivers/leds/leds-blinkm.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
>> index 0c50860..d0452b0 100644
>> --- a/drivers/leds/leds-blinkm.c
>> +++ b/drivers/leds/leds-blinkm.c
>> @@ -443,7 +443,7 @@ static void led_work(struct work_struct *work)
>>  {
>>       int ret;
>>       struct blinkm_led *led;
>> -     struct blinkm_data *data ;
>> +     struct blinkm_data *data;
>>       struct blinkm_work *blm_work =3D work_to_blmwork(work);
>>
>>       led =3D blm_work->blinkm_led;
>
