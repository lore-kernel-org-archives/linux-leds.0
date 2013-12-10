From: Chen Gang <gang.chen.5i5j@gmail.com>
Subject: Re: [PATCH] drivers: leds: leds-tca6507: check CONFIG_GPIOLIB whether
 defined for 'gpio_base'
Date: Tue, 10 Dec 2013 09:58:05 +0800
Message-ID: <52A6752D.4000302@gmail.com>
References: <52A54A01.60107@gmail.com> <CAK5ve-K9mVnsOUAQCC2byXRzK3-PyZnxc1rr09p4-xz4oNKa3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:39127 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751746Ab3LJB4C (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 9 Dec 2013 20:56:02 -0500
Received: by mail-pd0-f177.google.com with SMTP id q10so6269259pdj.36
        for <linux-leds@vger.kernel.org>; Mon, 09 Dec 2013 17:56:01 -0800 (PST)
In-Reply-To: <CAK5ve-K9mVnsOUAQCC2byXRzK3-PyZnxc1rr09p4-xz4oNKa3g@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, James Hogan <james.hogan@imgtec.com>

On 12/10/2013 02:24 AM, Bryan Wu wrote:
> On Sun, Dec 8, 2013 at 8:41 PM, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
>>
>> Need check CONFIG_GPIOLIB whether defined, just like another area has
>> done within this file. Or can not pass compiling when CONFIG_GPIOLIB
>> disabled.
>>
>> The related error (with allmodconfig for metag):
>>
>>     CC [M]  drivers/leds/leds-tca6507.o
>>   drivers/leds/leds-tca6507.c: In function 'tca6507_led_dt_init':
>>   drivers/leds/leds-tca6507.c:731: error: 'struct tca6507_platform_data' has no member named 'gpio_base'
>>
>>
> 
> Good, I merged it into my tree.
> Thanks,
> -Bryan
>

Thank you too.

-- 
Chen Gang

Open, share, and attitude like air, water and life which God blessed
