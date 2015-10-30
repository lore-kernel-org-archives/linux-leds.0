From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: Workqueue core implementation
Date: Fri, 30 Oct 2015 08:55:23 +0100
Message-ID: <5633226B.1030009@samsung.com>
References: <20151029165905.GA15462@ns3274321.ip-5-39-88.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51158 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758934AbbJ3Hzl (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 30 Oct 2015 03:55:41 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NX000GHVWODPY10@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 30 Oct 2015 07:55:25 +0000 (GMT)
In-reply-to: <20151029165905.GA15462@ns3274321.ip-5-39-88.eu>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vincent Donnefort <vdonnefort@gmail.com>
Cc: linux-leds@vger.kernel.org, simon.guinot@sequanux.org, Sakari Ailus <sakari.ailus@linux.intel.com>

Hi Vincent,

On 10/29/2015 05:59 PM, Vincent Donnefort wrote:
> Hi Jacek,
>
> I saw on your git branch "linux-leds/devel" that you are working on a
> core solution for workqueues with the new led_set_brightness_nopm()
> function and thus you are removing workqueues from leds-* drivers.
>
> Since I'll need to add GPIO can_sleep support to a LED driver, I'm
> interested to know when are you planning to merge this work, to avoid
> to submit a patch to add workqueue which will be quickly deprecated.

I need some acks for these patches. I've already collected a few [1],
but there hasn't been any reply to the patch [2] so far, which removes
the reasons for modifications requested by Sakari in the thread [1].
Now I am waiting for his review of the patch [2] (btw it should be
version 3,1, and not 10.1 - I counted mistakenly also previous RFC
patch sets this time). Nevertheless, if I got acks, or even Tested-by
from you, it would speed up the things significantly.

Cc Sakari.

[1] https://lkml.org/lkml/2015/10/16/591
[2] http://www.spinics.net/lists/linux-leds/msg05045.html

-- 
Best Regards,
Jacek Anaszewski
