From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2] LED/MIPS: Move SEAD3 LED driver to where it belongs.
Date: Tue, 04 Aug 2015 14:18:20 +0200
Message-ID: <55C0AD8C.8090306@gmail.com>
References: <20150803150401.GD2843@linux-mips.org> <55BF89D0.2080303@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:36042 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755894AbbHDMSX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 4 Aug 2015 08:18:23 -0400
Received: by wicgj17 with SMTP id gj17so147665033wic.1
        for <linux-leds@vger.kernel.org>; Tue, 04 Aug 2015 05:18:22 -0700 (PDT)
In-Reply-To: <55BF89D0.2080303@cogentembedded.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Ralf Baechle <ralf@linux-mips.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Markos Chandras <markos.chandras@imgtec.com>
Cc: linux-leds@vger.kernel.org, linux-mips@linux-mips.org

Hi Ralf, Sergei,

On 08/03/2015 05:33 PM, Sergei Shtylyov wrote:
> Hello.
>
> On 08/03/2015 06:04 PM, Ralf Baechle wrote:
>
>> Fixes the following randconfig problem
>
>> leds-sead3.c:(.text+0x7dc): undefined reference to
>> `led_classdev_unregister'
>> leds-sead3.c:(.text+0x7e8): undefined reference to
>> `led_classdev_unregister'
>
>> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
>> Cc: Bryan Wu <cooloney@gmail.com>
>> Cc: Richard Purdie <rpurdie@rpsys.net>
>> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
>> Cc: Markos Chandras <markos.chandras@imgtec.com>
>> Cc: linux-leds@vger.kernel.org
>> Cc: linux-mips@linux-mips.org
>
> [...]
>
>> diff --git a/arch/mips/mti-sead3/leds-sead3.c b/drivers/leds/leds-sead3.c
>> similarity index 99%
>> rename from arch/mips/mti-sead3/leds-sead3.c
>> rename to drivers/leds/leds-sead3.c
>> index c938cee..eb97a32 100644
>> --- a/arch/mips/mti-sead3/leds-sead3.c
>> +++ b/drivers/leds/leds-sead3.c
>
>      Oh, so you started to use -M finally. :-)
>
>> @@ -59,6 +59,7 @@ static int sead3_led_remove(struct platform_device
>> *pdev)
>>   {
>>       led_classdev_unregister(&sead3_pled);
>>       led_classdev_unregister(&sead3_fled);
>> +
>
>     Unrelated white space change?

Ralf, please split this change to the separate patch.
You could also reorder include directives to be arranged in
an alphabetical order.

>>       return 0;
>>   }
>
> MBR, Sergei
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
Best Regards,
Jacek Anaszewski
