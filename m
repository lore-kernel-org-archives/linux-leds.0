From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: Help with LED subsystem maintainance
Date: Tue, 15 Nov 2016 10:31:19 +0100
Message-ID: <dd9b3fa8-2480-4998-8d5e-36326a0be5ae@samsung.com>
References: <CGME20161114203127epcas4p1a110e5484a61749c2f5cf90b40992438@epcas4p1.samsung.com>
 <20161114203118.GA5365@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:12778 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755527AbcKOJbZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Nov 2016 04:31:25 -0500
In-reply-to: <20161114203118.GA5365@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>

Hi,

On 11/14/2016 09:31 PM, Pavel Machek wrote:
> Hi!
>
> Would it make sense to list me as a co-maintainer for the LED
> subsystem?
>
> I'd leave patch collection / git tree maintenance to you, but I guess
> I can help with design, locking, etc...

Sure, thanks for your commitment. You're in fact taking part in most of
LED core related discussions. Please submit this patch with more
formal commit message, so that I could merge it to the LED tree.

Best regards,
Jacek Anaszewski

> Thanks and best regards,
> 								Pavel
>
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 01bff8e..d2934e7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6884,6 +6884,7 @@ F:	drivers/scsi/53c700*
>  LED SUBSYSTEM
>  M:	Richard Purdie <rpurdie@rpsys.net>
>  M:	Jacek Anaszewski <j.anaszewski@samsung.com>
> +M:	Pavel Machek <pavel@ucw.cz>
>  L:	linux-leds@vger.kernel.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
>  S:	Maintained
>
>
>
>
