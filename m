From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v7] leds: ipaq-micro: Implement brightness_set_blocking op
Date: Mon, 30 Nov 2015 13:27:21 +0100
Message-ID: <565C40A9.9010507@samsung.com>
References: <1448035070-4871-1-git-send-email-j.anaszewski@samsung.com>
 <CACRpkdZ2KjgfcTwy30KYhFx8gzRO0Q79Tb7YNuFeQ6qPWxT88g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:44442 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753994AbbK3M1Y (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Nov 2015 07:27:24 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYM00AJ6NXM8Q90@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 30 Nov 2015 12:27:22 +0000 (GMT)
In-reply-to: <CACRpkdZ2KjgfcTwy30KYhFx8gzRO0Q79Tb7YNuFeQ6qPWxT88g@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On 11/30/2015 09:52 AM, Linus Walleij wrote:
> On Fri, Nov 20, 2015 at 4:57 PM, Jacek Anaszewski
> <j.anaszewski@samsung.com> wrote:
>
>> Since brightness setting can sleep for this driver, implement
>> brightness_set_blocking op, instead of brightness_set.
>> It makes this driver compatible with LED triggers.
>>
>> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> Changes from v6:
>> - adjust micro_leds_brightness_set() return type to match
>>    brightness_set_blocking op return type
>
> Even better.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thanks.

-- 
Best Regards,
Jacek Anaszewski
