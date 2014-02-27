From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 4/5] leds: clevo-mail: fix incorrect placement of
 __initdata marker
Date: Thu, 27 Feb 2014 10:16:05 -0800
Message-ID: <CAK5ve-KvEhdXizVmSoTSj24Hy8GAsnHMekHd98CDOZjZoAe+tg@mail.gmail.com>
References: <000b01cf32b0$eb62fe40$c228fac0$%han@samsung.com>
 <000e01cf32b1$ac754340$055fc9c0$%han@samsung.com> <20140226083037.GB6865@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:50102 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753234AbaB0SQ1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 27 Feb 2014 13:16:27 -0500
Received: by mail-lb0-f174.google.com with SMTP id u14so1695039lbd.33
        for <linux-leds@vger.kernel.org>; Thu, 27 Feb 2014 10:16:26 -0800 (PST)
In-Reply-To: <20140226083037.GB6865@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?ISO-8859-1?Q?Uwe_Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jingoo Han <jg1.han@samsung.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, =?ISO-8859-1?Q?M=E1rton_N=E9meth?= <nm127@freemail.hu>, Ondrej Zary <linux@rainbow-software.org>

On Wed, Feb 26, 2014 at 12:30 AM, Uwe Kleine-K=F6nig
<u.kleine-koenig@pengutronix.de> wrote:
> Hello,
>
> On Wed, Feb 26, 2014 at 02:14:49PM +0900, Jingoo Han wrote:
>> diff --git a/drivers/leds/leds-clevo-mail.c b/drivers/leds/leds-clev=
o-mail.c
>> index d93e245..5974810 100644
>> --- a/drivers/leds/leds-clevo-mail.c
>> +++ b/drivers/leds/leds-clevo-mail.c
>> @@ -19,7 +19,7 @@ MODULE_AUTHOR("M=E1rton N=E9meth <nm127@freemail.h=
u>");
>>  MODULE_DESCRIPTION("Clevo mail LED driver");
>>  MODULE_LICENSE("GPL");
>>
>> -static bool __initdata nodetect;
>> +static bool nodetect __initdata;
>>  module_param_named(nodetect, nodetect, bool, 0);
>>  MODULE_PARM_DESC(nodetect, "Skip DMI hardware detection");
> not sure why I'm on Cc, but yes, the change is in line with gcc docs.
> But I wonder if __initdata is ok for a variable backing a module
> parameter as it appears in /sys. Does
>
>         cat /sys/module/leds-clevo-mail/parameters/nodetect
>
> result in an oops? If yes, better drop the __initdata instead of movi=
ng
> it.

Agree with Uwe, I think we'd better drop it. It is not right for a
module parameter.

And please update a previous similar patch as well.

Thanks,
-Bryan
