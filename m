From: Vaishali Thakkar <vthakkar1994@gmail.com>
Subject: Re: [PATCH] leds: leds-cobalt-qube: Use devm_led_classdev_register
Date: Fri, 28 Aug 2015 13:49:05 +0530
Message-ID: <CAK-LDbKBwoDaGbiedreWtd++AQfAGcBTC=8fqivWQe=0mEcavg@mail.gmail.com>
References: <20150827051302.GA10275@localhost>
	<55DEBBBD.9010802@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-yk0-f170.google.com ([209.85.160.170]:35846 "EHLO
	mail-yk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751272AbbH1ITH (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 28 Aug 2015 04:19:07 -0400
In-Reply-To: <55DEBBBD.9010802@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Aug 27, 2015 at 12:56 PM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Hi Vaishali,
>
> Thanks for the patch.
>
> On 08/27/2015 07:13 AM, Vaishali Thakkar wrote:
>>
>> Use resource-managed function devm_led_classdev_register instead
>> of led_classdev_register to make the error-path simpler.
>>
>> To be compatible with the change, goto is replaced with direct
>> return and unneeded label is dropped. Also, remove redundant
>> cobalt_qube_led_remove.
>>
>> Signed-off-by: Vaishali Thakkar <vthakkar1994@gmail.com>
>> ---
>>   drivers/leds/leds-cobalt-qube.c | 20 ++------------------
>>   1 file changed, 2 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/leds/leds-cobalt-qube.c
>> b/drivers/leds/leds-cobalt-qube.c
>> index d975220..59818df 100644
>> --- a/drivers/leds/leds-cobalt-qube.c
>> +++ b/drivers/leds/leds-cobalt-qube.c
>> @@ -49,31 +49,15 @@ static int cobalt_qube_led_probe(struct
>> platform_device *pdev)
>>         led_value = LED_FRONT_LEFT | LED_FRONT_RIGHT;
>>         writeb(led_value, led_port);
>>
>> -       retval = led_classdev_register(&pdev->dev, &qube_front_led);
>> +       retval = devm_led_classdev_register(&pdev->dev, &qube_front_led);
>>         if (retval)
>> -               goto err_null;
>
>
> We can spare more lines by changing this to:
>
> return devm_led_classdev_register(&pdev->dev, &qube_front_led);
>
> You could get rid of retval then, too.

Sure. This makes sense. I will send v2 with the change.

Thanks.

>> -
>> -       return 0;
>> -
>> -err_null:
>> -       led_port = NULL;
>> -
>> -       return retval;
>> -}
>> -
>> -static int cobalt_qube_led_remove(struct platform_device *pdev)
>> -{
>> -       led_classdev_unregister(&qube_front_led);
>> -
>> -       if (led_port)
>> -               led_port = NULL;
>> +               return retval;
>>
>>         return 0;
>>   }
>>
>>   static struct platform_driver cobalt_qube_led_driver = {
>>         .probe  = cobalt_qube_led_probe,
>> -       .remove = cobalt_qube_led_remove,
>>         .driver = {
>>                 .name   = "cobalt-qube-leds",
>>         },
>>
>
>
> --
> Best Regards,
> Jacek Anaszewski



-- 
Vaishali
