From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: Delete obsolete Versatile driver
Date: Thu, 4 May 2017 21:26:14 +0200
Message-ID: <67abe1aa-6eb4-3f83-22c8-19695ccd3275@gmail.com>
References: <20170504120308.6738-1-linus.walleij@linaro.org>
 <20170504121402.GB32103@amd>
 <CACRpkdaHxKMb=FRKdfNixry3TNPJo_hjqbxBm-oq8NfrHbkuYA@mail.gmail.com>
 <20170504122847.GC32103@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:34263 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754408AbdEDT07 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 May 2017 15:26:59 -0400
Received: by mail-wr0-f195.google.com with SMTP id 6so2385632wrb.1
        for <linux-leds@vger.kernel.org>; Thu, 04 May 2017 12:26:58 -0700 (PDT)
In-Reply-To: <20170504122847.GC32103@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Linus Walleij <linus.walleij@linaro.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On 05/04/2017 02:28 PM, Pavel Machek wrote:
> On Thu 2017-05-04 14:23:39, Linus Walleij wrote:
>> On Thu, May 4, 2017 at 2:14 PM, Pavel Machek <pavel@ucw.cz> wrote:
>>
>>> On Thu 2017-05-04 14:03:08, Linus Walleij wrote:
>>>> All users of the Versatile LED driver are deleted and replaced
>>>> with the very generic leds-syscon. Delete the old driver.
>>>
>>> If someone has LEDS_VERSATILE selected, he'll be unhappy if we apply
>>> first.
>>>
>>> Are you sure no _users_ have LEDS_VERSATILE selected? Should we give
>>> them some kind of warning? (#warning, printk, ...?)
>>
>> Since the driver cannot probe from device tree or ACPI, the device must
>> be created in a board file using the device name "versatile-leds" which is
>> what the driver matches against.
>>
>> For them to use it they must have out-of-tree boardfiles, and we discourage
>> both out-of-tree code and boardfiles.
>>
>> The last boardfiles using this were deleted in
>> commit 7484c727b636a838818e71f6d03114633b25aba2
>> "ARM: realview: delete the RealView board files".
>>
>> All Versatile, Integrator and RealView boards (the only one using the
>> versatile LEDs), have been migrated to use leds-syscon.c.
> 
> Aha, people having out-of-tree boardfiles probably know enough to
> handle this.
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>

Applied to the for-4.13 branch of linux-leds.git, thanks.

-- 
Best regards,
Jacek Anaszewski
