From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 3/3] leds/pwm: fix driver description and make license
 match the header
Date: Fri, 20 Nov 2015 10:36:52 +0100
Message-ID: <564EE9B4.3010404@samsung.com>
References: <1385412225-29740-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1385412225-29740-4-git-send-email-u.kleine-koenig@pengutronix.de>
 <20151119191737.GF22022@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:25540 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751656AbbKTJg4 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 20 Nov 2015 04:36:56 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NY300DI7XDHZO60@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 20 Nov 2015 09:36:53 +0000 (GMT)
In-reply-to: <20151119191737.GF22022@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Thierry Reding <thierry.reding@gmail.com>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Shawn Guo <shawn.guo@linaro.org>, Matt Sealey <matt@genesi-usa.com>

Hi Uwe,

Applied, thanks.

Best Regards,
Jacek Anaszewski

On 11/19/2015 08:17 PM, Uwe Kleine-K=F6nig wrote:
> Hello,
>
> while the other two patches in this thread are controversal, this one
> shouldn't. It still sits in my branch with unapplied patches since
> nearly two years, which is enormous considering it's such an easy pat=
ch.
>
> Best regards
> Uwe
>
> On Mon, Nov 25, 2013 at 09:43:45PM +0100, Uwe Kleine-K=F6nig wrote:
>> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>> ---
>>   drivers/leds/leds-pwm.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
>> index cdc3e4d..0796ca3 100644
>> --- a/drivers/leds/leds-pwm.c
>> +++ b/drivers/leds/leds-pwm.c
>> @@ -239,6 +239,6 @@ static struct platform_driver led_pwm_driver =3D=
 {
>>   module_platform_driver(led_pwm_driver);
>>
>>   MODULE_AUTHOR("Luotao Fu <l.fu@pengutronix.de>");
>> -MODULE_DESCRIPTION("PWM LED driver for PXA");
>> -MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("generic PWM LED driver");
>> +MODULE_LICENSE("GPL v2");
>>   MODULE_ALIAS("platform:leds-pwm");
>> --
>> 1.8.4.2
>>
>>
>
