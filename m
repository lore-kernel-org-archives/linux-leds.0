From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [next:master 11893/11947] drivers/leds/leds-aat1290.c:397:21:
 sparse: symbol 'aat1290_intensity_to_brightness' was not declared. Should it
 be static?
Date: Wed, 17 Jun 2015 17:21:58 +0200
Message-ID: <55819096.1020208@samsung.com>
References: <201506171403.akc8Fj4R%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:8896 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754335AbbFQPWE (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 17 Jun 2015 11:22:04 -0400
In-reply-to: <201506171403.akc8Fj4R%fengguang.wu@intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On 06/17/2015 08:56 AM, kbuild test robot wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ca3cfaa9e7db530b14e4a2d98a9310130152fdb8
> commit: 1da60a5e7198c716990ac6fa508e45e27e7067c0 [11893/11947] Merge remote-tracking branch 'leds/for-next'
> reproduce:
>    # apt-get install sparse
>    git checkout 1da60a5e7198c716990ac6fa508e45e27e7067c0
>    make ARCH=x86_64 allmodconfig
>    make C=1 CF=-D__CHECK_ENDIAN__
>
>
> sparse warnings: (new ones prefixed by >>)
>
>     drivers/leds/leds-aat1290.c:334:5: sparse: symbol 'init_mm_current_scale' was not declared. Should it be static?
>>> drivers/leds/leds-aat1290.c:397:21: sparse: symbol 'aat1290_intensity_to_brightness' was not declared. Should it be static?
>>> drivers/leds/leds-aat1290.c:412:5: sparse: symbol 'aat1290_brightness_to_intensity' was not declared. Should it be static?
>
> Please review and possibly fold the followup patch.

These should be statics. I'll send fixed patches tomorrow.

-- 
Best Regards,
Jacek Anaszewski
