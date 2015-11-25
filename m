From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: Re: [PATCH] leds/powernv : removing NULL check
Date: Wed, 25 Nov 2015 22:12:42 +0530
Message-ID: <5655E502.4070202@linux.vnet.ibm.com>
References: <1448270896-23955-1-git-send-email-saurabh.truth@gmail.com> <5655C94F.4070504@linux.vnet.ibm.com> <5655D113.50206@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e28smtp06.in.ibm.com ([122.248.162.6]:38701 "EHLO
	e28smtp06.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753000AbbKYQmx (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2015 11:42:53 -0500
Received: from localhost
	by e28smtp06.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Wed, 25 Nov 2015 22:12:51 +0530
In-Reply-To: <5655D113.50206@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Saurabh Sengar <saurabh.truth@gmail.com>, rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/25/2015 08:47 PM, Jacek Anaszewski wrote:
> On 11/25/2015 03:44 PM, Vasant Hegde wrote:
>> On 11/23/2015 02:58 PM, Saurabh Sengar wrote:
>>> no need to explicitly check for pointer to be null,
>>> of_prop_next_string anyways return NULL, if passed pointer is NULL
>>> and hence loop will continue
>>
>> Thanks! Patch looks good.
>>
>> -Vasant
>>
>>
> 
> I infer that you offer your:

Yes.. Forgot to add Ack-by tag.

> 
> Acked-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
> 
> Can I add it? :)

Sure. Thanks!

-Vasant
