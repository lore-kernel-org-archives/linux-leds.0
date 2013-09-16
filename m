From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds: lp55xx: enable setting default trigger
Date: Mon, 16 Sep 2013 09:47:04 -0700
Message-ID: <CAK5ve-+bLMJy7DicB_qJ0Yx6U7h9ACr0AwBkOh6Nf+pC4A+Jgg@mail.gmail.com>
References: <1379242217-32398-1-git-send-email-linus.walleij@linaro.org> <523645E2.9040108@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:54474 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751212Ab3IPQr0 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 Sep 2013 12:47:26 -0400
In-Reply-To: <523645E2.9040108@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree@vger.kernel.org

On Sun, Sep 15, 2013 at 4:42 PM, Milo Kim <milo.kim@ti.com> wrote:
> On 09/15/2013 07:50 PM, Linus Walleij wrote:
>>
>> This enables setting a default trigger on an LP55xx channel,
>> either from platform data or device tree. This mechanism is
>> identical to the mechanism for GPIO LEDs and references the
>> common LEDs device tree bindings.
>>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
>
> Acked-by: Milo Kim <milo.kim@ti.com>
>

Thanks, I merged it into my branch.

-Bryan

>
>> ---
>>   Documentation/devicetree/bindings/leds/leds-lp55xx.txt | 10 +++++++---
>>   drivers/leds/leds-lp55xx-common.c                      |  3 +++
>>   include/linux/platform_data/leds-lp55xx.h              |  1 +
>>   3 files changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
>> b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
>> index a61727f..d221e75 100644
>> --- a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
>> +++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
>> @@ -17,12 +17,15 @@ Optional properties:
>>            2: D1~6 with VOUT, D7~9 with VDD
>>            3: D1~9 are connected to VOUT
>>
>> -Alternatively, each child can have specific channel name
>> -- chan-name: Name of each channel name
>> +Alternatively, each child can have a specific channel name and trigger:
>> +- chan-name (optional): name of channel
>> +- linux,default-trigger (optional): see
>> +  Documentation/devicetree/bindings/leds/common.txt
>>
>>   example 1) LP5521
>>   3 LED channels, external clock used. Channel names are
>> 'lp5521_pri:channel0',
>> -'lp5521_pri:channel1' and 'lp5521_pri:channel2'
>> +'lp5521_pri:channel1' and 'lp5521_pri:channel2', with a heartbeat trigger
>> +on channel 0.
>>
>>   lp5521@32 {
>>         compatible = "national,lp5521";
>> @@ -33,6 +36,7 @@ lp5521@32 {
>>         chan0 {
>>                 led-cur = /bits/ 8 <0x2f>;
>>                 max-cur = /bits/ 8 <0x5f>;
>> +               linux,default-trigger = "heartbeat";
>>         };
>
>
> And this DT example works well with 'ledtrig-heartbeat' module.
>
> Tested-by: Milo Kim <milo.kim@ti.com>
>
> Thanks.
>
> Best regards,
> Milo
