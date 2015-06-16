From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] drivers/leds: don't use module_init in non-modular
 leds-cobalt-raq.c
Date: Tue, 16 Jun 2015 10:23:42 +0200
Message-ID: <557FDD0E.8000000@samsung.com>
References: <1434406367-32251-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:52765 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754325AbbFPIXq (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 16 Jun 2015 04:23:46 -0400
In-reply-to: <1434406367-32251-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

Hi Paul,

On 06/16/2015 12:12 AM, Paul Gortmaker wrote:
> This file is built for a bool Kconfig variable, and hence this
> code is either present or absent.  It currently can never be
> modular, so using module_init as an alias for __initcall can be
> somewhat misleading.
>
> Fix this up now, so that we can relocate module_init from
> init.h into module.h in the future.  If we don't do this, we'd
> have to add module.h to obviously non-modular code, and that
> would be a worse thing.
>
> Note that direct use of __initcall is discouraged, vs. one
> of the priority categorized subgroups.  As __initcall gets
> mapped onto device_initcall, our use of device_initcall
> directly in this change means that the runtime impact is
> zero -- it will remain at level 6 in initcall ordering.
>
> And since it can't be modular, we remove all the __exitcall
> stuff related to module_exit() -- it is dead code that won't
> ever be executed.
>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
> [
>   To be appended to the branch content originally sent as:
>   "Replace module_init with device_initcall in non modules"
>   https://lkml.kernel.org/r/1432860493-23831-1-git-send-email-paul.gortmaker@windriver.com
> ]
>
>   drivers/leds/leds-cobalt-raq.c | 15 +--------------
>   1 file changed, 1 insertion(+), 14 deletions(-)

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

-- 
Best Regards,
Jacek Anaszewski
