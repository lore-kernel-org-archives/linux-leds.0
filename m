From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/6] leds: gpio: Include linux/of.h header
Date: Fri, 27 Sep 2013 10:16:39 -0700
Message-ID: <CAK5ve-+e6W5wHzKVRoRUHdcksLZmOAgW=MawzJ1q3BHZzN46KA@mail.gmail.com>
References: <1380281823-13487-1-git-send-email-sachin.kamat@linaro.org>
 <CAK5ve-J12MJzvwwCYcLNL5uA6c638srsrbg-eweuP+XVv4dDpA@mail.gmail.com> <CAK9yfHwMje0Y_OswFEHg22Q8RKLqrBBMTfYxNjhy4Gk3nS1b0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:36999 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753444Ab3I0RRC (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 27 Sep 2013 13:17:02 -0400
Received: by mail-lb0-f182.google.com with SMTP id c11so2454329lbj.41
        for <linux-leds@vger.kernel.org>; Fri, 27 Sep 2013 10:17:00 -0700 (PDT)
In-Reply-To: <CAK9yfHwMje0Y_OswFEHg22Q8RKLqrBBMTfYxNjhy4Gk3nS1b0g@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>

On Fri, Sep 27, 2013 at 10:02 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> On 27 September 2013 22:23, Bryan Wu <cooloney@gmail.com> wrote:
>> On Fri, Sep 27, 2013 at 4:36 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>>> 'of_match_ptr' is defined in linux/of.h. Include it explicitly.
>>>
>>
>> Why we need this? I think it is include from of_gpio.h or
>> of_platform.h. And I tried to build these driver files you patched,
>> there is no error or warning for this.
>>
>> Is there any error or warning you met?
>
> No, this is only a coding style best practice to include the header
> files explicitly as is widely followed across the kernel. This will
> avoid breakage in the future if the indirect inclusion is moved or
> removed .
>

OK, I assumed some building failures. Please help me to fold all you 6
patches together and we can apply them in one patch.

Thanks,
-Bryan
