From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: lp3952: Store leds[LP3952_LED_ALL] in struct
 lp3952_led_array
Date: Mon, 18 Jul 2016 09:29:43 +0200
Message-ID: <578C8567.1070802@samsung.com>
References: <1468721898.9106.1.camel@ingics.com> <578C7BD0.80606@samsung.com>
 <CAFRkauAKLnXakKH1qBKyGdTn7-0-z7Gp_7zj7ii6RBK1uXavAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:30233 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751784AbcGRH3r (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 18 Jul 2016 03:29:47 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OAI004JC25K2K10@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 18 Jul 2016 08:29:45 +0100 (BST)
In-reply-to: <CAFRkauAKLnXakKH1qBKyGdTn7-0-z7Gp_7zj7ii6RBK1uXavAA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Tony Makkiel <tony.makkiel@daqri.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On 07/18/2016 08:53 AM, Axel Lin wrote:
>
>
> 2016-07-18 14:48 GMT+08:00 Jacek Anaszewski <j.anaszewski@samsung.com
> <mailto:j.anaszewski@samsung.com>>:
>
>     Hi Axel,
>
>     Thanks for catching this. I missed also redundant devm_kfree here.
>     Would it be OK for you if I merged your cleanup with the original
>     patch and added your Reviewed-by to the commit message instead?
>
>
> That's fine, you can add Reviewed-by: Axel Lin <axel.lin@ingics.com
> <mailto:axel.lin@ingics.com>>.
>
>     This driver hasn't been pushed to the mainline yet, so it would be
>     nice not to introduce its original version with some shortcomings
>     that need to be immediately fixed.

Fixed up the original patch and updated for-next branch of
linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
