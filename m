From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] LED/MIPS: Move SEAD3 LED driver to where it belongs.
Date: Mon, 21 Sep 2015 10:52:18 +0200
Message-ID: <55FFC542.5090209@samsung.com>
References: <20150803150401.GD2843@linux-mips.org>
 <55FA7BA0.4080706@samsung.com> <20150918210549.GD16992@NP-P-BURTON>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:15263 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756163AbbIUIwW (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 21 Sep 2015 04:52:22 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NV000H9DRB88K70@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 21 Sep 2015 09:52:20 +0100 (BST)
In-reply-to: <20150918210549.GD16992@NP-P-BURTON>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Markos Chandras <markos.chandras@imgtec.com>, linux-leds@vger.kernel.org, linux-mips@linux-mips.org

Hi Paul,

On 09/18/2015 11:05 PM, Paul Burton wrote:
> On Thu, Sep 17, 2015 at 10:36:48AM +0200, Jacek Anaszewski wrote:
>> Hi Ralf,
>>
>> This patch got stuck somewhere in my mailbox and just
>> recently showed up to my eyes again, so I applied it to v4.3-rc1, but when
>> tried to compile-test it, I got following errors:
>>
>> arch/mips/kernel/signal.c: In function 'sc_to_extcontext':
>> arch/mips/kernel/signal.c:143:12: error: 'struct ucontext' has no member
>> named 'uc_extcontext'
>>    return &uc->uc_extcontext;
>>              ^
>
> <snip...>
>
>> Compilation succeeds with v4.2-rc8.
>> Is it a known issue?
>
> Hi Jacek,
>
> The patches adding the MSA extended context added a MIPS-specific
> ucontext.h, where we were previously were using the generic one. Kbuild
> doesn't automatically remove the old generated header that includes the
> generic version, so could you try either cleaning your working tree or
> removing arch/mips/include/generated and trying again?

Thanks for the hint. It works.

I've applied the patch to the for-next branch of linux-leds.git

-- 
Best Regards,
Jacek Anaszewski
