From: Amitesh Singh <singh.amitesh@gmail.com>
Subject: Re: [PATCH] leds: oneshot - Allow default delay to be passed as an argument
Date: Sat, 3 Sep 2016 21:09:14 +0530
Message-ID: <CABKcAmWkTizLFdg6TfHXwcbeV9O8nnqOLpiAPqB+m6mEo+AVJg@mail.gmail.com>
References: <20160903090331.GA15375@ami-desktop> <590baa53-8426-d2dc-803d-752bf6082c20@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:35801 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754098AbcICPjf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 3 Sep 2016 11:39:35 -0400
Received: by mail-oi0-f68.google.com with SMTP id 2so6765055oif.2
        for <linux-leds@vger.kernel.org>; Sat, 03 Sep 2016 08:39:34 -0700 (PDT)
In-Reply-To: <590baa53-8426-d2dc-803d-752bf6082c20@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

Hello Jacek,

On Sat, Sep 3, 2016 at 7:14 PM, Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
> Hi Amitesh,
>
>
> On 09/03/2016 11:03 AM, Amitesh Singh wrote:
>>
>> This patch facilates the blink delay to be passed as
>> an argument at the time of module loading.
>> e.g.
>> insmod ledtrigg-oneshot.ko default_delay=100
>> ---
>>  drivers/leds/trigger/ledtrig-oneshot.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/leds/trigger/ledtrig-oneshot.c
>> b/drivers/leds/trigger/ledtrig-oneshot.c
>> index b8ea9f0..95933a1 100644
>> --- a/drivers/leds/trigger/ledtrig-oneshot.c
>> +++ b/drivers/leds/trigger/ledtrig-oneshot.c
>> @@ -22,6 +22,9 @@
>>
>>  #define DEFAULT_DELAY 100
>>
>> +static unsigned long default_delay = DEFAULT_DELAY;
>> +module_param(default_delay, ulong, S_IRUGO|S_IWUSR);
>> +
>>  struct oneshot_trig_data {
>>         unsigned int invert;
>>  };
>> @@ -146,8 +149,8 @@ static void oneshot_trig_activate(struct led_classdev
>> *led_cdev)
>>         if (rc)
>>                 goto err_out_invert;
>>
>> -       led_cdev->blink_delay_on = DEFAULT_DELAY;
>> -       led_cdev->blink_delay_off = DEFAULT_DELAY;
>> +       led_cdev->blink_delay_on = default_delay;
>> +       led_cdev->blink_delay_off = default_delay;
>>
>>         led_cdev->activated = true;
>>
>>
>
> Why do you need this module parameter? You can change
> delay_on and delay_off values from sysfs.
>

Yes, indeed. If someone wants to change blink_delay, he has to change
both delay_on and delay_off in case you want to blink with constant
time ON and OFF (1 / (T + T) = 1/2T)
This patch facilitates you to modify delay in one step in case of
delay on and off are same which I think, is most used case.

> --
> Best regards,
> Jacek Anaszewski

Regards
Amitesh Singh
