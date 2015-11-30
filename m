From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 5/7] leds-bcm6328: switch to __raw_readl() and
 __raw_writel()
Date: Mon, 30 Nov 2015 11:46:05 +0100
Message-ID: <565C28ED.8060603@samsung.com>
References: <1448814931-1369-1-git-send-email-noltari@gmail.com>
 <1448814931-1369-5-git-send-email-noltari@gmail.com>
 <565BD170.2050600@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:38370 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753466AbbK3KqJ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Nov 2015 05:46:09 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYM000OOJ8VGH60@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 30 Nov 2015 10:46:07 +0000 (GMT)
In-reply-to: <565BD170.2050600@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, linux-leds@vger.kernel.org, jogo@openwrt.org, cernekee@gmail.com, simon@fire.lp0.eu

Hi Florian, Alvaro

On 11/30/2015 05:32 AM, Florian Fainelli wrote:
> Le 29/11/2015 08:35, =C3=81lvaro Fern=C3=A1ndez Rojas a =C3=A9crit :
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>
> This driver has a slight chance of running on a BCM63138 SoC which is
> ARM-based and little endian, so I would keep the wrapper around here
> just so it is easy for somebody to add support for a different platfo=
rm
> later on.

Thanks for sharing this info.

Alvaro - is the performance gain resulting from this change
specifically important for some of your use cases?

>> ---
>>   drivers/leds/leds-bcm6328.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328=
=2Ec
>> index cd54264..876f0ce 100644
>> --- a/drivers/leds/leds-bcm6328.c
>> +++ b/drivers/leds/leds-bcm6328.c
>> @@ -76,12 +76,12 @@ struct bcm6328_led {
>>
>>   static void bcm6328_led_write(void __iomem *reg, unsigned long dat=
a)
>>   {
>> -	iowrite32be(data, reg);
>> +	__raw_writel(data, reg);
>>   }
>>
>>   static unsigned long bcm6328_led_read(void __iomem *reg)
>>   {
>> -	return ioread32be(reg);
>> +	return __raw_readl(reg);
>>   }
>>
>>   /**
>>
>
>


--=20
Best Regards,
Jacek Anaszewski
