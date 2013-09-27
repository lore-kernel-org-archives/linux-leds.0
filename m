From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/6] leds: gpio: Include linux/of.h header
Date: Fri, 27 Sep 2013 22:48:56 +0530
Message-ID: <CAK9yfHyjMYaZkqg-4B_8y1CxJ2eHq2wWRRjc7-5XP2OcqD9mcg@mail.gmail.com>
References: <1380281823-13487-1-git-send-email-sachin.kamat@linaro.org>
	<CAK5ve-J12MJzvwwCYcLNL5uA6c638srsrbg-eweuP+XVv4dDpA@mail.gmail.com>
	<CAK9yfHwMje0Y_OswFEHg22Q8RKLqrBBMTfYxNjhy4Gk3nS1b0g@mail.gmail.com>
	<CAK5ve-+e6W5wHzKVRoRUHdcksLZmOAgW=MawzJ1q3BHZzN46KA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:49733 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752561Ab3I0RS4 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 27 Sep 2013 13:18:56 -0400
Received: by mail-oa0-f41.google.com with SMTP id n10so2301682oag.14
        for <linux-leds@vger.kernel.org>; Fri, 27 Sep 2013 10:18:56 -0700 (PDT)
In-Reply-To: <CAK5ve-+e6W5wHzKVRoRUHdcksLZmOAgW=MawzJ1q3BHZzN46KA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>

On 27 September 2013 22:46, Bryan Wu <cooloney@gmail.com> wrote:
> On Fri, Sep 27, 2013 at 10:02 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>> On 27 September 2013 22:23, Bryan Wu <cooloney@gmail.com> wrote:
>>> On Fri, Sep 27, 2013 at 4:36 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>>>> 'of_match_ptr' is defined in linux/of.h. Include it explicitly.
>>>>
>>>
>>> Why we need this? I think it is include from of_gpio.h or
>>> of_platform.h. And I tried to build these driver files you patched,
>>> there is no error or warning for this.
>>>
>>> Is there any error or warning you met?
>>
>> No, this is only a coding style best practice to include the header
>> files explicitly as is widely followed across the kernel. This will
>> avoid breakage in the future if the indirect inclusion is moved or
>> removed .
>>
>
> OK, I assumed some building failures. Please help me to fold all you 6
> patches together and we can apply them in one patch.

Ok. I will squash them together and send it to you in sometime.
Thanks.
-- 
With warm regards,
Sachin
