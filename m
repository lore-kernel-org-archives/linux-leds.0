From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 2/2] leds: clevo-mail: remove unnecessary __initdata marker
Date: Fri, 28 Feb 2014 12:24:12 -0800
Message-ID: <CAK5ve-KJyOXfefcoQqwpqjRQJ0B-nQRDBH1v_2ELQnrPfsfJWg@mail.gmail.com>
References: <000c01cf3456$34b8ecc0$9e2ac640$%han@samsung.com>
 <001101cf3456$593bd940$0bb38bc0$%han@samsung.com> <20140228102943.GO6865@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:33196 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751991AbaB1UYd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 28 Feb 2014 15:24:33 -0500
Received: by mail-lb0-f172.google.com with SMTP id c11so3045994lbj.17
        for <linux-leds@vger.kernel.org>; Fri, 28 Feb 2014 12:24:32 -0800 (PST)
In-Reply-To: <20140228102943.GO6865@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?ISO-8859-1?Q?Uwe_Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jingoo Han <jg1.han@samsung.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, =?ISO-8859-1?Q?M=E1rton_N=E9meth?= <nm127@freemail.hu>, Ondrej Zary <linux@rainbow-software.org>

On Fri, Feb 28, 2014 at 2:29 AM, Uwe Kleine-K=F6nig
<u.kleine-koenig@pengutronix.de> wrote:
> Hi,
>
> On Fri, Feb 28, 2014 at 04:26:08PM +0900, Jingoo Han wrote:
>> Remove unnecessary __initdata marker, because it is not right
>> for a module parameter. It may make the kernel oops problem.
> I wouldn't call it "unnecessary". Does the kernel oops if you access =
the
> parameter's sysfs file with __initdata in place or doesn't it? If so
> it's definitly not unnecessary but plain wrong.
>

Exactly, I wrote a test module to use a module parameter with
__initdata. And trying to access that sysfs file will cause kernel
oops. So it's a wrong notation in this case, it should not be used for
a module parameter.

Jingoo, I will take care of these 2 patches to replace "unnecessary"
to "wrong" as Uwe suggested.

-Bryan

>>
>> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
>> ---
>>  drivers/leds/leds-clevo-mail.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/leds-clevo-mail.c b/drivers/leds/leds-clev=
o-mail.c
>> index d93e245..19202f5 100644
>> --- a/drivers/leds/leds-clevo-mail.c
>> +++ b/drivers/leds/leds-clevo-mail.c
>> @@ -19,7 +19,7 @@ MODULE_AUTHOR("M=E1rton N=E9meth <nm127@freemail.h=
u>");
>>  MODULE_DESCRIPTION("Clevo mail LED driver");
>>  MODULE_LICENSE("GPL");
>>
>> -static bool __initdata nodetect;
>> +static bool nodetect;
>>  module_param_named(nodetect, nodetect, bool, 0);
>>  MODULE_PARM_DESC(nodetect, "Skip DMI hardware detection");
>>
>> --
>> 1.7.10.4
>>
>>
>>
>
> --
> Pengutronix e.K.                           | Uwe Kleine-K=F6nig      =
      |
> Industrial Linux Solutions                 | http://www.pengutronix.d=
e/  |
