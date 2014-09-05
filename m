From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH/RFC v5 00/10] LED / flash API integration - documentation
Date: Fri, 5 Sep 2014 10:15:58 -0700
Message-ID: <CAK5ve-Jh2zON5phSHdOg7Yhc_gD6nfkFb_M3L_SvkJ1=pPdLbA@mail.gmail.com>
References: <1408542259-415-1-git-send-email-j.anaszewski@samsung.com> <540834D5.4050000@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:58162 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751144AbaIERQU (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 5 Sep 2014 13:16:20 -0400
Received: by mail-lb0-f180.google.com with SMTP id w7so14032724lbi.11
        for <linux-leds@vger.kernel.org>; Fri, 05 Sep 2014 10:16:19 -0700 (PDT)
In-Reply-To: <540834D5.4050000@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>

On Thu, Sep 4, 2014 at 2:45 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Hi Bryan,
>
> I am just pinging to make sure that this patch set hasn't
> missed your mailbox :)
>

Thanks for pushing this. I'm starting to review them.

-Bryan


> Best Regards,
> Jacek Anaszewski
>
>
> On 08/20/2014 03:44 PM, Jacek Anaszewski wrote:
>>
>> This patch set is the follow-up of the LED / flash API integration
>> series [1]. For clarity reasons the patchset has been split into
>> five subsets:
>>
>> - LED Flash Class
>> - Flash Manager
>> - V4L2 Flash
>> - LED Flash Class drivers
>> - Documentation
>>
>> The series is based on linux-next-20140820.
>>
>> Thanks,
>> Jacek Anaszewski
>>
>> [1] https://lkml.org/lkml/2014/7/11/914
>>
>> Jacek Anaszewski (10):
>>    Documentation: leds: Add description of LED Flash Class extension
>>    Documentation: leds: Add description of Flash Manager
>>    Documentation: leds: add exemplary asynchronous mux driver
>>    DT: leds: Add flash led devices related properties
>>    DT: Add documentation for LED Class Flash Manger
>>    DT: Add documentation for exynos4-is 'flashes' property
>>    DT: Add documentation for the mfd Maxim max77693
>>    of: Add Skyworks Solutions, Inc. vendor prefix
>>    DT: Add documentation for the Skyworks AAT1290
>>    ARM: dts: add aat1290 current regulator device node
>>
>>   Documentation/devicetree/bindings/leds/common.txt  |   16 ++
>>   .../devicetree/bindings/leds/leds-aat1290.txt      |   17 ++
>>   .../bindings/leds/leds-flash-manager.txt           |  163
>> ++++++++++++++++++++
>>   .../devicetree/bindings/media/samsung-fimc.txt     |    5 +
>>   Documentation/devicetree/bindings/mfd/max77693.txt |   62 ++++++++
>>   .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>>   Documentation/leds/leds-async-mux.c                |   65 ++++++++
>>   Documentation/leds/leds-class-flash.txt            |  118 ++++++++++++++
>>   arch/arm/boot/dts/exynos4412-trats2.dts            |   24 +++
>>   9 files changed, 471 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/leds/leds-aat1290.txt
>>   create mode 100644
>> Documentation/devicetree/bindings/leds/leds-flash-manager.txt
>>   create mode 100644 Documentation/leds/leds-async-mux.c
>>   create mode 100644 Documentation/leds/leds-class-flash.txt
>>
>
