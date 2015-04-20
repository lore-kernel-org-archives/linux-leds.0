From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds: gpio: Fix device teardown on probe deferral
Date: Mon, 20 Apr 2015 11:23:51 -0700
Message-ID: <CAK5ve-K3ESKvtmaej2Ruc6hcuCqtYWimmmkLw3JoePdMxg8n0Q@mail.gmail.com>
References: <1429046610-3001-1-git-send-email-sebastian.hesselbarth@gmail.com> <552E2B53.8030002@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:34388 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752173AbbDTSYM (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 20 Apr 2015 14:24:12 -0400
In-Reply-To: <552E2B53.8030002@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On Wed, Apr 15, 2015 at 2:11 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Hi Sebastian,
>
> On 04/14/2015 11:23 PM, Sebastian Hesselbarth wrote:
>>
>> In gpio_leds_create(), when devm_get_gpiod_from_child() fails with
>> -EPROBE_DEFER on the second gpio led to be created, the first already
>> registered led is not torn down properly. This causes create_gpio_led()
>> to fail for the first led on re-probe().
>>
>> Fix this misbehaviour by incrementing num_leds only if all
>> potentially failing calls completed successfully.
>>
>> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
>> ---
>> Cc: Bryan Wu <cooloney@gmail.com>
>> Cc: Richard Purdie <rpurdie@rpsys.net>
>> Cc: linux-leds@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>   drivers/leds/leds-gpio.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>
>
> For this patch:
>
> Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>

Thanks, I merged it.
-Bryan

> I have a question regarding the sequence above on line 201:
>
> if (!led.name)
>         return ERR_PTR(-EINVAL);
>
> Shouldn't this be also 'goto err"?
>
> --
> Best Regards,
> Jacek Anaszewski
