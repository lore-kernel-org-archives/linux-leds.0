From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: triggers: oneshot: fix module license specification
Date: Mon, 16 Nov 2015 14:18:45 +0100
Message-ID: <5649D7B5.7060409@samsung.com>
References: <1447320039-16240-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CABkP77eYMQd6xsS3=tPH2ZUmcq2DvZq73Eit0Hc9oUR1YCYd1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:28341 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751679AbbKPNSu (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 Nov 2015 08:18:50 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXW004S7SZBLJ60@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 16 Nov 2015 13:18:47 +0000 (GMT)
In-reply-to: <CABkP77eYMQd6xsS3=tPH2ZUmcq2DvZq73Eit0Hc9oUR1YCYd1w@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Fabio Baltieri <fabio.baltieri@gmail.com>
Cc: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>, Richard Purdie <rpurdie@rpsys.net>, kernel@pengutronix.de, linux-leds@vger.kernel.org

On 11/12/2015 10:52 AM, Fabio Baltieri wrote:
> On Thu, Nov 12, 2015 at 9:20 AM, Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
>> The header of this file fixes the license to GPL 2 only without the
>> option to use later version. So use the string "GPL v2" that is to b=
e
>> used in this case.
>>
>> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de=
>
>
> Acked-by: Fabio Baltieri <fabio.baltieri@gmail.com>

Applied, thanks.

>> ---
>>   drivers/leds/trigger/ledtrig-oneshot.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/trigger/ledtrig-oneshot.c b/drivers/leds/t=
rigger/ledtrig-oneshot.c
>> index fbd02cdc3ad7..c1bab74b22a0 100644
>> --- a/drivers/leds/trigger/ledtrig-oneshot.c
>> +++ b/drivers/leds/trigger/ledtrig-oneshot.c
>> @@ -201,4 +201,4 @@ module_exit(oneshot_trig_exit);
>>
>>   MODULE_AUTHOR("Fabio Baltieri <fabio.baltieri@gmail.com>");
>>   MODULE_DESCRIPTION("One-shot LED trigger");
>> -MODULE_LICENSE("GPL");
>> +MODULE_LICENSE("GPL v2");
>> --
>> 2.6.1
>>
>
>
>


--=20
Best Regards,
Jacek Anaszewski
