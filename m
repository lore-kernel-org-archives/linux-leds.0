From: Milo Kim <milo.kim@ti.com>
Subject: Re: [PATCH v2 6/9] mfd: add TI LMU hardware fault monitoring driver
Date: Tue, 12 Jan 2016 12:36:59 +0900
Message-ID: <569474DB.3090408@ti.com>
References: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
 <1448521025-2796-7-git-send-email-milo.kim@ti.com>
 <20160111102117.GU14104@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160111102117.GU14104@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, j.anaszewski@samsung.com, broonie@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 01/11/2016 07:21 PM, Lee Jones wrote:
> On Thu, 26 Nov 2015, Milo Kim wrote:
>
>> LM3633 and LM3697 are TI LMU MFD device.
>> Those devices have hardware monitoring feature which detects open or
>> short circuit case.
>>
>> Debugfs
>> -------
>>    Two files are created.
>>      open_fault:  check light output channel is open or not.
>>      short_fault: check light output channel is shorted or not.
>>
>>    The driver checks the status of backlight output channels.
>>    LM3633 and LM3697 have same sequence to check channels, so common
>>    functions are used.
>>    ABI/testing document is also included.
>>
>> Operations
>> ----------
>>    Two devices have common control flow but register addresses are different.
>>    The structure, 'ti_lmu_reg' is used for register configuration.
>>
>> Event notifier
>> --------------
>>    After fault monitoring is done, LMU device is reset. So backlight and
>>    LED device should be reinitialized. It notifies an event as soon as
>>    the monitoring is done. Then, LM3633 and LM3697 backlight and LED drivers
>>    handle this event.
>>
>> Cc: Lee Jones <lee.jones@linaro.org>
>> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-leds@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Milo Kim <milo.kim@ti.com>
>> ---
>>   .../ABI/testing/debugfs-ti-lmu-fault-monitor       |  32 ++
>>   drivers/mfd/Kconfig                                |  10 +
>>   drivers/mfd/Makefile                               |   1 +
>>   drivers/mfd/ti-lmu-fault-monitor.c                 | 405 +++++++++++++++++++++
>
> I think this device is part of the MFD, rather than an MFD itself.
> Please relocate it to somewhere more appropriate.

Actually, initial patch driver was created under 'drivers/hwmon/' but 
HWMON maintainer pointed this driver doesn't include HW sensor feature.
So I moved here.

This driver doesn't need any subsystem infrastructure, 'drivers/misc/' 
could be OK. Does it make sense?

Best regards,
Milo
