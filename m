From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: Fix regression related to led-trigger API location
 change
Date: Fri, 10 Apr 2015 08:47:32 +0200
Message-ID: <55277204.2050407@samsung.com>
References: <1428584133-27892-1-git-send-email-j.anaszewski@samsung.com>
 <CAK5ve-++Ej+Lb0=2WfxShojgLfejBpqam6e6ThLefvtYQLnzZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:46009 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752182AbbDJGrg (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 10 Apr 2015 02:47:36 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NMK006NMWE1H2A0@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 10 Apr 2015 07:51:37 +0100 (BST)
In-reply-to: <CAK5ve-++Ej+Lb0=2WfxShojgLfejBpqam6e6ThLefvtYQLnzZw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>

On 04/09/2015 07:33 PM, Bryan Wu wrote:
> On Thu, Apr 9, 2015 at 5:55 AM, Jacek Anaszewski
> <j.anaszewski@samsung.com> wrote:
>> Patch fe4d2d05 ("leds: unify the location of led-trigger API") is
>> causing a build break when led-triggers are turned off in the config.
>> This patch fixes the issue and changes no-op declarations of affected
>> functions to inlines instead of macros.
>>
>
> My bad, I should build and test kernel on my board and shouldn't put
> this big change in next branch since merge window will open soon.
>
> Jacek, I'm going to drop the previous patch from my tree. and please
> fold this fix patch with previous one together. I will merge it into
> my -devel branch instead of for-next branch. So that means it won't be
> in 4.0 release but 4.1.
>
> Does this make sense to you?

Of course, I should have tested this more carefully too.

-- 
Best Regards,
Jacek Anaszewski
