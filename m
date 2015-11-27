From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: ns2: Remove work queue
Date: Fri, 27 Nov 2015 12:47:37 +0100
Message-ID: <565842D9.6020801@samsung.com>
References: <1448016268-23024-1-git-send-email-j.anaszewski@samsung.com>
 <20151127111034.GK4665@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:43727 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751726AbbK0Lrk (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 27 Nov 2015 06:47:40 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYH000AQ23E2X80@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 27 Nov 2015 11:47:38 +0000 (GMT)
In-reply-to: <20151127111034.GK4665@kw.sim.vm.gnt>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: linux-leds@vger.kernel.org

Hi Simon,

On 11/27/2015 12:10 PM, Simon Guinot wrote:
> Hi Jacek,
>
> On Fri, Nov 20, 2015 at 11:44:28AM +0100, Jacek Anaszewski wrote:
>> Now the core implements the work queue, remove it from the driver,
>> and switch to using brightness_set_blocking op for 'cansleep' case.
>>
>> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>> Cc: Simon Guinot <simon.guinot@sequanux.org>
>> ---
>>   drivers/leds/leds-ns2.c |   31 +++++++++++++------------------
>>   1 file changed, 13 insertions(+), 18 deletions(-)
>
> Tested-by: Simon Guinot <simon.guinot@sequanux.org>

Thanks for the notification. Tag added.

-- 
Best Regards,
Jacek Anaszewski
