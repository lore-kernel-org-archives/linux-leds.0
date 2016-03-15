From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [GIT PULL] LED subsystem updates for 4.6
Date: Tue, 15 Mar 2016 08:51:04 +0100
Message-ID: <56E7BEE8.2000004@samsung.com>
References: <1457951097-27079-1-git-send-email-j.anaszewski@samsung.com>
 <20160315103613.3eb6347e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:15853 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752147AbcCOHvR (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 15 Mar 2016 03:51:17 -0400
In-reply-to: <20160315103613.3eb6347e@canb.auug.org.au>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, amitoj1606@gmail.com, ao2@ao2.it, drivshin@allworx.com, geert+renesas@glider.be, hkallweit1@gmail.com, stefan.wahren@i2se.com, yongjun_wei@trendmicro.com.cn

Hi Stephen,

On 03/15/2016 12:36 AM, Stephen Rothwell wrote:
> Hi Jacek,
>
> On Mon, 14 Mar 2016 11:24:57 +0100 Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
>>
>> Please pull LED updates for 4.6 merge cycle.
>>
>> The following changes since commit b562e44f507e863c6792946e4e1b1449fbbac85d:
>>
>>    Linux 4.5 (2016-03-13 21:28:54 -0700)
>>
>> are available in the git repository at:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds_for_4.6
>>
>> for you to fetch changes up to 7296c33ed12ef13de50e03c76643382123766f96:
>>
>>    leds: triggers: simplify led_trigger_store (2016-03-14 09:22:23 +0100)
>
> All rebased since yesterday for some reason?
>

I just wanted to make sure that no unexpected problem has occurred
after rebasing onto 4.5 release. Is it in some way more advantageous to
base a pull request on rc7, than on a final release?

-- 
Best regards,
Jacek Anaszewski
