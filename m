From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/6] leds: gpio: Include linux/of.h header
Date: Fri, 27 Sep 2013 22:32:18 +0530
Message-ID: <CAK9yfHwMje0Y_OswFEHg22Q8RKLqrBBMTfYxNjhy4Gk3nS1b0g@mail.gmail.com>
References: <1380281823-13487-1-git-send-email-sachin.kamat@linaro.org>
	<CAK5ve-J12MJzvwwCYcLNL5uA6c638srsrbg-eweuP+XVv4dDpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:51310 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752267Ab3I0RCT (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 27 Sep 2013 13:02:19 -0400
Received: by mail-ob0-f170.google.com with SMTP id va2so3406132obc.1
        for <linux-leds@vger.kernel.org>; Fri, 27 Sep 2013 10:02:18 -0700 (PDT)
In-Reply-To: <CAK5ve-J12MJzvwwCYcLNL5uA6c638srsrbg-eweuP+XVv4dDpA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>

On 27 September 2013 22:23, Bryan Wu <cooloney@gmail.com> wrote:
> On Fri, Sep 27, 2013 at 4:36 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>> 'of_match_ptr' is defined in linux/of.h. Include it explicitly.
>>
>
> Why we need this? I think it is include from of_gpio.h or
> of_platform.h. And I tried to build these driver files you patched,
> there is no error or warning for this.
>
> Is there any error or warning you met?

No, this is only a coding style best practice to include the header
files explicitly as is widely followed across the kernel. This will
avoid breakage in the future if the indirect inclusion is moved or
removed .

-- 
With warm regards,
Sachin
