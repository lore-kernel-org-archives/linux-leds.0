From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH RESEND] leds:lp55xx: fix firmware loading error
Date: Mon, 29 Jun 2015 10:11:42 -0700
Message-ID: <CAK5ve-LCZRsyAvB1FTBkaNJPv-27SnEVBSoPGrC_GqKRj6KMZg@mail.gmail.com>
References: <1435538354-4332-1-git-send-email-milo.kim@ti.com> <55915CFD.2000801@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-yk0-f169.google.com ([209.85.160.169]:34195 "EHLO
	mail-yk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753029AbbF2RMC (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 29 Jun 2015 13:12:02 -0400
Received: by ykfy125 with SMTP id y125so120733896ykf.1
        for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2015 10:12:01 -0700 (PDT)
In-Reply-To: <55915CFD.2000801@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Milo Kim <milo.kim@ti.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Mon, Jun 29, 2015 at 7:58 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Hi Milo,
>
> Thanks for the update.
>
>
> On 06/29/2015 02:39 AM, Milo Kim wrote:
>>
>> LP55xx driver uses not firmware file but raw data to load program through
>> the firmware interface.(Documents/leds/leds-lp55xx.txt)
>>
>>    For example, here is how to run blinking green channel pattern.
>>    (The second engine is seleted and MUX is mapped to 'RGB' mode)
>>    echo 2 > /sys/bus/i2c/devices/xxxx/select_engine
>>    echo "RGB" > /sys/bus/i2c/devices/xxxx/engine_mux
>>    echo 1 > /sys/class/firmware/lp5562/loading
>>    echo "4000600040FF6000" > /sys/class/firmware/lp5562/data
>>    echo 0 > /sys/class/firmware/lp5562/loading
>>    echo 1 > /sys/bus/i2c/devices/xxxx/run_engine
>>
>> However, '/sys/class/firmware/<device name>' is not created after the
>> firmware loader user helper was introduced.
>> This feature is used in the case below.
>>
>>    As soon as the firmware download is requested by the driver, firmware
>>    class subsystem tries to find the binary file.
>>    If it gets failed, then it just falls back to user helper to load
>>    raw data manually. Here, you can see the device file under
>>    /sys/class/firmware/.
>>
>> To make it happen, LP55xx driver requires two configurations.
>>
>>    1. Enable CONFIG_FW_LOADER_USER_HELPER_FALLBACK in Kconfig
>>    2. Set option, 'FW_OPT_USERHELPER' on requesting the firmware data.
>>       It means the second option should be 'false' in
>>       request_firmware_nowait().
>>       This option enables to load firmware data manually by calling
>>       fw_load_from_user_helper().
>>
>> Cc: Bryan Wu <cooloney@gmail.com>
>> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
>> Cc: linux-leds@vger.kernel.org
>> Signed-off-by: Milo Kim <milo.kim@ti.com>
>> ---
>>   drivers/leds/Kconfig              | 1 +
>>   drivers/leds/leds-lp55xx-common.c | 2 +-
>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 966b960..a39d608 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -206,6 +206,7 @@ config LEDS_LP55XX_COMMON
>>         tristate "Common Driver for TI/National
>> LP5521/5523/55231/5562/8501"
>>         depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 ||
>> LEDS_LP8501
>>         select FW_LOADER
>> +       select FW_LOADER_USER_HELPER_FALLBACK
>>         help
>>           This option supports common operations for
>> LP5521/5523/55231/5562/8501
>>           devices.
>> diff --git a/drivers/leds/leds-lp55xx-common.c
>> b/drivers/leds/leds-lp55xx-common.c
>> index 77c26bc..96d51e9 100644
>> --- a/drivers/leds/leds-lp55xx-common.c
>> +++ b/drivers/leds/leds-lp55xx-common.c
>> @@ -223,7 +223,7 @@ static int lp55xx_request_firmware(struct lp55xx_chip
>> *chip)
>>         const char *name = chip->cl->name;
>>         struct device *dev = &chip->cl->dev;
>>
>> -       return request_firmware_nowait(THIS_MODULE, true, name, dev,
>> +       return request_firmware_nowait(THIS_MODULE, false, name, dev,
>>                                 GFP_KERNEL, chip, lp55xx_firmware_loaded);
>>   }
>>
>>
>
> Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>
Merged thanks.
-Bryan
