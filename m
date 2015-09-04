From: Vaishali Thakkar <vthakkar1994@gmail.com>
Subject: Re: [PATCH v2] leds: leds-cobalt-qube: Use devm_led_classdev_register
Date: Fri, 4 Sep 2015 17:00:51 +0530
Message-ID: <CAK-LDbL7yQuTQrFmcdR-MvzMsWzkGwZwW0i3eAEwH-0H2+f6GQ@mail.gmail.com>
References: <20150901123525.GA12241@localhost>
	<55E97F64.3030904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-yk0-f181.google.com ([209.85.160.181]:35612 "EHLO
	mail-yk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756470AbbIDLay (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 4 Sep 2015 07:30:54 -0400
In-Reply-To: <55E97F64.3030904@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Sep 4, 2015 at 4:54 PM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Hi Vaishali,
>
>
> On 09/01/2015 02:35 PM, Vaishali Thakkar wrote:
>>
>> Use resource-managed function devm_led_classdev_register instead
>> of led_classdev_register to make the error-path simpler.
>>
>> To be compatible with the change, goto is replaced with direct
>> return, unneeded label err_null is dropped and unnecessary variable
>> retval is removed. Also, remove redundant cobalt_qube_led_remove.
>>
>> Signed-off-by: Vaishali Thakkar <vthakkar1994@gmail.com>
>> ---
>> Changes since v1:
>>         - Remove use of variable retval
>>         - Change commit log
>> ---
>>   drivers/leds/leds-cobalt-qube.c | 21 +--------------------
>>   1 file changed, 1 insertion(+), 20 deletions(-)
>>
>> diff --git a/drivers/leds/leds-cobalt-qube.c
>> b/drivers/leds/leds-cobalt-qube.c
>> index d975220..f1374d2 100644
>> --- a/drivers/leds/leds-cobalt-qube.c
>> +++ b/drivers/leds/leds-cobalt-qube.c
>> @@ -36,7 +36,6 @@ static struct led_classdev qube_front_led = {
>>   static int cobalt_qube_led_probe(struct platform_device *pdev)
>>   {
>>         struct resource *res;
>> -       int retval;
>>
>>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>         if (!res)
>> @@ -49,31 +48,13 @@ static int cobalt_qube_led_probe(struct
>> platform_device *pdev)
>>         led_value = LED_FRONT_LEFT | LED_FRONT_RIGHT;
>>         writeb(led_value, led_port);
>>
>> -       retval = led_classdev_register(&pdev->dev, &qube_front_led);
>> -       if (retval)
>> -               goto err_null;
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
>> +       return devm_led_classdev_register(&pdev->dev, &qube_front_led);
>>
>>         return 0;
>
>
> Merged, after removing stray "return 0", thanks.

Oops! my bad. Thanks.

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
