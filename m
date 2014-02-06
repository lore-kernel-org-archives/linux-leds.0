From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] ledtrig-cpu: Handle CPU hot(un)plugging
Date: Thu, 6 Feb 2014 09:15:29 -0800
Message-ID: <CAK5ve-+-9psE=hPx=mNQNBNS6pisR_r8hoiMN4XqBRsr0a3amw@mail.gmail.com>
References: <1390408322-1284-1-git-send-email-pawel.moll@arm.com> <1391706416.22943.2.camel@hornet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:63679 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751637AbaBFRPv (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 6 Feb 2014 12:15:51 -0500
Received: by mail-lb0-f173.google.com with SMTP id s7so180743lbd.4
        for <linux-leds@vger.kernel.org>; Thu, 06 Feb 2014 09:15:49 -0800 (PST)
In-Reply-To: <1391706416.22943.2.camel@hornet>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pawel Moll <pawel.moll@arm.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On Thu, Feb 6, 2014 at 9:06 AM, Pawel Moll <pawel.moll@arm.com> wrote:
> On Wed, 2014-01-22 at 16:32 +0000, Pawel Moll wrote:
>> When CPU is hot(un)plugged, no syscore notification is being
>> generated, nor is cpuidle involved. This leaves the CPU LED
>> turned on, because the dying thread is doing some work (LED on)
>> and than it is... well, dying (LED still on :-)
>>
>> Added notifier block for hot(un)plugging operations, generating
>> existing trigger events.
>>
>> Signed-off-by: Pawel Moll <pawel.moll@arm.com>
>
> This is just a friendly and polite ping :-)
>

Just back from a vacation recently, start to catch up patch emails, :-)
This patch looks good to me, I will merge it.

Thanks,
-Bryan
