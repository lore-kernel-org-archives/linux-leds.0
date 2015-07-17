From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH/RFC 51/51] leds: ipaq-micro: Mark the LED fast
Date: Fri, 17 Jul 2015 17:37:50 +0200
Message-ID: <55A9214E.8060608@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
 <1437122857-6765-52-git-send-email-j.anaszewski@samsung.com>
 <CACRpkdYLwQ1itBXv63xPvBAiTyhGLLPTFfT2DdXVB5PLaZdcng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:39714 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758537AbbGQPhy (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 17 Jul 2015 11:37:54 -0400
In-reply-to: <CACRpkdYLwQ1itBXv63xPvBAiTyhGLLPTFfT2DdXVB5PLaZdcng@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Stas Sergeev <stsp@users.sourceforge.net>, jacek.anaszewski@gmail.com

On 07/17/2015 03:43 PM, Linus Walleij wrote:
> On Fri, Jul 17, 2015 at 10:47 AM, Jacek Anaszewski
> <j.anaszewski@samsung.com> wrote:
>
>> The driver neither sleeps nor uses delays in its brightness_set
>> op. Mark it fast then.
>>
>> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>
> NACK. The functions called in drivers/mfd/ipaq-micro.c are
> not fast, this need to be dropped.

Oops, indeed I missed that it waits for completion.

Thanks for the review.

-- 
Best Regards,
Jacek Anaszewski
