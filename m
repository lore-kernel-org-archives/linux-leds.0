From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 0/5] Fix various issues with leds-pwm
Date: Thu, 12 Jun 2014 11:01:56 -0700
Message-ID: <CAK5ve-+z8OgQtW7JWbLJZKb=82spVGVS5Ahiz-7YubmszzhRtw@mail.gmail.com>
References: <20140406221854.GS7528@n2100.arm.linux.org.uk> <CAK5ve-JijCvD8cZMpx+zG7YAjce3hnhpwTHCJr+zzfMKmJPt=g@mail.gmail.com>
 <20140407213337.GL7528@n2100.arm.linux.org.uk> <CAK5ve-KMLvxZgwFiks7eQHdBfakfMUPqUiuY0+KFmGLat8VhPA@mail.gmail.com>
 <20140612171206.GA12123@n2100.arm.linux.org.uk> <CAK5ve-+j75g_cTDHAEF3F9fqHQqe9iGFQ+XfssS=dNn0sa+bmg@mail.gmail.com>
 <20140612175606.GP3429@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f42.google.com ([209.85.215.42]:43087 "EHLO
	mail-la0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750803AbaFLSCS (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 12 Jun 2014 14:02:18 -0400
In-Reply-To: <20140612175606.GP3429@piout.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Richard Purdie <rpurdie@rpsys.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>

On Thu, Jun 12, 2014 at 10:56 AM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> Hi,
>
> On 12/06/2014 at 10:37:43 -0700, Bryan Wu wrote :
>> On Thu, Jun 12, 2014 at 10:12 AM, Russell King - ARM Linux
>> <linux@arm.linux.org.uk> wrote:
>> > So, I see this commit in mainline:
>> >
>> > commit e81d372ff9f694e13fa46e8b5aaed505c7fd2a1f
>> > Merge: 75e300c8ba58 2f05e1d4458f
>> > Author: Linus Torvalds <torvalds@linux-foundation.org>
>> > Date:   Sat Dec 15 12:52:42 2012 -0800
>> >
>>
>> Are you sure? this was a git pull in 2012. At that time I didn't get
>> any patch from you.
>>
>> The latest pull was
>>
>> commit 4162877d3ffa900b618c369c490c7faa6af60e47
>> Merge: 6c61403 14f5716
>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>> Date:   Thu Apr 10 09:06:10 2014 -0700
>>
>>     Merge branch 'for-next' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds
>>
>
> This pull request was for 3.15.
>
>> > Yet I don't see this patch series in it.  What's the story behind the
>> > lack of progress on this?
>> >
>> > Your April response clearly indicated that the entire patch set was going
>> > in during the 3.16 merge window.
>> >
>>
>> The rest of them are queued in my tree
>> http://git.kernel.org/cgit/linux/kernel/git/cooloney/linux-leds.git/log/?h=for-next
>>
>> And I will send them out during 3.16 merge window but now mainline is
>> still 3.15-rc8. I believe this is what we talked about before.
>>
>> Oh, no, I'm sorry, I messed up 3.16 merge window which is before
>> 3.15-rc1 with 3.17 merge window. And I really mean 3.17 merge window
>> which is before 3.16-rc1. My bad, I will definitely send them all out
>> during 3.17 merge window.
>>
>
> Your for-next branch was in linux-next for a while. You don't seem to
> have sent a pull request for 3.16 and the merge window is not closed yet
> so you can probably do it now.
>
>

You guys are right. Today I'm not in good status to work. Looks like
3.16 merge window is open , right? I will send out pull request soon,
actually that's my plan to do that.

-Bryan
