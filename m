From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [GIT PULL] LED subsystem updates for 4.6
Date: Wed, 16 Mar 2016 08:40:47 +0100
Message-ID: <56E90DFF.6090603@samsung.com>
References: <1457951097-27079-1-git-send-email-j.anaszewski@samsung.com>
 <20160315103613.3eb6347e@canb.auug.org.au> <56E7BEE8.2000004@samsung.com>
 <CA+55aFz5YTwNHH9M3UuJ70_S8R6bbmPOqb8CA2soeGPaJ+i5ZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:64967 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933642AbcCPHkv (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 16 Mar 2016 03:40:51 -0400
In-reply-to: <CA+55aFz5YTwNHH9M3UuJ70_S8R6bbmPOqb8CA2soeGPaJ+i5ZQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, amitoj1606@gmail.com, ao2@ao2.it, drivshin@allworx.com, Geert Uytterhoeven <geert+renesas@glider.be>, hkallweit1@gmail.com, stefan.wahren@i2se.com, Wei Yongjun <yongjun_wei@trendmicro.com.cn>

On 03/16/2016 06:04 AM, Linus Torvalds wrote:
> On Tue, Mar 15, 2016 at 12:51 AM, Jacek Anaszewski
> <j.anaszewski@samsung.com> wrote:
>>
>> I just wanted to make sure that no unexpected problem has occurred
>> after rebasing onto 4.5 release. Is it in some way more advantageous to
>> base a pull request on rc7, than on a final release?
>
> I'd rather see the pull request based on whatever it has been tested
> on, and just keep it that way.
>
> Any rebasing will inevitably mean that you are basically throwing all
> previous testing out the window (or at least make it dubious).
>
> Rebasing also makes it much harder to see the history (for example,
> compare it against previous linux-next trees), so the rule really
> should be that you should never rebase unless you have a major reason
> to do so.
>
> So for example, if you actually find a problem, and you notice that
> that problem comes not from your own changes, but from the base you
> picked - *then* you'd want to rebase to a more stable base. But a
> rebase "just because" is not a good idea.
>
> I'll pull it, since it looks fairly harmless, but basically please
> don't do that again.

Thanks for the explanation. I'll proceed accordingly.

-- 
Best regards,
Jacek Anaszewski
