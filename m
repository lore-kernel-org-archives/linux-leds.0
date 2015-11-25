From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds/powernv : removing NULL check
Date: Wed, 25 Nov 2015 16:17:39 +0100
Message-ID: <5655D113.50206@samsung.com>
References: <1448270896-23955-1-git-send-email-saurabh.truth@gmail.com>
 <5655C94F.4070504@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:12654 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751915AbbKYPRm (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2015 10:17:42 -0500
In-reply-to: <5655C94F.4070504@linux.vnet.ibm.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Cc: Saurabh Sengar <saurabh.truth@gmail.com>, rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/25/2015 03:44 PM, Vasant Hegde wrote:
> On 11/23/2015 02:58 PM, Saurabh Sengar wrote:
>> no need to explicitly check for pointer to be null,
>> of_prop_next_string anyways return NULL, if passed pointer is NULL
>> and hence loop will continue
>
> Thanks! Patch looks good.
>
> -Vasant
>
>

I infer that you offer your:

Acked-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>

Can I add it? :)

-- 
Best Regards,
Jacek Anaszewski
